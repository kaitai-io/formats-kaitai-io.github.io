<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Ines extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_header = $this->_io->readBytes(16);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_header);
        $this->_m_header = new \Ines\Header($io, $this, $this->_root);
        if ($this->header()->f6()->trainer()) {
            $this->_m_trainer = $this->_io->readBytes(512);
        }
        $this->_m_prgRom = $this->_io->readBytes(($this->header()->lenPrgRom() * 16384));
        $this->_m_chrRom = $this->_io->readBytes(($this->header()->lenChrRom() * 8192));
        if ($this->header()->f7()->playchoice10()) {
            $this->_m_playchoice10 = new \Ines\Playchoice10($this->_io, $this, $this->_root);
        }
        if (!($this->_io()->isEof())) {
            $this->_m_title = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "ASCII");
        }
    }
    protected $_m_header;
    protected $_m_trainer;
    protected $_m_prgRom;
    protected $_m_chrRom;
    protected $_m_playchoice10;
    protected $_m_title;
    protected $_m__raw_header;
    public function header() { return $this->_m_header; }
    public function trainer() { return $this->_m_trainer; }
    public function prgRom() { return $this->_m_prgRom; }
    public function chrRom() { return $this->_m_chrRom; }
    public function playchoice10() { return $this->_m_playchoice10; }
    public function title() { return $this->_m_title; }
    public function _raw_header() { return $this->_m__raw_header; }
}

namespace \Ines;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ines $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x4E\x45\x53\x1A");
        $this->_m_lenPrgRom = $this->_io->readU1();
        $this->_m_lenChrRom = $this->_io->readU1();
        $this->_m__raw_f6 = $this->_io->readBytes(1);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_f6);
        $this->_m_f6 = new \Ines\Header\F6($io, $this, $this->_root);
        $this->_m__raw_f7 = $this->_io->readBytes(1);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_f7);
        $this->_m_f7 = new \Ines\Header\F7($io, $this, $this->_root);
        $this->_m_lenPrgRam = $this->_io->readU1();
        $this->_m__raw_f9 = $this->_io->readBytes(1);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_f9);
        $this->_m_f9 = new \Ines\Header\F9($io, $this, $this->_root);
        $this->_m__raw_f10 = $this->_io->readBytes(1);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_f10);
        $this->_m_f10 = new \Ines\Header\F10($io, $this, $this->_root);
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00\x00\x00\x00\x00");
    }
    protected $_m_mapper;
    public function mapper() {
        if ($this->_m_mapper !== null)
            return $this->_m_mapper;
        $this->_m_mapper = ($this->f6()->lowerMapper() | ($this->f7()->upperMapper() << 4));
        return $this->_m_mapper;
    }
    protected $_m_magic;
    protected $_m_lenPrgRom;
    protected $_m_lenChrRom;
    protected $_m_f6;
    protected $_m_f7;
    protected $_m_lenPrgRam;
    protected $_m_f9;
    protected $_m_f10;
    protected $_m_reserved;
    protected $_m__raw_f6;
    protected $_m__raw_f7;
    protected $_m__raw_f9;
    protected $_m__raw_f10;
    public function magic() { return $this->_m_magic; }

    /**
     * Size of PRG ROM in 16 KB units
     */
    public function lenPrgRom() { return $this->_m_lenPrgRom; }

    /**
     * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
     */
    public function lenChrRom() { return $this->_m_lenChrRom; }
    public function f6() { return $this->_m_f6; }
    public function f7() { return $this->_m_f7; }

    /**
     * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
     */
    public function lenPrgRam() { return $this->_m_lenPrgRam; }
    public function f9() { return $this->_m_f9; }

    /**
     * this one is unofficial
     */
    public function f10() { return $this->_m_f10; }
    public function reserved() { return $this->_m_reserved; }
    public function _raw_f6() { return $this->_m__raw_f6; }
    public function _raw_f7() { return $this->_m__raw_f7; }
    public function _raw_f9() { return $this->_m__raw_f9; }
    public function _raw_f10() { return $this->_m__raw_f10; }
}

namespace \Ines\Header;

