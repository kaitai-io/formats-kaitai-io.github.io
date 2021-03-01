// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.WindowsSystemtime = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 * @see {@link https://docs.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime|Source}
 */

var WindowsSystemtime = (function() {
  function WindowsSystemtime(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  WindowsSystemtime.prototype._read = function() {
    this.year = this._io.readU2le();
    this.month = this._io.readU2le();
    this.dow = this._io.readU2le();
    this.day = this._io.readU2le();
    this.hour = this._io.readU2le();
    this.min = this._io.readU2le();
    this.sec = this._io.readU2le();
    this.msec = this._io.readU2le();
  }

  /**
   * Year
   */

  /**
   * Month (January = 1)
   */

  /**
   * Day of week (Sun = 0)
   */

  /**
   * Day of month
   */

  /**
   * Hours
   */

  /**
   * Minutes
   */

  /**
   * Seconds
   */

  /**
   * Milliseconds
   */

  return WindowsSystemtime;
})();
return WindowsSystemtime;
}));
