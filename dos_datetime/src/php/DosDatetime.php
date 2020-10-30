<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * MS-DOS date and time are packed 16-bit values that specify local date/time.
 * The time is always stored in the current UTC time offset set on the computer
 * which created the file. Note that the daylight saving time (DST) shifts
 * also change the UTC time offset.
 * 
 * For example, if you pack two files A and B into a ZIP archive, file A last modified
 * at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
 * the file modification times saved in MS-DOS format in the ZIP file will vary depending
 * on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.
 * 
 *   - If set to GMT:
 *       - file A: 2020-03-29 00:59 (UTC+00:00)
 *       - file B: 2020-03-29 01:00 (UTC+00:00)
 *   - If set to BST:
 *       - file A: 2020-03-29 01:59 (UTC+01:00)
 *       - file B: 2020-03-29 02:00 (UTC+01:00)
 * 
 * It follows that you are unable to determine the actual last modified time
 * of any file stored in the ZIP archive, if you don't know the locale time
 * setting of the computer at the time it created the ZIP.
 * 
 * This format is used in some data formats from the MS-DOS era, for example:
 * 
 *   - [zip](/zip/)
 *   - [rar](/rar/)
 *   - [vfat](/vfat/) (FAT12)
 *   - [lzh](/lzh/)
 *   - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)
 */

namespace {
    class DosDatetime extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \DosDatetime $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_time = new \DosDatetime\Time($this->_io, $this, $this->_root);
            $this->_m_date = new \DosDatetime\Date($this->_io, $this, $this->_root);
        }
        protected $_m_time;
        protected $_m_date;
        public function time() { return $this->_m_time; }
        public function date() { return $this->_m_date; }
    }
}

namespace DosDatetime {
    class Time extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \DosDatetime $_parent = null, \DosDatetime $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_secondDiv2 = $this->_io->readBitsIntLe(5);
            if (!($this->secondDiv2() <= 29)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(29, $this->secondDiv2(), $this->_io(), "/types/time/seq/0");
            }
            $this->_m_minute = $this->_io->readBitsIntLe(6);
            if (!($this->minute() <= 59)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(59, $this->minute(), $this->_io(), "/types/time/seq/1");
            }
            $this->_m_hour = $this->_io->readBitsIntLe(5);
            if (!($this->hour() <= 23)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(23, $this->hour(), $this->_io(), "/types/time/seq/2");
            }
        }
        protected $_m_second;
        public function second() {
            if ($this->_m_second !== null)
                return $this->_m_second;
            $this->_m_second = (2 * $this->secondDiv2());
            return $this->_m_second;
        }
        protected $_m_paddedSecond;
        public function paddedSecond() {
            if ($this->_m_paddedSecond !== null)
                return $this->_m_paddedSecond;
            $this->_m_paddedSecond = ($this->second() <= 9 ? "0" : "") . strval($this->second());
            return $this->_m_paddedSecond;
        }
        protected $_m_paddedMinute;
        public function paddedMinute() {
            if ($this->_m_paddedMinute !== null)
                return $this->_m_paddedMinute;
            $this->_m_paddedMinute = ($this->minute() <= 9 ? "0" : "") . strval($this->minute());
            return $this->_m_paddedMinute;
        }
        protected $_m_paddedHour;
        public function paddedHour() {
            if ($this->_m_paddedHour !== null)
                return $this->_m_paddedHour;
            $this->_m_paddedHour = ($this->hour() <= 9 ? "0" : "") . strval($this->hour());
            return $this->_m_paddedHour;
        }
        protected $_m_secondDiv2;
        protected $_m_minute;
        protected $_m_hour;
        public function secondDiv2() { return $this->_m_secondDiv2; }
        public function minute() { return $this->_m_minute; }
        public function hour() { return $this->_m_hour; }
    }
}

namespace DosDatetime {
    class Date extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \DosDatetime $_parent = null, \DosDatetime $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_day = $this->_io->readBitsIntLe(5);
            if (!($this->day() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->day(), $this->_io(), "/types/date/seq/0");
            }
            $this->_m_month = $this->_io->readBitsIntLe(4);
            if (!($this->month() >= 1)) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(1, $this->month(), $this->_io(), "/types/date/seq/1");
            }
            if (!($this->month() <= 12)) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(12, $this->month(), $this->_io(), "/types/date/seq/1");
            }
            $this->_m_yearMinus1980 = $this->_io->readBitsIntLe(7);
        }
        protected $_m_year;

        /**
         * only years from 1980 to 2107 (1980 + 127) can be represented
         */
        public function year() {
            if ($this->_m_year !== null)
                return $this->_m_year;
            $this->_m_year = (1980 + $this->yearMinus1980());
            return $this->_m_year;
        }
        protected $_m_paddedDay;
        public function paddedDay() {
            if ($this->_m_paddedDay !== null)
                return $this->_m_paddedDay;
            $this->_m_paddedDay = ($this->day() <= 9 ? "0" : "") . strval($this->day());
            return $this->_m_paddedDay;
        }
        protected $_m_paddedMonth;
        public function paddedMonth() {
            if ($this->_m_paddedMonth !== null)
                return $this->_m_paddedMonth;
            $this->_m_paddedMonth = ($this->month() <= 9 ? "0" : "") . strval($this->month());
            return $this->_m_paddedMonth;
        }
        protected $_m_paddedYear;
        public function paddedYear() {
            if ($this->_m_paddedYear !== null)
                return $this->_m_paddedYear;
            $this->_m_paddedYear = ($this->year() <= 999 ? "0" . ($this->year() <= 99 ? "0" . ($this->year() <= 9 ? "0" : "") : "") : "") . strval($this->year());
            return $this->_m_paddedYear;
        }
        protected $_m_day;
        protected $_m_month;
        protected $_m_yearMinus1980;
        public function day() { return $this->_m_day; }
        public function month() { return $this->_m_month; }
        public function yearMinus1980() { return $this->_m_yearMinus1980; }
    }
}
