// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.AixUtmp || (root.AixUtmp = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (AixUtmp_, KaitaiStream) {
/**
 * This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
 * @see {@link https://www.ibm.com/docs/en/aix/7.1?topic=files-utmph-file|Source}
 */

var AixUtmp = (function() {
  AixUtmp.EntryType = Object.freeze({
    EMPTY: 0,
    RUN_LVL: 1,
    BOOT_TIME: 2,
    OLD_TIME: 3,
    NEW_TIME: 4,
    INIT_PROCESS: 5,
    LOGIN_PROCESS: 6,
    USER_PROCESS: 7,
    DEAD_PROCESS: 8,
    ACCOUNTING: 9,

    0: "EMPTY",
    1: "RUN_LVL",
    2: "BOOT_TIME",
    3: "OLD_TIME",
    4: "NEW_TIME",
    5: "INIT_PROCESS",
    6: "LOGIN_PROCESS",
    7: "USER_PROCESS",
    8: "DEAD_PROCESS",
    9: "ACCOUNTING",
  });

  function AixUtmp(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AixUtmp.prototype._read = function() {
    this.records = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.records.push(new Record(this._io, this, this._root));
      i++;
    }
  }

  var ExitStatus = AixUtmp.ExitStatus = (function() {
    function ExitStatus(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    ExitStatus.prototype._read = function() {
      this.terminationCode = this._io.readS2be();
      this.exitCode = this._io.readS2be();
    }

    /**
     * process termination status
     */

    /**
     * process exit status
     */

    return ExitStatus;
  })();

  var Record = AixUtmp.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Record.prototype._read = function() {
      this.user = KaitaiStream.bytesToStr(this._io.readBytes(256), "ASCII");
      this.inittabId = KaitaiStream.bytesToStr(this._io.readBytes(14), "ASCII");
      this.device = KaitaiStream.bytesToStr(this._io.readBytes(64), "ASCII");
      this.pid = this._io.readU8be();
      this.type = this._io.readS2be();
      this.timestamp = this._io.readS8be();
      this.exitStatus = new ExitStatus(this._io, this, this._root);
      this.hostname = KaitaiStream.bytesToStr(this._io.readBytes(256), "ASCII");
      this.dblWordPad = this._io.readS4be();
      this.reservedA = this._io.readBytes(8);
      this.reservedV = this._io.readBytes(24);
    }

    /**
     * User login name
     */

    /**
     * /etc/inittab id
     */

    /**
     * device name (console, lnxx)
     */

    /**
     * process id
     */

    /**
     * Type of login
     */

    /**
     * time entry was made
     */

    /**
     * the exit status of a process marked as DEAD PROCESS
     */

    /**
     * host name
     */

    return Record;
  })();

  return AixUtmp;
})();
AixUtmp_.AixUtmp = AixUtmp;
});