class F6 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ines\Header $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lowerMapper = $this->_io->readBitsInt(4);
        $this->_m_fourScreen = $this->_io->readBitsInt(1) != 0;
        $this->_m_trainer = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasBatteryRam = $this->_io->readBitsInt(1) != 0;
        $this->_m_mirroring = $this->_io->readBitsInt(1);
    }
    protected $_m_lowerMapper;
    protected $_m_fourScreen;
    protected $_m_trainer;
    protected $_m_hasBatteryRam;
    protected $_m_mirroring;

    /**
     * Lower nibble of mapper number
     */
    public function lowerMapper() { return $this->_m_lowerMapper; }

    /**
     * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
     */
    public function fourScreen() { return $this->_m_fourScreen; }

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
    public function mirroring() { return $this->_m_mirroring; }
}

namespace \Ines\Header\F6;

class Mirroring {
    const HORIZONTAL = 0;
    const VERTICAL = 1;
}

namespace \Ines\Header;

class F7 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ines\Header $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_upperMapper = $this->_io->readBitsInt(4);
        $this->_m_format = $this->_io->readBitsInt(2);
        $this->_m_playchoice10 = $this->_io->readBitsInt(1) != 0;
        $this->_m_vsUnisystem = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_upperMapper;
    protected $_m_format;
    protected $_m_playchoice10;
    protected $_m_vsUnisystem;

    /**
     * Upper nibble of mapper number
     */
    public function upperMapper() { return $this->_m_upperMapper; }

    /**
     * If equal to 2, flags 8-15 are in NES 2.0 format
     */
    public function format() { return $this->_m_format; }

    /**
     * Determines if it made for a Nintendo PlayChoice-10 or not
     */
    public function playchoice10() { return $this->_m_playchoice10; }

    /**
     * Determines if it is made for a Nintendo VS Unisystem or not
     */
    public function vsUnisystem() { return $this->_m_vsUnisystem; }
}

namespace \Ines\Header;

class F9 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ines\Header $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved = $this->_io->readBitsInt(7);
        $this->_m_tvSystem = $this->_io->readBitsInt(1);
    }
    protected $_m_reserved;
    protected $_m_tvSystem;
    public function reserved() { return $this->_m_reserved; }

    /**
     * if 0, NTSC. If 1, PAL.
     */
    public function tvSystem() { return $this->_m_tvSystem; }
}

namespace \Ines\Header\F9;

class TvSystem {
    const NTSC = 0;
    const PAL = 1;
}

namespace \Ines\Header;

class F10 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ines\Header $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->readBitsInt(2);
        $this->_m_busConflict = $this->_io->readBitsInt(1) != 0;
        $this->_m_prgRam = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved2 = $this->_io->readBitsInt(2);
        $this->_m_tvSystem = $this->_io->readBitsInt(2);
    }
    protected $_m_reserved1;
    protected $_m_busConflict;
    protected $_m_prgRam;
    protected $_m_reserved2;
    protected $_m_tvSystem;
    public function reserved1() { return $this->_m_reserved1; }

    /**
     * If 0, no bus conflicts. If 1, bus conflicts.
     */
    public function busConflict() { return $this->_m_busConflict; }

    /**
     * If 0, PRG ram is present. If 1, not present.
     */
    public function prgRam() { return $this->_m_prgRam; }
    public function reserved2() { return $this->_m_reserved2; }

    /**
     * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
     */
    public function tvSystem() { return $this->_m_tvSystem; }
}

namespace \Ines\Header\F10;

class TvSystem {
    const NTSC = 0;
    const DUAL1 = 1;
    const PAL = 2;
    const DUAL2 = 3;
}

namespace \Ines;

class Playchoice10 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ines $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_instRom = $this->_io->readBytes(8192);
        $this->_m_prom = new \Ines\Playchoice10\Prom($this->_io, $this, $this->_root);
    }
    protected $_m_instRom;
    protected $_m_prom;
    public function instRom() { return $this->_m_instRom; }
    public function prom() { return $this->_m_prom; }
}

namespace \Ines\Playchoice10;

class Prom extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ines\Playchoice10 $_parent = null, \Ines $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = $this->_io->readBytes(16);
        $this->_m_counterOut = $this->_io->readBytes(16);
    }
    protected $_m_data;
    protected $_m_counterOut;
    public function data() { return $this->_m_data; }
    public function counterOut() { return $this->_m_counterOut; }
}
