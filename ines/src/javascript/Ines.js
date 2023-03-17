// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Ines = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://www.nesdev.org/wiki/INES|Source}
 */

var Ines = (function() {
  function Ines(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Ines.prototype._read = function() {
    this._raw_header = this._io.readBytes(16);
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new Header(_io__raw_header, this, this._root);
    if (this.header.f6.trainer) {
      this.trainer = this._io.readBytes(512);
    }
    this.prgRom = this._io.readBytes((this.header.lenPrgRom * 16384));
    this.chrRom = this._io.readBytes((this.header.lenChrRom * 8192));
    if (this.header.f7.playchoice10) {
      this.playchoice10 = new Playchoice10(this._io, this, this._root);
    }
    if (!(this._io.isEof())) {
      this.title = KaitaiStream.bytesToStr(this._io.readBytesFull(), "ASCII");
    }
  }

  var Header = Ines.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [78, 69, 83, 26]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([78, 69, 83, 26], this.magic, this._io, "/types/header/seq/0");
      }
      this.lenPrgRom = this._io.readU1();
      this.lenChrRom = this._io.readU1();
      this._raw_f6 = this._io.readBytes(1);
      var _io__raw_f6 = new KaitaiStream(this._raw_f6);
      this.f6 = new F6(_io__raw_f6, this, this._root);
      this._raw_f7 = this._io.readBytes(1);
      var _io__raw_f7 = new KaitaiStream(this._raw_f7);
      this.f7 = new F7(_io__raw_f7, this, this._root);
      this.lenPrgRam = this._io.readU1();
      this._raw_f9 = this._io.readBytes(1);
      var _io__raw_f9 = new KaitaiStream(this._raw_f9);
      this.f9 = new F9(_io__raw_f9, this, this._root);
      this._raw_f10 = this._io.readBytes(1);
      var _io__raw_f10 = new KaitaiStream(this._raw_f10);
      this.f10 = new F10(_io__raw_f10, this, this._root);
      this.reserved = this._io.readBytes(5);
      if (!((KaitaiStream.byteArrayCompare(this.reserved, [0, 0, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 0, 0], this.reserved, this._io, "/types/header/seq/8");
      }
    }

    /**
     * @see {@link https://www.nesdev.org/wiki/INES#Flags_6|Source}
     */

    var F6 = Header.F6 = (function() {
      F6.Mirroring = Object.freeze({
        HORIZONTAL: 0,
        VERTICAL: 1,

        0: "HORIZONTAL",
        1: "VERTICAL",
      });

      function F6(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      F6.prototype._read = function() {
        this.lowerMapper = this._io.readBitsIntBe(4);
        this.fourScreen = this._io.readBitsIntBe(1) != 0;
        this.trainer = this._io.readBitsIntBe(1) != 0;
        this.hasBatteryRam = this._io.readBitsIntBe(1) != 0;
        this.mirroring = this._io.readBitsIntBe(1);
      }

      /**
       * Lower nibble of mapper number
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

    /**
     * @see {@link https://www.nesdev.org/wiki/INES#Flags_7|Source}
     */

    var F7 = Header.F7 = (function() {
      function F7(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      F7.prototype._read = function() {
        this.upperMapper = this._io.readBitsIntBe(4);
        this.format = this._io.readBitsIntBe(2);
        this.playchoice10 = this._io.readBitsIntBe(1) != 0;
        this.vsUnisystem = this._io.readBitsIntBe(1) != 0;
      }

      /**
       * Upper nibble of mapper number
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

    /**
     * @see {@link https://www.nesdev.org/wiki/INES#Flags_9|Source}
     */

    var F9 = Header.F9 = (function() {
      F9.TvSystem = Object.freeze({
        NTSC: 0,
        PAL: 1,

        0: "NTSC",
        1: "PAL",
      });

      function F9(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      F9.prototype._read = function() {
        this.reserved = this._io.readBitsIntBe(7);
        this.tvSystem = this._io.readBitsIntBe(1);
      }

      /**
       * if 0, NTSC. If 1, PAL.
       */

      return F9;
    })();

    /**
     * @see {@link https://www.nesdev.org/wiki/INES#Flags_10|Source}
     */

    var F10 = Header.F10 = (function() {
      F10.TvSystem = Object.freeze({
        NTSC: 0,
        DUAL1: 1,
        PAL: 2,
        DUAL2: 3,

        0: "NTSC",
        1: "DUAL1",
        2: "PAL",
        3: "DUAL2",
      });

      function F10(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      F10.prototype._read = function() {
        this.reserved1 = this._io.readBitsIntBe(2);
        this.busConflict = this._io.readBitsIntBe(1) != 0;
        this.prgRam = this._io.readBitsIntBe(1) != 0;
        this.reserved2 = this._io.readBitsIntBe(2);
        this.tvSystem = this._io.readBitsIntBe(2);
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

    /**
     * @see {@link https://www.nesdev.org/wiki/Mapper|Source}
     */
    Object.defineProperty(Header.prototype, 'mapper', {
      get: function() {
        if (this._m_mapper !== undefined)
          return this._m_mapper;
        this._m_mapper = (this.f6.lowerMapper | (this.f7.upperMapper << 4));
        return this._m_mapper;
      }
    });

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

  /**
   * @see {@link https://www.nesdev.org/wiki/PC10_ROM-Images|Source}
   */

  var Playchoice10 = Ines.Playchoice10 = (function() {
    function Playchoice10(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Playchoice10.prototype._read = function() {
      this.instRom = this._io.readBytes(8192);
      this.prom = new Prom(this._io, this, this._root);
    }

    var Prom = Playchoice10.Prom = (function() {
      function Prom(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Prom.prototype._read = function() {
        this.data = this._io.readBytes(16);
        this.counterOut = this._io.readBytes(16);
      }

      return Prom;
    })();

    return Playchoice10;
  })();

  return Ines;
})();
return Ines;
}));
