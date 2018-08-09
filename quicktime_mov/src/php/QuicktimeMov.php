<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class QuicktimeMov extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_atoms = new \QuicktimeMov\AtomList($this->_io, $this, $this->_root);
    }
    protected $_m_atoms;
    public function atoms() { return $this->_m_atoms; }
}

namespace \QuicktimeMov;

class MvhdBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \QuicktimeMov\Atom $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU1();
        $this->_m_flags = $this->_io->readBytes(3);
        $this->_m_creationTime = $this->_io->readU4be();
        $this->_m_modificationTime = $this->_io->readU4be();
        $this->_m_timeScale = $this->_io->readU4be();
        $this->_m_duration = $this->_io->readU4be();
        $this->_m_preferredRate = new \QuicktimeMov\Fixed32($this->_io, $this, $this->_root);
        $this->_m_preferredVolume = new \QuicktimeMov\Fixed16($this->_io, $this, $this->_root);
        $this->_m_reserved1 = $this->_io->readBytes(10);
        $this->_m_matrix = $this->_io->readBytes(36);
        $this->_m_previewTime = $this->_io->readU4be();
        $this->_m_previewDuration = $this->_io->readU4be();
        $this->_m_posterTime = $this->_io->readU4be();
        $this->_m_selectionTime = $this->_io->readU4be();
        $this->_m_selectionDuration = $this->_io->readU4be();
        $this->_m_currentTime = $this->_io->readU4be();
        $this->_m_nextTrackId = $this->_io->readU4be();
    }
    protected $_m_version;
    protected $_m_flags;
    protected $_m_creationTime;
    protected $_m_modificationTime;
    protected $_m_timeScale;
    protected $_m_duration;
    protected $_m_preferredRate;
    protected $_m_preferredVolume;
    protected $_m_reserved1;
    protected $_m_matrix;
    protected $_m_previewTime;
    protected $_m_previewDuration;
    protected $_m_posterTime;
    protected $_m_selectionTime;
    protected $_m_selectionDuration;
    protected $_m_currentTime;
    protected $_m_nextTrackId;

    /**
     * Version of this movie header atom
     */
    public function version() { return $this->_m_version; }
    public function flags() { return $this->_m_flags; }
    public function creationTime() { return $this->_m_creationTime; }
    public function modificationTime() { return $this->_m_modificationTime; }

    /**
     * A time value that indicates the time scale for this
     * movie—that is, the number of time units that pass per second
     * in its time coordinate system. A time coordinate system that
     * measures time in sixtieths of a second, for example, has a
     * time scale of 60.
     */
    public function timeScale() { return $this->_m_timeScale; }

    /**
     * A time value that indicates the duration of the movie in
     * time scale units. Note that this property is derived from
     * the movie’s tracks. The value of this field corresponds to
     * the duration of the longest track in the movie.
     */
    public function duration() { return $this->_m_duration; }

    /**
     * The rate at which to play this movie. A value of 1.0 indicates normal rate.
     */
    public function preferredRate() { return $this->_m_preferredRate; }

    /**
     * How loud to play this movie’s sound. A value of 1.0 indicates full volume.
     */
    public function preferredVolume() { return $this->_m_preferredVolume; }
    public function reserved1() { return $this->_m_reserved1; }

    /**
     * A matrix shows how to map points from one coordinate space into another.
     */
    public function matrix() { return $this->_m_matrix; }

    /**
     * The time value in the movie at which the preview begins.
     */
    public function previewTime() { return $this->_m_previewTime; }

    /**
     * The duration of the movie preview in movie time scale units.
     */
    public function previewDuration() { return $this->_m_previewDuration; }

    /**
     * The time value of the time of the movie poster.
     */
    public function posterTime() { return $this->_m_posterTime; }

    /**
     * The time value for the start time of the current selection.
     */
    public function selectionTime() { return $this->_m_selectionTime; }

    /**
     * The duration of the current selection in movie time scale units.
     */
    public function selectionDuration() { return $this->_m_selectionDuration; }

    /**
     * The time value for current time position within the movie.
     */
    public function currentTime() { return $this->_m_currentTime; }

    /**
     * Indicates a value to use for the track ID number of the next
     * track added to this movie. Note that 0 is not a valid track
     * ID value.
     */
    public function nextTrackId() { return $this->_m_nextTrackId; }
}

namespace \QuicktimeMov;

class FtypBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \QuicktimeMov\Atom $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_majorBrand = $this->_io->readU4be();
        $this->_m_minorVersion = $this->_io->readBytes(4);
        $this->_m_compatibleBrands = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_compatibleBrands[] = $this->_io->readU4be();
            $i++;
        }
    }
    protected $_m_majorBrand;
    protected $_m_minorVersion;
    protected $_m_compatibleBrands;
    public function majorBrand() { return $this->_m_majorBrand; }
    public function minorVersion() { return $this->_m_minorVersion; }
    public function compatibleBrands() { return $this->_m_compatibleBrands; }
}

