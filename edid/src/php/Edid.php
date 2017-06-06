<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Edid extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Edid $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x00\xFF\xFF\xFF\xFF\xFF\xFF\x00");
        $this->_m_mfgBytes = $this->_io->readU2le();
        $this->_m_productCode = $this->_io->readU2le();
        $this->_m_serial = $this->_io->readU4le();
        $this->_m_mfgWeek = $this->_io->readU1();
        $this->_m_mfgYearMod = $this->_io->readU1();
        $this->_m_edidVersionMajor = $this->_io->readU1();
        $this->_m_edidVersionMinor = $this->_io->readU1();
        $this->_m_inputFlags = $this->_io->readU1();
        $this->_m_screenSizeH = $this->_io->readU1();
        $this->_m_screenSizeV = $this->_io->readU1();
        $this->_m_gammaMod = $this->_io->readU1();
        $this->_m_featuresFlags = $this->_io->readU1();
        $this->_m_chromacity = $this->_io->readBytes(10);
    }
    protected $_m_mfgYear;
    public function mfgYear() {
        if ($this->_m_mfgYear !== null)
            return $this->_m_mfgYear;
        $this->_m_mfgYear = ($this->mfgYearMod() + 1990);
        return $this->_m_mfgYear;
    }
    protected $_m_mfgIdCh1;
    public function mfgIdCh1() {
        if ($this->_m_mfgIdCh1 !== null)
            return $this->_m_mfgIdCh1;
        $this->_m_mfgIdCh1 = (($this->mfgBytes() & 31744) >> 10);
        return $this->_m_mfgIdCh1;
    }
    protected $_m_mfgIdCh3;
    public function mfgIdCh3() {
        if ($this->_m_mfgIdCh3 !== null)
            return $this->_m_mfgIdCh3;
        $this->_m_mfgIdCh3 = ($this->mfgBytes() & 31);
        return $this->_m_mfgIdCh3;
    }
    protected $_m_gamma;
    public function gamma() {
        if ($this->_m_gamma !== null)
            return $this->_m_gamma;
        if ($this->gammaMod() != 255) {
            $this->_m_gamma = (($this->gammaMod() + 100) / 100.0);
        }
        return $this->_m_gamma;
    }
    protected $_m_mfgIdCh2;
    public function mfgIdCh2() {
        if ($this->_m_mfgIdCh2 !== null)
            return $this->_m_mfgIdCh2;
        $this->_m_mfgIdCh2 = (($this->mfgBytes() & 992) >> 5);
        return $this->_m_mfgIdCh2;
    }
    protected $_m_magic;
    protected $_m_mfgBytes;
    protected $_m_productCode;
    protected $_m_serial;
    protected $_m_mfgWeek;
    protected $_m_mfgYearMod;
    protected $_m_edidVersionMajor;
    protected $_m_edidVersionMinor;
    protected $_m_inputFlags;
    protected $_m_screenSizeH;
    protected $_m_screenSizeV;
    protected $_m_gammaMod;
    protected $_m_featuresFlags;
    protected $_m_chromacity;
    public function magic() { return $this->_m_magic; }
    public function mfgBytes() { return $this->_m_mfgBytes; }

    /**
     * Manufacturer product code
     */
    public function productCode() { return $this->_m_productCode; }

    /**
     * Serial number
     */
    public function serial() { return $this->_m_serial; }

    /**
     * Week of manufacture. Week numbering is not consistent between manufacturers.
     */
    public function mfgWeek() { return $this->_m_mfgWeek; }

    /**
     * Year of manufacture, less 1990. (1990–2245). If week=255, it is the model year instead.
     */
    public function mfgYearMod() { return $this->_m_mfgYearMod; }

    /**
     * EDID version, usually 1 (for 1.3)
     */
    public function edidVersionMajor() { return $this->_m_edidVersionMajor; }

    /**
     * EDID revision, usually 3 (for 1.3)
     */
    public function edidVersionMinor() { return $this->_m_edidVersionMinor; }
    public function inputFlags() { return $this->_m_inputFlags; }

    /**
     * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
     */
    public function screenSizeH() { return $this->_m_screenSizeH; }

    /**
     * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
     */
    public function screenSizeV() { return $this->_m_screenSizeV; }

    /**
     * Display gamma, datavalue = (gamma*100)-100 (range 1.00–3.54)
     */
    public function gammaMod() { return $this->_m_gammaMod; }
    public function featuresFlags() { return $this->_m_featuresFlags; }
    public function chromacity() { return $this->_m_chromacity; }
}
