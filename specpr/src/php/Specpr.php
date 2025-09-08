<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Specpr records are fixed format, 1536 bytes/record. Record number
 * counting starts at 0. Binary data are in IEEE format real numbers
 * and non-byte swapped integers (compatiible with all Sun
 * Microsystems, and Hewlett Packard workstations (Intel and some DEC
 * machines are byte swapped relative to Suns and HPs). Each record may
 * contain different information according to the following scheme.
 * 
 * You can get some library of spectra from
 * ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
 */

namespace {
    class Specpr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \Specpr\Record($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_records;
        public function records() { return $this->_m_records; }
    }
}

namespace Specpr {
    class CoarseTimestamp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr\DataInitial $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_scaledSeconds = $this->_io->readS4be();
        }
        protected $_m_seconds;
        public function seconds() {
            if ($this->_m_seconds !== null)
                return $this->_m_seconds;
            $this->_m_seconds = $this->scaledSeconds() * 24000;
            return $this->_m_seconds;
        }
        protected $_m_scaledSeconds;
        public function scaledSeconds() { return $this->_m_scaledSeconds; }
    }
}

namespace Specpr {
    class DataContinuation extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr\Record $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_cdata = [];
            $n = 383;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_cdata[] = $this->_io->readF4be();
            }
        }
        protected $_m_cdata;

        /**
         * The continuation of the data values (383 channels of 32 bit real numbers).
         */
        public function cdata() { return $this->_m_cdata; }
    }
}

namespace Specpr {
    class DataInitial extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr\Record $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ids = new \Specpr\Identifiers($this->_io, $this, $this->_root);
            $this->_m_iscta = new \Specpr\CoarseTimestamp($this->_io, $this, $this->_root);
            $this->_m_isctb = new \Specpr\CoarseTimestamp($this->_io, $this, $this->_root);
            $this->_m_jdatea = $this->_io->readS4be();
            $this->_m_jdateb = $this->_io->readS4be();
            $this->_m_istb = new \Specpr\CoarseTimestamp($this->_io, $this, $this->_root);
            $this->_m_isra = $this->_io->readS4be();
            $this->_m_isdec = $this->_io->readS4be();
            $this->_m_itchan = $this->_io->readS4be();
            $this->_m_irmas = $this->_io->readS4be();
            $this->_m_revs = $this->_io->readS4be();
            $this->_m_iband = [];
            $n = 2;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_iband[] = $this->_io->readS4be();
            }
            $this->_m_irwav = $this->_io->readS4be();
            $this->_m_irespt = $this->_io->readS4be();
            $this->_m_irecno = $this->_io->readS4be();
            $this->_m_itpntr = $this->_io->readS4be();
            $this->_m_ihist = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(60), 32), "ASCII");
            $this->_m_mhist = [];
            $n = 4;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_mhist[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(74), "ASCII");
            }
            $this->_m_nruns = $this->_io->readS4be();
            $this->_m_siangl = new \Specpr\IllumAngle($this->_io, $this, $this->_root);
            $this->_m_seangl = new \Specpr\IllumAngle($this->_io, $this, $this->_root);
            $this->_m_sphase = $this->_io->readS4be();
            $this->_m_iwtrns = $this->_io->readS4be();
            $this->_m_itimch = $this->_io->readS4be();
            $this->_m_xnrm = $this->_io->readF4be();
            $this->_m_scatim = $this->_io->readF4be();
            $this->_m_timint = $this->_io->readF4be();
            $this->_m_tempd = $this->_io->readF4be();
            $this->_m_data = [];
            $n = 256;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_data[] = $this->_io->readF4be();
            }
        }
        protected $_m_phaseAngleArcsec;

        /**
         * The phase angle between iangl and eangl in seconds
         */
        public function phaseAngleArcsec() {
            if ($this->_m_phaseAngleArcsec !== null)
                return $this->_m_phaseAngleArcsec;
            $this->_m_phaseAngleArcsec = $this->sphase() / 1500;
            return $this->_m_phaseAngleArcsec;
        }
        protected $_m_ids;
        protected $_m_iscta;
        protected $_m_isctb;
        protected $_m_jdatea;
        protected $_m_jdateb;
        protected $_m_istb;
        protected $_m_isra;
        protected $_m_isdec;
        protected $_m_itchan;
        protected $_m_irmas;
        protected $_m_revs;
        protected $_m_iband;
        protected $_m_irwav;
        protected $_m_irespt;
        protected $_m_irecno;
        protected $_m_itpntr;
        protected $_m_ihist;
        protected $_m_mhist;
        protected $_m_nruns;
        protected $_m_siangl;
        protected $_m_seangl;
        protected $_m_sphase;
        protected $_m_iwtrns;
        protected $_m_itimch;
        protected $_m_xnrm;
        protected $_m_scatim;
        protected $_m_timint;
        protected $_m_tempd;
        protected $_m_data;
        public function ids() { return $this->_m_ids; }

        /**
         * Civil or Universal time when data was last processed
         */
        public function iscta() { return $this->_m_iscta; }

        /**
         * Civil or Universal time at the start of the spectral run
         */
        public function isctb() { return $this->_m_isctb; }

        /**
         * Date when data was last processed. Stored as integer*4 Julian Day number *10
         */
        public function jdatea() { return $this->_m_jdatea; }

        /**
         * Date when the spectral run began. Stored as integer*4 Julian Day number *10
         */
        public function jdateb() { return $this->_m_jdateb; }

        /**
         * Siderial time when the spectral run started. See flag #05.
         */
        public function istb() { return $this->_m_istb; }

        /**
         * Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
         */
        public function isra() { return $this->_m_isra; }

        /**
         * Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
         */
        public function isdec() { return $this->_m_isdec; }

        /**
         * Total number of channels in the spectrum (integer*4 value from 1 to 4852)
         */
        public function itchan() { return $this->_m_itchan; }

        /**
         * The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
         */
        public function irmas() { return $this->_m_irmas; }

        /**
         * The number of independent spectral scans which were added to make the spectrum (integer*4 number).
         */
        public function revs() { return $this->_m_revs; }

        /**
         * The channel numbers which define the band normalization (scaling to unity). (integers*4).
         */
        public function iband() { return $this->_m_iband; }

        /**
         * The record number within the file where the wavelengths are found (integer*4).
         */
        public function irwav() { return $this->_m_irwav; }

        /**
         * The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
         */
        public function irespt() { return $this->_m_irespt; }

        /**
         * The record number within the file where the data is located (integer*4 number).
         */
        public function irecno() { return $this->_m_irecno; }

        /**
         * Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
         */
        public function itpntr() { return $this->_m_itpntr; }

        /**
         * The program automatic 60 character history.
         */
        public function ihist() { return $this->_m_ihist; }

        /**
         * Manual history. Program automatic for large history requirements.
         */
        public function mhist() { return $this->_m_mhist; }

        /**
         * The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
         */
        public function nruns() { return $this->_m_nruns; }

        /**
         * The angle of incidence of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        public function siangl() { return $this->_m_siangl; }

        /**
         * The angle of emission of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        public function seangl() { return $this->_m_seangl; }

        /**
         * The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
         *       integrating sphere = 2000000000
         */
        public function sphase() { return $this->_m_sphase; }

        /**
         * Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
         */
        public function iwtrns() { return $this->_m_iwtrns; }

        /**
         * The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
         */
        public function itimch() { return $this->_m_itimch; }

        /**
         * The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
         */
        public function xnrm() { return $this->_m_xnrm; }

        /**
         * The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
         */
        public function scatim() { return $this->_m_scatim; }

        /**
         * Total integration time (usually=scatime * nruns) (32 bit real number).
         */
        public function timint() { return $this->_m_timint; }

        /**
         * Temperature in degrees Kelvin (32 bit real number).
         */
        public function tempd() { return $this->_m_tempd; }

        /**
         * The spectral data (256 channels of 32 bit real data numbers).
         */
        public function data() { return $this->_m_data; }
    }
}

