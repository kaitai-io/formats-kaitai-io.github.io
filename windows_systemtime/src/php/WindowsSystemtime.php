<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 */

namespace {
    class WindowsSystemtime extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \WindowsSystemtime $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_year = $this->_io->readU2le();
            $this->_m_month = $this->_io->readU2le();
            $this->_m_dow = $this->_io->readU2le();
            $this->_m_day = $this->_io->readU2le();
            $this->_m_hour = $this->_io->readU2le();
            $this->_m_min = $this->_io->readU2le();
            $this->_m_sec = $this->_io->readU2le();
            $this->_m_msec = $this->_io->readU2le();
        }
        protected $_m_year;
        protected $_m_month;
        protected $_m_dow;
        protected $_m_day;
        protected $_m_hour;
        protected $_m_min;
        protected $_m_sec;
        protected $_m_msec;

        /**
         * Year
         */
        public function year() { return $this->_m_year; }

        /**
         * Month (January = 1)
         */
        public function month() { return $this->_m_month; }

        /**
         * Day of week (Sun = 0)
         */
        public function dow() { return $this->_m_dow; }

        /**
         * Day of month
         */
        public function day() { return $this->_m_day; }

        /**
         * Hours
         */
        public function hour() { return $this->_m_hour; }

        /**
         * Minutes
         */
        public function min() { return $this->_m_min; }

        /**
         * Seconds
         */
        public function sec() { return $this->_m_sec; }

        /**
         * Milliseconds
         */
        public function msec() { return $this->_m_msec; }
    }
}
