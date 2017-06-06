<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Ines extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Ines $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Ines\Header($this->_io, $this, $this->_root);
        $this->_m_rom = $this->_io->readBytesFull();
    }
    protected $_m_mapper;
    public function mapper() {
        if ($this->_m_mapper !== null)
            return $this->_m_mapper;
        $this->_m_mapper = ($this->_root()->header()->f6()->lowerNibble() | ($this->_root()->header()->f7()->upperNibble() << 4));
        return $this->_m_mapper;
    }
    protected $_m_header;
    protected $_m_rom;
    public function header() { return $this->_m_header; }
    public function rom() { return $this->_m_rom; }
}

namespace \Ines;

class F7 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ines\Header $parent = null, \Ines $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_upperNibble = $this->_io->readBitsInt(4);
        $this->_m_format = $this->_io->readBitsInt(2);
        $this->_m_arcade2 = $this->_io->readBitsInt(1) != 0;
        $this->_m_arcade1 = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_upperNibble;
    protected $_m_format;
    protected $_m_arcade2;
    protected $_m_arcade1;

    /**
     * Upper nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
     */
    public function upperNibble() { return $this->_m_upperNibble; }

    /**
     * If equal to 2, flags 8-15 are in NES 2.0 format
     */
    public function format() { return $this->_m_format; }

    /**
     * Determines if it made for a Nintendo PlayChoice-10 or not
     */
    public function arcade2() { return $this->_m_arcade2; }

    /**
     * Determines if it is made for a Nintendo VS Unisystem or not
     */
    public function arcade1() { return $this->_m_arcade1; }
}

namespace \Ines;

class F6 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ines\Header $parent = null, \Ines $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lowerNibble = $this->_io->readBitsInt(4);
        $this->_m_ignoreMirror = $this->_io->readBitsInt(1) != 0;
        $this->_m_trainer = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasBatteryRam = $this->_io->readBitsInt(1) != 0;
        $this->_m_mirror = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_lowerNibble;
    protected $_m_ignoreMirror;
    protected $_m_trainer;
    protected $_m_hasBatteryRam;
    protected $_m_mirror;

    /**
     * Lower nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
     */
    public function lowerNibble() { return $this->_m_lowerNibble; }

    /**
     * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
     */
    public function ignoreMirror() { return $this->_m_ignoreMirror; }

    /**
     * 512-byte trainer at $7000-$71FF (stored before PRG data)
     */
    public function trainer() { return $this->_m_trainer; }

    /**
     * If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
     */
    public function hasBatteryRam() { return $this->_m_hasBatteryRam; }

    /**
     * if 0, horizontal arrangement. if 1, vertical arrangement
     */
    public function mirror() { return $this->_m_mirror; }
}

namespace \Ines;

class F10 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ines\Header $parent = null, \Ines $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_nothing1 = $this->_io->readBitsInt(2);
        $this->_m_busConflict = $this->_io->readBitsInt(1) != 0;
        $this->_m_prgRam = $this->_io->readBitsInt(1) != 0;
        $this->_m_nothing2 = $this->_io->readBitsInt(2);
        $this->_m_tvSystem = $this->_io->readBitsInt(2);
    }
    protected $_m_nothing1;
    protected $_m_busConflict;
    protected $_m_prgRam;
    protected $_m_nothing2;
    protected $_m_tvSystem;
    public function nothing1() { return $this->_m_nothing1; }

    /**
     * If 0, no bus conflicts. If 1, bus conflicts.
     */
    public function busConflict() { return $this->_m_busConflict; }

    /**
     * If 0, PRG ram is present. If 1, not present.
     */
    public function prgRam() { return $this->_m_prgRam; }
    public function nothing2() { return $this->_m_nothing2; }

    /**
     * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
     */
    public function tvSystem() { return $this->_m_tvSystem; }
}

namespace \Ines;

class F9 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ines\Header $parent = null, \Ines $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved = $this->_io->readBitsInt(7);
        $this->_m_tvSystem = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_reserved;
    protected $_m_tvSystem;
    public function reserved() { return $this->_m_reserved; }

    /**
     * if 0, NTSC. If 1, PAL.
     */
    public function tvSystem() { return $this->_m_tvSystem; }
}

namespace \Ines;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Ines $parent = null, \Ines $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x4E\x45\x53\x1A");
        $this->_m_prgRomSize = $this->_io->readU1();
        $this->_m_chrRomSize = $this->_io->readU1();
        $this->_m_f6 = new \Ines\F6($this->_io, $this, $this->_root);
        $this->_m_f7 = new \Ines\F7($this->_io, $this, $this->_root);
        $this->_m_prgRamSize = $this->_io->readU1();
        $this->_m_f9 = new \Ines\F9($this->_io, $this, $this->_root);
        $this->_m_f10 = new \Ines\F10($this->_io, $this, $this->_root);
        $this->_m_zeroFill = $this->_io->readBytes(4);
    }
    protected $_m_magic;
    protected $_m_prgRomSize;
    protected $_m_chrRomSize;
    protected $_m_f6;
    protected $_m_f7;
    protected $_m_prgRamSize;
    protected $_m_f9;
    protected $_m_f10;
    protected $_m_zeroFill;
    public function magic() { return $this->_m_magic; }

    /**
     * Size of PRG ROM in 16 KB units
     */
    public function prgRomSize() { return $this->_m_prgRomSize; }

    /**
     * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
     */
    public function chrRomSize() { return $this->_m_chrRomSize; }
    public function f6() { return $this->_m_f6; }
    public function f7() { return $this->_m_f7; }

    /**
     * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
     */
    public function prgRamSize() { return $this->_m_prgRamSize; }
    public function f9() { return $this->_m_f9; }

    /**
     * this one is unofficial
     */
    public function f10() { return $this->_m_f10; }
    public function zeroFill() { return $this->_m_zeroFill; }
}