/**
 * Fixed-point 32-bit number.
 */

namespace \QuicktimeMov;

class Fixed32 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_intPart = $this->_io->readS2be();
        $this->_m_fracPart = $this->_io->readU2be();
    }
    protected $_m_intPart;
    protected $_m_fracPart;
    public function intPart() { return $this->_m_intPart; }
    public function fracPart() { return $this->_m_fracPart; }
}

/**
 * Fixed-point 16-bit number.
 */

namespace \QuicktimeMov;

class Fixed16 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \QuicktimeMov\MvhdBody $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_intPart = $this->_io->readS1();
        $this->_m_fracPart = $this->_io->readU1();
    }
    protected $_m_intPart;
    protected $_m_fracPart;
    public function intPart() { return $this->_m_intPart; }
    public function fracPart() { return $this->_m_fracPart; }
}

namespace \QuicktimeMov;

class Atom extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \QuicktimeMov\AtomList $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len32 = $this->_io->readU4be();
        $this->_m_atomType = $this->_io->readU4be();
        if ($this->len32() == 1) {
            $this->_m_len64 = $this->_io->readU8be();
        }
        switch ($this->atomType()) {
            case \QuicktimeMov\AtomType::STBL:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::MOOF:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::MVHD:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\MvhdBody($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::MINF:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::TRAK:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::TRAF:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::MDIA:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::FTYP:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\FtypBody($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::MOOV:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::TKHD:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\TkhdBody($io, $this, $this->_root);
                break;
            case \QuicktimeMov\AtomType::DINF:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \QuicktimeMov\AtomList($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->len());
                break;
        }
    }
    protected $_m_len;
    public function len() {
        if ($this->_m_len !== null)
            return $this->_m_len;
        $this->_m_len = ($this->len32() == 0 ? ($this->_io()->size() - 8) : ($this->len32() == 1 ? ($this->len64() - 16) : ($this->len32() - 8)));
        return $this->_m_len;
    }
    protected $_m_len32;
    protected $_m_atomType;
    protected $_m_len64;
    protected $_m_body;
    protected $_m__raw_body;
    public function len32() { return $this->_m_len32; }
    public function atomType() { return $this->_m_atomType; }
    public function len64() { return $this->_m_len64; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \QuicktimeMov;

class TkhdBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \QuicktimeMov\Atom $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU1();
        $this->_m_flags = $this->_io->readBytes(3);
        $this->_m_creationTime = $this->_io->readU4be();
        $this->_m_modificationTime = $this->_io->readU4be();
        $this->_m_trackId = $this->_io->readU4be();
        $this->_m_reserved1 = $this->_io->readBytes(4);
        $this->_m_duration = $this->_io->readU4be();
        $this->_m_reserved2 = $this->_io->readBytes(8);
        $this->_m_layer = $this->_io->readU2be();
        $this->_m_alternativeGroup = $this->_io->readU2be();
        $this->_m_volume = $this->_io->readU2be();
        $this->_m_reserved3 = $this->_io->readU2be();
        $this->_m_matrix = $this->_io->readBytes(36);
        $this->_m_width = new \QuicktimeMov\Fixed32($this->_io, $this, $this->_root);
        $this->_m_height = new \QuicktimeMov\Fixed32($this->_io, $this, $this->_root);
    }
    protected $_m_version;
    protected $_m_flags;
    protected $_m_creationTime;
    protected $_m_modificationTime;
    protected $_m_trackId;
    protected $_m_reserved1;
    protected $_m_duration;
    protected $_m_reserved2;
    protected $_m_layer;
    protected $_m_alternativeGroup;
    protected $_m_volume;
    protected $_m_reserved3;
    protected $_m_matrix;
    protected $_m_width;
    protected $_m_height;
    public function version() { return $this->_m_version; }
    public function flags() { return $this->_m_flags; }
    public function creationTime() { return $this->_m_creationTime; }
    public function modificationTime() { return $this->_m_modificationTime; }

    /**
     * Integer that uniquely identifies the track. The value 0 cannot be used.
     */
    public function trackId() { return $this->_m_trackId; }
    public function reserved1() { return $this->_m_reserved1; }
    public function duration() { return $this->_m_duration; }
    public function reserved2() { return $this->_m_reserved2; }
    public function layer() { return $this->_m_layer; }
    public function alternativeGroup() { return $this->_m_alternativeGroup; }
    public function volume() { return $this->_m_volume; }
    public function reserved3() { return $this->_m_reserved3; }
    public function matrix() { return $this->_m_matrix; }
    public function width() { return $this->_m_width; }
    public function height() { return $this->_m_height; }
}

namespace \QuicktimeMov;

