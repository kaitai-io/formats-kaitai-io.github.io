<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class QuicktimeMov extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\QuicktimeMov $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_atoms = new \QuicktimeMov\AtomList($this->_io, $this, $this->_root);
        }
        protected $_m_atoms;
        public function atoms() { return $this->_m_atoms; }
    }
}

namespace QuicktimeMov {
    class Atom extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\QuicktimeMov\AtomList $_parent = null, ?\QuicktimeMov $_root = null) {
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
                case \QuicktimeMov\AtomType::DINF:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::FTYP:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\FtypBody($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::MDIA:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::MINF:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::MOOF:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::MOOV:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::MVHD:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\MvhdBody($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::STBL:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::TKHD:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\TkhdBody($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::TRAF:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
                    break;
                case \QuicktimeMov\AtomType::TRAK:
                    $this->_m__raw_body = $this->_io->readBytes($this->len());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \QuicktimeMov\AtomList($_io__raw_body, $this, $this->_root);
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
            $this->_m_len = ($this->len32() == 0 ? $this->_io()->size() - 8 : ($this->len32() == 1 ? $this->len64() - 16 : $this->len32() - 8));
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
}

namespace QuicktimeMov {
    class AtomList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\QuicktimeMov $_root = null) {
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
}

/**
 * Fixed-point 16-bit number.
 */

namespace QuicktimeMov {
    class Fixed16 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\QuicktimeMov\MvhdBody $_parent = null, ?\QuicktimeMov $_root = null) {
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
}

/**
 * Fixed-point 32-bit number.
 */

namespace QuicktimeMov {
    class Fixed32 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\QuicktimeMov $_root = null) {
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
}

namespace QuicktimeMov {
    class FtypBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\QuicktimeMov\Atom $_parent = null, ?\QuicktimeMov $_root = null) {
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
}

namespace QuicktimeMov {
    class MvhdBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\QuicktimeMov\Atom $_parent = null, ?\QuicktimeMov $_root = null) {
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
         * movie - the number of time units that pass per second
         * in its time coordinate system. A time coordinate system that
         * measures time in sixtieths of a second, for example, has a
         * time scale of 60.
         */
        public function timeScale() { return $this->_m_timeScale; }

        /**
         * A time value that indicates the duration of the movie in
         * time scale units. Note that this property is derived from
         * the movie's tracks. The value of this field corresponds to
         * the duration of the longest track in the movie.
         */
        public function duration() { return $this->_m_duration; }

        /**
         * The rate at which to play this movie. A value of 1.0 indicates normal rate.
         */
        public function preferredRate() { return $this->_m_preferredRate; }

        /**
         * How loud to play this movie's sound. A value of 1.0 indicates full volume.
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
}

namespace QuicktimeMov {
    class TkhdBody extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\QuicktimeMov\Atom $_parent = null, ?\QuicktimeMov $_root = null) {
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
}

namespace QuicktimeMov {
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

        private const _VALUES = [1484026465 => true, 1684631142 => true, 1685218662 => true, 1701082227 => true, 1701606260 => true, 1718773093 => true, 1718909296 => true, 1751411826 => true, 1768907891 => true, 1835295092 => true, 1835296868 => true, 1835297121 => true, 1835365473 => true, 1835626086 => true, 1836019558 => true, 1836019574 => true, 1836476516 => true, 1936549988 => true, 1937007212 => true, 1937007471 => true, 1937011555 => true, 1937011556 => true, 1937011578 => true, 1937011827 => true, 1953196132 => true, 1953653094 => true, 1953653099 => true, 1953654118 => true, 1969517665 => true, 1986881636 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace QuicktimeMov {
    class Brand {
        const X_3G2A = 862401121;
        const X_3GE6 = 862414134;
        const X_3GE7 = 862414135;
        const X_3GE9 = 862414137;
        const X_3GF9 = 862414393;
        const X_3GG6 = 862414646;
        const X_3GG9 = 862414649;
        const X_3GH9 = 862414905;
        const X_3GM9 = 862416185;
        const X_3GMA = 862416193;
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
        const X_3GT8 = 862417976;
        const X_3GT9 = 862417977;
        const X_3GTV = 862418038;
        const X_3GVR = 862418546;
        const X_3VRA = 863400545;
        const X_3VRB = 863400546;
        const X_3VRM = 863400557;
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
        const MA1A = 1296118081;
        const MA1B = 1296118082;
        const MFSM = 1296454477;
        const MGSV = 1296520022;
        const MPPI = 1297109065;
        const MSNV = 1297305174;
        const MIAB = 1298743618;
        const MIAC = 1298743619;
        const MIAN = 1298743662;
        const MIBU = 1298743925;
        const MICM = 1298744173;
        const MIHA = 1298745409;
        const MIHB = 1298745410;
        const MIHE = 1298745413;
        const MIPR = 1298747506;
        const ROSS = 1380930387;
        const SEAU = 1397047637;
        const SEBK = 1397047883;
        const XAVC = 1480676931;
        const ADTI = 1633973353;
        const AID3 = 1634296883;
        const AV01 = 1635135537;
        const AVC1 = 1635148593;
        const AVCI = 1635148649;
        const AVCS = 1635148659;
        const AVDE = 1635148901;
        const AVIF = 1635150182;
        const AVIO = 1635150191;
        const AVIS = 1635150195;
        const BBXM = 1650620525;
        const CA4M = 1667314797;
        const CA4S = 1667314803;
        const CAAA = 1667326305;
        const CAAC = 1667326307;
        const CABL = 1667326572;
        const CAMA = 1667329377;
        const CAMC = 1667329379;
        const CAQV = 1667330422;
        const CASU = 1667330933;
        const CCEA = 1667458401;
        const CCFF = 1667458662;
        const CDM1 = 1667525937;
        const CDM4 = 1667525940;
        const CEAC = 1667588451;
        const CFHD = 1667655780;
        const CFSD = 1667658596;
        const CHD1 = 1667785777;
        const CHD2 = 1667785778;
        const CHDF = 1667785830;
        const CHEV = 1667786102;
        const CHH1 = 1667786801;
        const CHHD = 1667786852;
        const CINT = 1667853940;
        const CLG1 = 1668048689;
        const CLG2 = 1668048690;
        const CMF2 = 1668113970;
        const CMFC = 1668114019;
        const CMFF = 1668114022;
        const CMFL = 1668114028;
        const CMFS = 1668114035;
        const CMHM = 1668114541;
        const CMHS = 1668114547;
        const COMP = 1668246896;
        const CSH1 = 1668507697;
        const CUD1 = 1668637745;
        const CUD2 = 1668637746;
        const CUD8 = 1668637752;
        const CUD9 = 1668637753;
        const CUVD = 1668642404;
        const CVID = 1668704612;
        const CVVC = 1668707939;
        const CWVT = 1668773492;
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
        const DTS1 = 1685353265;
        const DTS2 = 1685353266;
        const DTS3 = 1685353267;
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
        const HEIC = 1751476579;
        const HEIM = 1751476589;
        const HEIS = 1751476595;
        const HEIX = 1751476600;
        const HEOI = 1751478121;
        const HEVC = 1751479907;
        const HEVD = 1751479908;
        const HEVI = 1751479913;
        const HEVM = 1751479917;
        const HEVS = 1751479923;
        const HEVX = 1751479928;
        const HVCE = 1752589157;
        const HVCI = 1752589161;
        const HVCX = 1752589176;
        const HVTI = 1752593513;
        const IFAA = 1768317281;
        const IFAH = 1768317288;
        const IFAI = 1768317289;
        const IFAS = 1768317299;
        const IFAU = 1768317301;
        const IFAV = 1768317302;
        const IFHD = 1768319076;
        const IFHH = 1768319080;
        const IFHR = 1768319090;
        const IFHS = 1768319091;
        const IFHU = 1768319093;
        const IFHX = 1768319096;
        const IFRM = 1768321645;
        const IFSD = 1768321892;
        const IM1I = 1768763753;
        const IM1T = 1768763764;
        const IM2I = 1768764009;
        const IM2T = 1768764020;
        const ISC2 = 1769169714;
        const ISO2 = 1769172786;
        const ISO3 = 1769172787;
        const ISO4 = 1769172788;
        const ISO5 = 1769172789;
        const ISO6 = 1769172790;
        const ISO7 = 1769172791;
        const ISO8 = 1769172792;
        const ISO9 = 1769172793;
        const ISOA = 1769172833;
        const ISOB = 1769172834;
        const ISOC = 1769172835;
        const ISOM = 1769172845;
        const J2IS = 1781688691;
        const J2KI = 1781689193;
        const J2KS = 1781689203;
        const JP2 = 1785737760;
        const JPEG = 1785750887;
        const JPGS = 1785751411;
        const JPM = 1785752864;
        const JPOI = 1785753449;
        const JPSI = 1785754473;
        const JPX = 1785755680;
        const JPXB = 1785755746;
        const JXL = 1786276896;
        const JXS = 1786278688;
        const JXSC = 1786278755;
        const JXSI = 1786278761;
        const JXSS = 1786278771;
        const LHTE = 1818784869;
        const LHTI = 1818784873;
        const LMSG = 1819112295;
        const MIAF = 1835622758;
        const MIF1 = 1835623985;
        const MIF2 = 1835623986;
        const MJ2S = 1835676275;
        const MJP2 = 1835692082;
        const MP21 = 1836069425;
        const MP41 = 1836069937;
        const MP42 = 1836069938;
        const MP71 = 1836070705;
        const MPUF = 1836086630;
        const MSDH = 1836278888;
        const MSF1 = 1836279345;
        const MSIX = 1836280184;
        const NIKO = 1852402543;
        const NLSL = 1852601196;
        const NRAS = 1852989811;
        const OA2D = 1868640868;
        const OABL = 1868653164;
        const ODCF = 1868850022;
        const OMPP = 1869443184;
        const OPF2 = 1869637170;
        const OPX2 = 1869641778;
        const OVDP = 1870029936;
        const OVLY = 1870031993;
        const PAFF = 1885431398;
        const PANA = 1885433441;
        const PIFF = 1885955686;
        const PMFF = 1886217830;
        const PNVI = 1886287465;
        const PRED = 1886545252;
        const QT = 1903435808;
        const RELO = 1919249519;
        const RISX = 1919513464;
        const SDV = 1935963680;
        const SENV = 1936027254;
        const SIMS = 1936289139;
        const SISX = 1936290680;
        const SITI = 1936290921;
        const SITV = 1936290934;
        const SLH1 = 1936484401;
        const SLH2 = 1936484402;
        const SLH3 = 1936484403;
        const SSSS = 1936946035;
        const TTML = 1953787244;
        const TTWV = 1953789814;
        const UHVI = 1969780329;
        const UNIF = 1970170214;
        const UVVU = 1970697845;
        const V3MP = 1983081840;
        const V3MT = 1983081844;
        const V3NT = 1983082100;
        const V3ST = 1983083380;
        const VVCI = 1987470185;
        const VVOI = 1987473257;
        const VWPT = 1987539060;
        const YT4 = 2037658656;

        private const _VALUES = [862401121 => true, 862414134 => true, 862414135 => true, 862414137 => true, 862414393 => true, 862414646 => true, 862414649 => true, 862414905 => true, 862416185 => true, 862416193 => true, 862416948 => true, 862416949 => true, 862416950 => true, 862416951 => true, 862416952 => true, 862416953 => true, 862417462 => true, 862417465 => true, 862417718 => true, 862417721 => true, 862417976 => true, 862417977 => true, 862418038 => true, 862418546 => true, 863400545 => true, 863400546 => true, 863400557 => true, 1095914057 => true, 1128351056 => true, 1128555891 => true, 1244811312 => true, 1244811313 => true, 1279476039 => true, 1295270176 => true, 1295270432 => true, 1295274016 => true, 1295275552 => true, 1296118081 => true, 1296118082 => true, 1296454477 => true, 1296520022 => true, 1297109065 => true, 1297305174 => true, 1298743618 => true, 1298743619 => true, 1298743662 => true, 1298743925 => true, 1298744173 => true, 1298745409 => true, 1298745410 => true, 1298745413 => true, 1298747506 => true, 1380930387 => true, 1397047637 => true, 1397047883 => true, 1480676931 => true, 1633973353 => true, 1634296883 => true, 1635135537 => true, 1635148593 => true, 1635148649 => true, 1635148659 => true, 1635148901 => true, 1635150182 => true, 1635150191 => true, 1635150195 => true, 1650620525 => true, 1667314797 => true, 1667314803 => true, 1667326305 => true, 1667326307 => true, 1667326572 => true, 1667329377 => true, 1667329379 => true, 1667330422 => true, 1667330933 => true, 1667458401 => true, 1667458662 => true, 1667525937 => true, 1667525940 => true, 1667588451 => true, 1667655780 => true, 1667658596 => true, 1667785777 => true, 1667785778 => true, 1667785830 => true, 1667786102 => true, 1667786801 => true, 1667786852 => true, 1667853940 => true, 1668048689 => true, 1668048690 => true, 1668113970 => true, 1668114019 => true, 1668114022 => true, 1668114028 => true, 1668114035 => true, 1668114541 => true, 1668114547 => true, 1668246896 => true, 1668507697 => true, 1668637745 => true, 1668637746 => true, 1668637752 => true, 1668637753 => true, 1668642404 => true, 1668704612 => true, 1668707939 => true, 1668773492 => true, 1684090977 => true, 1684090978 => true, 1684091233 => true, 1684091234 => true, 1684091489 => true, 1684091490 => true, 1684091745 => true, 1684091746 => true, 1684108136 => true, 1684175153 => true, 1684890161 => true, 1685286259 => true, 1685353265 => true, 1685353266 => true, 1685353267 => true, 1685467489 => true, 1685467490 => true, 1685467745 => true, 1685467746 => true, 1685468001 => true, 1685468002 => true, 1685484081 => true, 1685484593 => true, 1685614368 => true, 1701671783 => true, 1751476579 => true, 1751476589 => true, 1751476595 => true, 1751476600 => true, 1751478121 => true, 1751479907 => true, 1751479908 => true, 1751479913 => true, 1751479917 => true, 1751479923 => true, 1751479928 => true, 1752589157 => true, 1752589161 => true, 1752589176 => true, 1752593513 => true, 1768317281 => true, 1768317288 => true, 1768317289 => true, 1768317299 => true, 1768317301 => true, 1768317302 => true, 1768319076 => true, 1768319080 => true, 1768319090 => true, 1768319091 => true, 1768319093 => true, 1768319096 => true, 1768321645 => true, 1768321892 => true, 1768763753 => true, 1768763764 => true, 1768764009 => true, 1768764020 => true, 1769169714 => true, 1769172786 => true, 1769172787 => true, 1769172788 => true, 1769172789 => true, 1769172790 => true, 1769172791 => true, 1769172792 => true, 1769172793 => true, 1769172833 => true, 1769172834 => true, 1769172835 => true, 1769172845 => true, 1781688691 => true, 1781689193 => true, 1781689203 => true, 1785737760 => true, 1785750887 => true, 1785751411 => true, 1785752864 => true, 1785753449 => true, 1785754473 => true, 1785755680 => true, 1785755746 => true, 1786276896 => true, 1786278688 => true, 1786278755 => true, 1786278761 => true, 1786278771 => true, 1818784869 => true, 1818784873 => true, 1819112295 => true, 1835622758 => true, 1835623985 => true, 1835623986 => true, 1835676275 => true, 1835692082 => true, 1836069425 => true, 1836069937 => true, 1836069938 => true, 1836070705 => true, 1836086630 => true, 1836278888 => true, 1836279345 => true, 1836280184 => true, 1852402543 => true, 1852601196 => true, 1852989811 => true, 1868640868 => true, 1868653164 => true, 1868850022 => true, 1869443184 => true, 1869637170 => true, 1869641778 => true, 1870029936 => true, 1870031993 => true, 1885431398 => true, 1885433441 => true, 1885955686 => true, 1886217830 => true, 1886287465 => true, 1886545252 => true, 1903435808 => true, 1919249519 => true, 1919513464 => true, 1935963680 => true, 1936027254 => true, 1936289139 => true, 1936290680 => true, 1936290921 => true, 1936290934 => true, 1936484401 => true, 1936484402 => true, 1936484403 => true, 1936946035 => true, 1953787244 => true, 1953789814 => true, 1969780329 => true, 1970170214 => true, 1970697845 => true, 1983081840 => true, 1983081844 => true, 1983082100 => true, 1983083380 => true, 1987470185 => true, 1987473257 => true, 1987539060 => true, 2037658656 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
