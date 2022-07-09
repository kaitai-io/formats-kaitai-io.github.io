// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.GlibcUtmp = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var GlibcUtmp = (function() {
  GlibcUtmp.EntryType = Object.freeze({
    EMPTY: 0,
    RUN_LVL: 1,
    BOOT_TIME: 2,
    NEW_TIME: 3,
    OLD_TIME: 4,
    INIT_PROCESS: 5,
    LOGIN_PROCESS: 6,
    USER_PROCESS: 7,
    DEAD_PROCESS: 8,
    ACCOUNTING: 9,

    0: "EMPTY",
    1: "RUN_LVL",
    2: "BOOT_TIME",
    3: "NEW_TIME",
    4: "OLD_TIME",
    5: "INIT_PROCESS",
    6: "LOGIN_PROCESS",
    7: "USER_PROCESS",
    8: "DEAD_PROCESS",
    9: "ACCOUNTING",
  });

  function GlibcUtmp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GlibcUtmp.prototype._read = function() {
    this._raw_records = [];
    this.records = [];
    var i = 0;
    while (!this._io.isEof()) {
      this._raw_records.push(this._io.readBytes(384));
      var _io__raw_records = new KaitaiStream(this._raw_records[this._raw_records.length - 1]);
      this.records.push(new Record(_io__raw_records, this, this._root));
      i++;
    }
  }

  var Record = GlibcUtmp.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.utType = this._io.readS4le();
      this.pid = this._io.readU4le();
      this.line = KaitaiStream.bytesToStr(this._io.readBytes(32), "UTF-8");
      this.id = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
      this.user = KaitaiStream.bytesToStr(this._io.readBytes(32), "UTF-8");
      this.host = KaitaiStream.bytesToStr(this._io.readBytes(256), "UTF-8");
      this.exit = this._io.readU4le();
      this.session = this._io.readS4le();
      this.tv = new Timeval(this._io, this, this._root);
      this.addrV6 = this._io.readBytes(16);
      this.reserved = this._io.readBytes(20);
    }

    /**
     * Type of login
     */

    /**
     * Process ID of login process
     */

    /**
     * Devicename
     */

    /**
     * Inittab ID
     */

    /**
     * Username
     */

    /**
     * Hostname for remote login
     */

    /**
     * Exit status of a process marked as DEAD_PROCESS
     */

    /**
     * Session ID, used for windowing
     */

    /**
     * Time entry was made
     */

    /**
     * Internet address of remote host
     */

    return Record;
  })();

  var Timeval = GlibcUtmp.Timeval = (function() {
    function Timeval(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Timeval.prototype._read = function() {
      this.sec = this._io.readS4le();
      this.usec = this._io.readS4le();
    }

    /**
     * Seconds
     */

    /**
     * Microseconds
     */

    return Timeval;
  })();

  return GlibcUtmp;
})();
return GlibcUtmp;
}));