class AtomList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \QuicktimeMov $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_items[] = new \QuicktimeMov\Atom($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \QuicktimeMov;

class AtomType {
    const XTRA = 1484026465;
    const DINF = 1684631142;
    const DREF = 1685218662;
    const EDTS = 1701082227;
    const ELST = 1701606260;
    const FREE = 1718773093;
    const FTYP = 1718909296;
    const HDLR = 1751411826;
    const IODS = 1768907891;
    const MDAT = 1835295092;
    const MDHD = 1835296868;
    const MDIA = 1835297121;
    const META = 1835365473;
    const MINF = 1835626086;
    const MOOF = 1836019558;
    const MOOV = 1836019574;
    const MVHD = 1836476516;
    const SMHD = 1936549988;
    const STBL = 1937007212;
    const STCO = 1937007471;
    const STSC = 1937011555;
    const STSD = 1937011556;
    const STSZ = 1937011578;
    const STTS = 1937011827;
    const TKHD = 1953196132;
    const TRAF = 1953653094;
    const TRAK = 1953653099;
    const TREF = 1953654118;
    const UDTA = 1969517665;
    const VMHD = 1986881636;
}

namespace \QuicktimeMov;

class Brand {
    const X_3G2A = 862401121;
    const X_3GE6 = 862414134;
    const X_3GE9 = 862414137;
    const X_3GF9 = 862414393;
    const X_3GG6 = 862414646;
    const X_3GG9 = 862414649;
    const X_3GH9 = 862414905;
    const X_3GM9 = 862416185;
    const X_3GP4 = 862416948;
    const X_3GP5 = 862416949;
    const X_3GP6 = 862416950;
    const X_3GP7 = 862416951;
    const X_3GP8 = 862416952;
    const X_3GP9 = 862416953;
    const X_3GR6 = 862417462;
    const X_3GR9 = 862417465;
    const X_3GS6 = 862417718;
    const X_3GS9 = 862417721;
    const X_3GT9 = 862417977;
    const ARRI = 1095914057;
    const CAEP = 1128351056;
    const CDES = 1128555891;
    const J2P0 = 1244811312;
    const J2P1 = 1244811313;
    const LCAG = 1279476039;
    const M4A = 1295270176;
    const M4B = 1295270432;
    const M4P = 1295274016;
    const M4V = 1295275552;
    const MFSM = 1296454477;
    const MGSV = 1296520022;
    const MPPI = 1297109065;
    const MSNV = 1297305174;
    const ROSS = 1380930387;
    const SEAU = 1397047637;
    const SEBK = 1397047883;
    const XAVC = 1480676931;
    const AVC1 = 1635148593;
    const BBXM = 1650620525;
    const CAQV = 1667330422;
    const CCFF = 1667458662;
    const DA0A = 1684090977;
    const DA0B = 1684090978;
    const DA1A = 1684091233;
    const DA1B = 1684091234;
    const DA2A = 1684091489;
    const DA2B = 1684091490;
    const DA3A = 1684091745;
    const DA3B = 1684091746;
    const DASH = 1684108136;
    const DBY1 = 1684175153;
    const DMB1 = 1684890161;
    const DSMS = 1685286259;
    const DV1A = 1685467489;
    const DV1B = 1685467490;
    const DV2A = 1685467745;
    const DV2B = 1685467746;
    const DV3A = 1685468001;
    const DV3B = 1685468002;
    const DVR1 = 1685484081;
    const DVT1 = 1685484593;
    const DXO = 1685614368;
    const EMSG = 1701671783;
    const IFRM = 1768321645;
    const ISC2 = 1769169714;
    const ISO2 = 1769172786;
    const ISO3 = 1769172787;
    const ISO4 = 1769172788;
    const ISO5 = 1769172789;
    const ISO6 = 1769172790;
    const ISOM = 1769172845;
    const JP2 = 1785737760;
    const JPM = 1785752864;
    const JPSI = 1785754473;
    const JPX = 1785755680;
    const JPXB = 1785755746;
    const LMSG = 1819112295;
    const MJ2S = 1835676275;
    const MJP2 = 1835692082;
    const MP21 = 1836069425;
    const MP41 = 1836069937;
    const MP42 = 1836069938;
    const MP71 = 1836070705;
    const MSDH = 1836278888;
    const MSIX = 1836280184;
    const NIKO = 1852402543;
    const ODCF = 1868850022;
    const OPF2 = 1869637170;
    const OPX2 = 1869641778;
    const PANA = 1885433441;
    const PIFF = 1885955686;
    const PNVI = 1886287465;
    const QT = 1903435808;
    const RISX = 1919513464;
    const SDV = 1935963680;
    const SENV = 1936027254;
    const SIMS = 1936289139;
    const SISX = 1936290680;
    const SSSS = 1936946035;
    const UVVU = 1970697845;
}
