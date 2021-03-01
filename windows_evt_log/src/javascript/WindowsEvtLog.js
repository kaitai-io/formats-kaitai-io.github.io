// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.WindowsEvtLog = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * EVT files are Windows Event Log files written by older Windows
 * operating systems (2000, XP, 2003). They are used as binary log
 * files by several major Windows subsystems and
 * applications. Typically, several of them can be found in
 * `%WINDIR%\system32\config` directory:
 * 
 * * Application = `AppEvent.evt`
 * * System = `SysEvent.evt`
 * * Security = `SecEvent.evt`
 * 
 * Alternatively, one can export any system event log as distinct .evt
 * file using relevant option in Event Viewer application.
 * 
 * A Windows application can submit an entry into these logs using
 * [ReportEventA](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-reporteventa)
 * function of Windows API.
 * 
 * Internally, EVT files consist of a fixed-size header and event
 * records. There are several usage scenarios (non-wrapping vs wrapping
 * log files) which result in slightly different organization of
 * records.
 * @see {@link https://docs.microsoft.com/en-us/windows/win32/eventlog/event-log-file-format|Source}
 */

var WindowsEvtLog = (function() {
  function WindowsEvtLog(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  WindowsEvtLog.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    this.records = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.records.push(new Record(this._io, this, this._root));
      i++;
    }
  }

  /**
   * @see {@link https://docs.microsoft.com/en-us/previous-versions/windows/desktop/legacy/bb309024(v=vs.85)|Source}
   */

  var Header = WindowsEvtLog.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.lenHeader = this._io.readU4le();
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [76, 102, 76, 101]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([76, 102, 76, 101], this.magic, this._io, "/types/header/seq/1");
      }
      this.versionMajor = this._io.readU4le();
      this.versionMinor = this._io.readU4le();
      this.ofsStart = this._io.readU4le();
      this.ofsEnd = this._io.readU4le();
      this.curRecIdx = this._io.readU4le();
      this.oldestRecIdx = this._io.readU4le();
      this.lenFileMax = this._io.readU4le();
      this.flags = new Flags(this._io, this, this._root);
      this.retention = this._io.readU4le();
      this.lenHeader2 = this._io.readU4le();
    }

    var Flags = Header.Flags = (function() {
      function Flags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Flags.prototype._read = function() {
        this.reserved = this._io.readBitsIntBe(28);
        this.archive = this._io.readBitsIntBe(1) != 0;
        this.logFull = this._io.readBitsIntBe(1) != 0;
        this.wrap = this._io.readBitsIntBe(1) != 0;
        this.dirty = this._io.readBitsIntBe(1) != 0;
      }

      /**
       * True if archive attribute has been set for this log file.
       */

      /**
       * True if last write operation failed due to log being full.
       */

      /**
       * True if wrapping of record has occured.
       */

      /**
       * True if write operation was in progress, but log file
       * wasn't properly closed.
       */

      return Flags;
    })();

    /**
     * Size of the header structure, must be 0x30.
     */

    /**
     * Offset of oldest record kept in this log file.
     */

    /**
     * Offset of EOF log record, which is a placeholder for new record.
     */

    /**
     * Index of current record, where a new submission would be
     * written to (normally there should to EOF log record there).
     */

    /**
     * Index of oldest record in the log file
     */

    /**
     * Total maximum size of the log file
     */

    /**
     * Size of the header structure repeated again, and again it must be 0x30.
     */

    return Header;
  })();

  /**
   * @see {@link https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord|Source}
   */

  var Record = WindowsEvtLog.Record = (function() {
    function Record(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Record.prototype._read = function() {
      this.lenRecord = this._io.readU4le();
      this.type = this._io.readU4le();
      switch (this.type) {
      case 1699505740:
        this._raw_body = this._io.readBytes((this.lenRecord - 12));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new RecordBody(_io__raw_body, this, this._root);
        break;
      case 286331153:
        this._raw_body = this._io.readBytes((this.lenRecord - 12));
        var _io__raw_body = new KaitaiStream(this._raw_body);
        this.body = new CursorRecordBody(_io__raw_body, this, this._root);
        break;
      default:
        this.body = this._io.readBytes((this.lenRecord - 12));
        break;
      }
      this.lenRecord2 = this._io.readU4le();
    }

    /**
     * Size of whole record, including all headers, footers and data
     */

    /**
     * Type of record. Normal log records specify "LfLe"
     * (0x654c664c) in this field, cursor records use 0x11111111.
     */

    /**
     * Record body interpretation depends on type of record. Body
     * size is specified in a way that it won't include a 8-byte
     * "header" (`len_record` + `type`) and a "footer"
     * (`len_record2`).
     */

    /**
     * Size of whole record again.
     */

    return Record;
  })();

  /**
   * @see {@link https://docs.microsoft.com/en-us/windows/win32/api/winnt/ns-winnt-eventlogrecord|Source}
   */

  var RecordBody = WindowsEvtLog.RecordBody = (function() {
    RecordBody.EventTypes = Object.freeze({
      ERROR: 1,
      AUDIT_FAILURE: 2,
      AUDIT_SUCCESS: 3,
      INFO: 4,
      WARNING: 5,

      1: "ERROR",
      2: "AUDIT_FAILURE",
      3: "AUDIT_SUCCESS",
      4: "INFO",
      5: "WARNING",
    });

    function RecordBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RecordBody.prototype._read = function() {
      this.idx = this._io.readU4le();
      this.timeGenerated = this._io.readU4le();
      this.timeWritten = this._io.readU4le();
      this.eventId = this._io.readU4le();
      this.eventType = this._io.readU2le();
      this.numStrings = this._io.readU2le();
      this.eventCategory = this._io.readU2le();
      this.reserved = this._io.readBytes(6);
      this.ofsStrings = this._io.readU4le();
      this.lenUserSid = this._io.readU4le();
      this.ofsUserSid = this._io.readU4le();
      this.lenData = this._io.readU4le();
      this.ofsData = this._io.readU4le();
    }
    Object.defineProperty(RecordBody.prototype, 'userSid', {
      get: function() {
        if (this._m_userSid !== undefined)
          return this._m_userSid;
        var _pos = this._io.pos;
        this._io.seek((this.ofsUserSid - 8));
        this._m_userSid = this._io.readBytes(this.lenUserSid);
        this._io.seek(_pos);
        return this._m_userSid;
      }
    });
    Object.defineProperty(RecordBody.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        var _pos = this._io.pos;
        this._io.seek((this.ofsData - 8));
        this._m_data = this._io.readBytes(this.lenData);
        this._io.seek(_pos);
        return this._m_data;
      }
    });

    /**
     * Index of record in the file.
     */

    /**
     * Time when this record was generated, POSIX timestamp format.
     */

    /**
     * Time when thsi record was written into the log file, POSIX timestamp format.
     */

    /**
     * Identifier of an event, meaning is specific to particular
     * source of events / event type.
     */

    /**
     * Type of event.
     * @see {@link https://docs.microsoft.com/en-us/windows/win32/eventlog/event-types|Source}
     */

    /**
     * Number of strings present in the log.
     */

    /**
     * @see {@link https://docs.microsoft.com/en-us/windows/win32/eventlog/event-categories|Source}
     */

    /**
     * Offset of strings present in the log
     */

    return RecordBody;
  })();

  /**
   * @see {@link http://www.forensicswiki.xyz/page/Windows_Event_Log_(EVT)#Cursor_Record|Source}
   */

  var CursorRecordBody = WindowsEvtLog.CursorRecordBody = (function() {
    function CursorRecordBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    CursorRecordBody.prototype._read = function() {
      this.magic = this._io.readBytes(12);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([34, 34, 34, 34, 51, 51, 51, 51, 68, 68, 68, 68], this.magic, this._io, "/types/cursor_record_body/seq/0");
      }
      this.ofsFirstRecord = this._io.readU4le();
      this.ofsNextRecord = this._io.readU4le();
      this.idxNextRecord = this._io.readU4le();
      this.idxFirstRecord = this._io.readU4le();
    }

    return CursorRecordBody;
  })();

  return WindowsEvtLog;
})();
return WindowsEvtLog;
}));
