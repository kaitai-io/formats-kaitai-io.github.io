// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 * @see {@link https://msdn.microsoft.com/en-us/library/windows/desktop/ms724950.aspx|Source}
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

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('WindowsSystemtime', [], function() {
    return WindowsSystemtime;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = WindowsSystemtime;
}
