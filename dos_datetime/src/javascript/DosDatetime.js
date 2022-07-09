// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DosDatetime = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * MS-DOS date and time are packed 16-bit values that specify local date/time.
 * The time is always stored in the current UTC time offset set on the computer
 * which created the file. Note that the daylight saving time (DST) shifts
 * also change the UTC time offset.
 * 
 * For example, if you pack two files A and B into a ZIP archive, file A last modified
 * at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
 * the file modification times saved in MS-DOS format in the ZIP file will vary depending
 * on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.
 * 
 *   - If set to GMT:
 *       - file A: 2020-03-29 00:59 (UTC+00:00)
 *       - file B: 2020-03-29 01:00 (UTC+00:00)
 *   - If set to BST:
 *       - file A: 2020-03-29 01:59 (UTC+01:00)
 *       - file B: 2020-03-29 02:00 (UTC+01:00)
 * 
 * It follows that you are unable to determine the actual last modified time
 * of any file stored in the ZIP archive, if you don't know the locale time
 * setting of the computer at the time it created the ZIP.
 * 
 * This format is used in some data formats from the MS-DOS era, for example:
 * 
 *   - [zip](/zip/)
 *   - [rar](/rar/)
 *   - [vfat](/vfat/) (FAT12)
 *   - [lzh](/lzh/)
 *   - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)
 * @see {@link https://docs.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time|Source}
 * @see {@link https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime|Source}
 * @see {@link https://github.com/reactos/reactos/blob/c6b6444/dll/win32/kernel32/client/time.c#L82-L87|DosDateTimeToFileTime}
 * @see {@link https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc|page 25/34}
 */

var DosDatetime = (function() {
  function DosDatetime(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DosDatetime.prototype._read = function() {
    this.time = new Time(this._io, this, this._root);
    this.date = new Date(this._io, this, this._root);
  }

  var Time = DosDatetime.Time = (function() {
    function Time(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Time.prototype._read = function() {
      this.secondDiv2 = this._io.readBitsIntLe(5);
      if (!(this.secondDiv2 <= 29)) {
        throw new KaitaiStream.ValidationGreaterThanError(29, this.secondDiv2, this._io, "/types/time/seq/0");
      }
      this.minute = this._io.readBitsIntLe(6);
      if (!(this.minute <= 59)) {
        throw new KaitaiStream.ValidationGreaterThanError(59, this.minute, this._io, "/types/time/seq/1");
      }
      this.hour = this._io.readBitsIntLe(5);
      if (!(this.hour <= 23)) {
        throw new KaitaiStream.ValidationGreaterThanError(23, this.hour, this._io, "/types/time/seq/2");
      }
    }
    Object.defineProperty(Time.prototype, 'second', {
      get: function() {
        if (this._m_second !== undefined)
          return this._m_second;
        this._m_second = (2 * this.secondDiv2);
        return this._m_second;
      }
    });
    Object.defineProperty(Time.prototype, 'paddedSecond', {
      get: function() {
        if (this._m_paddedSecond !== undefined)
          return this._m_paddedSecond;
        this._m_paddedSecond = (this.second <= 9 ? "0" : "") + (this.second).toString(10);
        return this._m_paddedSecond;
      }
    });
    Object.defineProperty(Time.prototype, 'paddedMinute', {
      get: function() {
        if (this._m_paddedMinute !== undefined)
          return this._m_paddedMinute;
        this._m_paddedMinute = (this.minute <= 9 ? "0" : "") + (this.minute).toString(10);
        return this._m_paddedMinute;
      }
    });
    Object.defineProperty(Time.prototype, 'paddedHour', {
      get: function() {
        if (this._m_paddedHour !== undefined)
          return this._m_paddedHour;
        this._m_paddedHour = (this.hour <= 9 ? "0" : "") + (this.hour).toString(10);
        return this._m_paddedHour;
      }
    });

    return Time;
  })();

  var Date = DosDatetime.Date = (function() {
    function Date(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Date.prototype._read = function() {
      this.day = this._io.readBitsIntLe(5);
      if (!(this.day >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.day, this._io, "/types/date/seq/0");
      }
      this.month = this._io.readBitsIntLe(4);
      if (!(this.month >= 1)) {
        throw new KaitaiStream.ValidationLessThanError(1, this.month, this._io, "/types/date/seq/1");
      }
      if (!(this.month <= 12)) {
        throw new KaitaiStream.ValidationGreaterThanError(12, this.month, this._io, "/types/date/seq/1");
      }
      this.yearMinus1980 = this._io.readBitsIntLe(7);
    }

    /**
     * only years from 1980 to 2107 (1980 + 127) can be represented
     */
    Object.defineProperty(Date.prototype, 'year', {
      get: function() {
        if (this._m_year !== undefined)
          return this._m_year;
        this._m_year = (1980 + this.yearMinus1980);
        return this._m_year;
      }
    });
    Object.defineProperty(Date.prototype, 'paddedDay', {
      get: function() {
        if (this._m_paddedDay !== undefined)
          return this._m_paddedDay;
        this._m_paddedDay = (this.day <= 9 ? "0" : "") + (this.day).toString(10);
        return this._m_paddedDay;
      }
    });
    Object.defineProperty(Date.prototype, 'paddedMonth', {
      get: function() {
        if (this._m_paddedMonth !== undefined)
          return this._m_paddedMonth;
        this._m_paddedMonth = (this.month <= 9 ? "0" : "") + (this.month).toString(10);
        return this._m_paddedMonth;
      }
    });
    Object.defineProperty(Date.prototype, 'paddedYear', {
      get: function() {
        if (this._m_paddedYear !== undefined)
          return this._m_paddedYear;
        this._m_paddedYear = (this.year <= 999 ? "0" + (this.year <= 99 ? "0" + (this.year <= 9 ? "0" : "") : "") : "") + (this.year).toString(10);
        return this._m_paddedYear;
      }
    });

    return Date;
  })();

  return DosDatetime;
})();
return DosDatetime;
}));