/**
 * it is big endian
 */

namespace Specpr {
    class Icflag extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr\Record $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readBitsIntBe(26);
            $this->_m_isctbType = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_isctaType = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_coordinateMode = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_errors = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_text = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_continuation = $this->_io->readBitsIntBe(1) != 0;
        }
        protected $_m_type;
        public function type() {
            if ($this->_m_type !== null)
                return $this->_m_type;
            $this->_m_type = intval($this->text()) * 1 + intval($this->continuation()) * 2;
            return $this->_m_type;
        }
        protected $_m_reserved;
        protected $_m_isctbType;
        protected $_m_isctaType;
        protected $_m_coordinateMode;
        protected $_m_errors;
        protected $_m_text;
        protected $_m_continuation;
        public function reserved() { return $this->_m_reserved; }

        /**
         * =0 ctb is civil time
         * =1 ctb is universal time
         */
        public function isctbType() { return $this->_m_isctbType; }

        /**
         * =0 cta is civil time
         * =1 cta is universal time
         */
        public function isctaType() { return $this->_m_isctaType; }

        /**
         * RA, Dec / Long., Lat flag
         * =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
         * =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
         */
        public function coordinateMode() { return $this->_m_coordinateMode; }

        /**
         * flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
         */
        public function errors() { return $this->_m_errors; }

        /**
         * =0 the data in the array "data" is data
         * =1 the data in the array "data" is ascii text as is most of the header info.
         */
        public function text() { return $this->_m_text; }

        /**
         * =0 first record of a spectrum consists of: header then 256 data channels
         * =1 continuation data record consisting of:
         *   # bit flags followed by 1532 bytes of
         *   # real data (bit 1=0) (383 channels)
         *   # or 1532 bytes of text (bit 1=1).
         *   # A maximum of 12 continuation records
         *   # are allowed for a total of 4852
         *   # channels (limited by arrays of 4864)
         *   # or 19860 characters of text (bit 1=1).
         */
        public function continuation() { return $this->_m_continuation; }
    }
}

