// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.SudoersTs = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * This spec can be used to parse sudo time stamp files located in directories
 * such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
 * @see {@link https://www.sudo.ws/man/1.8.27/sudoers_timestamp.man.html|Source}
 */

var SudoersTs = (function() {
  SudoersTs.TsType = Object.freeze({
    GLOBAL: 1,
    TTY: 2,
    PPID: 3,
    LOCKEXCL: 4,

    1: "GLOBAL",
    2: "TTY",
    3: "PPID",
    4: "LOCKEXCL",
  });

  function SudoersTs(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SudoersTs.prototype._read = function() {
    this.records = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.records.push(new Record(this._io, this, this._root));
      i++;
    }
  }

  var RecordV2 = SudoersTs.RecordV2 = (function() {
    function RecordV2(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RecordV2.prototype._read = function() {
      this.type = this._io.readU2le();
      this.flags = new TsFlag(this._io, this, this._root);
      this.authUid = this._io.readU4le();
      this.sid = this._io.readU4le();
      this.startTime = new Timespec(this._io, this, this._root);
      this.ts = new Timespec(this._io, this, this._root);
      if (this.type == SudoersTs.TsType.TTY) {
        this.ttydev = this._io.readU4le();
      }
      if (this.type == SudoersTs.TsType.PPID) {
        this.ppid = this._io.readU4le();
      }
    }

    /**
     * record type
     */

    /**
     * record flags
     */

    /**
     * user ID that was used for authentication
     */

    /**
     * ID of the user's terminal session, if present (when type is TS_TTY)
     */

    /**
     * start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
     */

    /**
     * actual time stamp, from a monotonic time source
     */

    /**
     * device number of the terminal associated with the session
     */

    /**
     * ID of the parent process
     */

    return RecordV2;
  })();

  var TsFlag = SudoersTs.TsFlag = (function() {
    function TsFlag(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TsFlag.prototype._read = function() {
      this.reserved0 = this._io.readBitsIntBe(6);
      this.anyuid = this._io.readBitsIntBe(1) != 0;
      this.disabled = this._io.readBitsIntBe(1) != 0;
      this.reserved1 = this._io.readBitsIntBe(8);
    }

    /**
     * Reserved (unused) bits
     */

    /**
     * ignore uid
     */

    /**
     * entry disabled
     */

    /**
     * Reserved (unused) bits
     */

    return TsFlag;
  })();

  var RecordV1 = SudoersTs.RecordV1 = (function() {
    function RecordV1(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RecordV1.prototype._read = function() {
      this.type = this._io.readU2le();
      this.flags = new TsFlag(this._io, this, this._root);
      this.authUid = this._io.readU4le();
      this.sid = this._io.readU4le();
      this.ts = new Timespec(this._io, this, this._root);
      if (this.type == SudoersTs.TsType.TTY) {
        this.ttydev = this._io.readU4le();
      }
      if (this.type == SudoersTs.TsType.PPID) {
        this.ppid = this._io.readU4le();
      }
    }

    /**
     * record type
     */

    /**
     * record flags
     */

    /**
     * user ID that was used for authentication
     */

    /**
     * session ID associated with tty/ppid
     */

    /**
     * time stamp, from a monotonic time source
     */

    /**
     * device number of the terminal associated with the session
     */

    /**
     * ID of the parent process
     */

    return RecordV1;
  })();

  var Timespec = SudoersTs.Timespec = (function() {
    function Timespec(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Timespec.prototype._read = function() {
      this.sec = this._io.readS8le();
      this.nsec = this._io.readS8le();
    }

    /**
     * seconds
     */

    /**
     * nanoseconds
     */

    return Timespec;
  })();

  var Record = SudoersTs.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.version = this._io.readU2le();
      this.lenRecord = this._io.readU2le();
      switch (this.version) {
      case 1:
        this._raw_payload = this._io.readBytes((this.lenRecord - 4));
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new RecordV1(_io__raw_payload, this, this._root);
        break;
      case 2:
        this._raw_payload = this._io.readBytes((this.lenRecord - 4));
        var _io__raw_payload = new KaitaiStream(this._raw_payload);
        this.payload = new RecordV2(_io__raw_payload, this, this._root);
        break;
      default:
        this.payload = this._io.readBytes((this.lenRecord - 4));
        break;
      }
    }

    /**
     * version number of the timestamp_entry struct
     */

    /**
     * size of the record in bytes
     */

    return Record;
  })();

  return SudoersTs;
})();
return SudoersTs;
}));
