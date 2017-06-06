// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Ines = (function() {
  function Ines(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ines.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    this.rom = this._io.readBytesFull();
  }

  var F7 = Ines.F7 = (function() {
    function F7(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    F7.prototype._read = function() {
      this.upperNibble = this._io.readBitsInt(4);
      this.format = this._io.readBitsInt(2);
      this.arcade2 = this._io.readBitsInt(1) != 0;
      this.arcade1 = this._io.readBitsInt(1) != 0;
    }

    /**
     * Upper nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
     */

    /**
     * If equal to 2, flags 8-15 are in NES 2.0 format
     */

    /**
     * Determines if it made for a Nintendo PlayChoice-10 or not
     */

    /**
     * Determines if it is made for a Nintendo VS Unisystem or not
     */

    return F7;
  })();

  var F6 = Ines.F6 = (function() {
    function F6(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    F6.prototype._read = function() {
      this.lowerNibble = this._io.readBitsInt(4);
      this.ignoreMirror = this._io.readBitsInt(1) != 0;
      this.trainer = this._io.readBitsInt(1) != 0;
      this.hasBatteryRam = this._io.readBitsInt(1) != 0;
      this.mirror = this._io.readBitsInt(1) != 0;
    }

    /**
     * Lower nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
     */

    /**
     * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
     */

    /**
     * 512-byte trainer at $7000-$71FF (stored before PRG data)
     */

    /**
     * If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
     */

    /**
     * if 0, horizontal arrangement. if 1, vertical arrangement
     */

    return F6;
  })();

  var F10 = Ines.F10 = (function() {
    function F10(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    F10.prototype._read = function() {
      this.nothing1 = this._io.readBitsInt(2);
      this.busConflict = this._io.readBitsInt(1) != 0;
      this.prgRam = this._io.readBitsInt(1) != 0;
      this.nothing2 = this._io.readBitsInt(2);
      this.tvSystem = this._io.readBitsInt(2);
    }

    /**
     * If 0, no bus conflicts. If 1, bus conflicts.
     */

    /**
     * If 0, PRG ram is present. If 1, not present.
     */

    /**
     * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
     */

    return F10;
  })();

  var F9 = Ines.F9 = (function() {
    function F9(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    F9.prototype._read = function() {
      this.reserved = this._io.readBitsInt(7);
      this.tvSystem = this._io.readBitsInt(1) != 0;
    }

    /**
     * if 0, NTSC. If 1, PAL.
     */

    return F9;
  })();

  var Header = Ines.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([78, 69, 83, 26]);
      this.prgRomSize = this._io.readU1();
      this.chrRomSize = this._io.readU1();
      this.f6 = new F6(this._io, this, this._root);
      this.f7 = new F7(this._io, this, this._root);
      this.prgRamSize = this._io.readU1();
      this.f9 = new F9(this._io, this, this._root);
      this.f10 = new F10(this._io, this, this._root);
      this.zeroFill = this._io.readBytes(4);
    }

    /**
     * Size of PRG ROM in 16 KB units
     */

    /**
     * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
     */

    /**
     * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
     */

    /**
     * this one is unofficial
     */

    return Header;
  })();
  Object.defineProperty(Ines.prototype, 'mapper', {
    get: function() {
      if (this._m_mapper !== undefined)
        return this._m_mapper;
      this._m_mapper = (this._root.header.f6.lowerNibble | (this._root.header.f7.upperNibble << 4));
      return this._m_mapper;
    }
  });

  return Ines;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Ines', [], function() {
    return Ines;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Ines;
}