namespace Specpr {
    class Identifiers extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ititle = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(40), 32), "ASCII");
            $this->_m_usernm = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "ASCII");
        }
        protected $_m_ititle;
        protected $_m_usernm;

        /**
         * Title which describes the data
         */
        public function ititle() { return $this->_m_ititle; }

        /**
         * The name of the user who created the data record
         */
        public function usernm() { return $this->_m_usernm; }
    }
}

namespace Specpr {
    class IllumAngle extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr\DataInitial $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_angl = $this->_io->readS4be();
        }
        protected $_m_degreesTotal;
        public function degreesTotal() {
            if ($this->_m_degreesTotal !== null)
                return $this->_m_degreesTotal;
            $this->_m_degreesTotal = intval($this->minutesTotal() / 60);
            return $this->_m_degreesTotal;
        }
        protected $_m_minutesTotal;
        public function minutesTotal() {
            if ($this->_m_minutesTotal !== null)
                return $this->_m_minutesTotal;
            $this->_m_minutesTotal = intval($this->secondsTotal() / 60);
            return $this->_m_minutesTotal;
        }
        protected $_m_secondsTotal;
        public function secondsTotal() {
            if ($this->_m_secondsTotal !== null)
                return $this->_m_secondsTotal;
            $this->_m_secondsTotal = intval($this->angl() / 6000);
            return $this->_m_secondsTotal;
        }
        protected $_m_angl;

        /**
         * (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)
         */
        public function angl() { return $this->_m_angl; }
    }
}

namespace Specpr {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_icflag = new \Specpr\Icflag($this->_io, $this, $this->_root);
            switch ($this->icflag()->type()) {
                case \Specpr\RecordType::DATA_CONTINUATION:
                    $this->_m__raw_content = $this->_io->readBytes(1536 - 4);
                    $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                    $this->_m_content = new \Specpr\DataContinuation($_io__raw_content, $this, $this->_root);
                    break;
                case \Specpr\RecordType::DATA_INITIAL:
                    $this->_m__raw_content = $this->_io->readBytes(1536 - 4);
                    $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                    $this->_m_content = new \Specpr\DataInitial($_io__raw_content, $this, $this->_root);
                    break;
                case \Specpr\RecordType::TEXT_CONTINUATION:
                    $this->_m__raw_content = $this->_io->readBytes(1536 - 4);
                    $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                    $this->_m_content = new \Specpr\TextContinuation($_io__raw_content, $this, $this->_root);
                    break;
                case \Specpr\RecordType::TEXT_INITIAL:
                    $this->_m__raw_content = $this->_io->readBytes(1536 - 4);
                    $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                    $this->_m_content = new \Specpr\TextInitial($_io__raw_content, $this, $this->_root);
                    break;
                default:
                    $this->_m_content = $this->_io->readBytes(1536 - 4);
                    break;
            }
        }
        protected $_m_icflag;
        protected $_m_content;
        protected $_m__raw_content;

        /**
         * Total number of bytes comprising the document.
         */
        public function icflag() { return $this->_m_icflag; }
        public function content() { return $this->_m_content; }
        public function _raw_content() { return $this->_m__raw_content; }
    }
}

namespace Specpr {
    class TextContinuation extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr\Record $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tdata = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1532), "ASCII");
        }
        protected $_m_tdata;

        /**
         * 1532 characters of text.
         */
        public function tdata() { return $this->_m_tdata; }
    }
}

namespace Specpr {
    class TextInitial extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Specpr\Record $_parent = null, ?\Specpr $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_ids = new \Specpr\Identifiers($this->_io, $this, $this->_root);
            $this->_m_itxtpt = $this->_io->readU4be();
            $this->_m_itxtch = $this->_io->readS4be();
            $this->_m_itext = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1476), "ASCII");
        }
        protected $_m_ids;
        protected $_m_itxtpt;
        protected $_m_itxtch;
        protected $_m_itext;
        public function ids() { return $this->_m_ids; }

        /**
         * Text data record pointer. This pointer points  to a data record where additional text may be may be found.
         */
        public function itxtpt() { return $this->_m_itxtpt; }

        /**
         * The number of text characters (maximum= 19860).
         */
        public function itxtch() { return $this->_m_itxtch; }

        /**
         * 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
         */
        public function itext() { return $this->_m_itext; }
    }
}

namespace Specpr {
    class RecordType {
        const DATA_INITIAL = 0;
        const TEXT_INITIAL = 1;
        const DATA_CONTINUATION = 2;
        const TEXT_CONTINUATION = 3;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
