<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This spec can be used to parse sudo time stamp files located in directories
 * such as /run/sudo/ts/$USER or /var/lib/sudo/ts/$USER.
 */

namespace {
    class SudoersTs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SudoersTs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \SudoersTs\Record($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_records;
        public function records() { return $this->_m_records; }
    }
}

namespace SudoersTs {
    class RecordV2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SudoersTs\Record $_parent = null, \SudoersTs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU2le();
            $this->_m_flags = new \SudoersTs\TsFlag($this->_io, $this, $this->_root);
            $this->_m_authUid = $this->_io->readU4le();
            $this->_m_sid = $this->_io->readU4le();
            $this->_m_startTime = new \SudoersTs\Timespec($this->_io, $this, $this->_root);
            $this->_m_ts = new \SudoersTs\Timespec($this->_io, $this, $this->_root);
            if ($this->type() == \SudoersTs\TsType::TTY) {
                $this->_m_ttydev = $this->_io->readU4le();
            }
            if ($this->type() == \SudoersTs\TsType::PPID) {
                $this->_m_ppid = $this->_io->readU4le();
            }
        }
        protected $_m_type;
        protected $_m_flags;
        protected $_m_authUid;
        protected $_m_sid;
        protected $_m_startTime;
        protected $_m_ts;
        protected $_m_ttydev;
        protected $_m_ppid;

        /**
         * record type
         */
        public function type() { return $this->_m_type; }

        /**
         * record flags
         */
        public function flags() { return $this->_m_flags; }

        /**
         * user ID that was used for authentication
         */
        public function authUid() { return $this->_m_authUid; }

        /**
         * ID of the user's terminal session, if present (when type is TS_TTY)
         */
        public function sid() { return $this->_m_sid; }

        /**
         * start time of the session leader for records of type TS_TTY or of the parent process for records of type TS_PPID
         */
        public function startTime() { return $this->_m_startTime; }

        /**
         * actual time stamp, from a monotonic time source
         */
        public function ts() { return $this->_m_ts; }

        /**
         * device number of the terminal associated with the session
         */
        public function ttydev() { return $this->_m_ttydev; }

        /**
         * ID of the parent process
         */
        public function ppid() { return $this->_m_ppid; }
    }
}

namespace SudoersTs {
    class TsFlag extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SudoersTs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved0 = $this->_io->readBitsIntBe(6);
            $this->_m_anyuid = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_disabled = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_reserved1 = $this->_io->readBitsIntBe(8);
        }
        protected $_m_reserved0;
        protected $_m_anyuid;
        protected $_m_disabled;
        protected $_m_reserved1;

        /**
         * Reserved (unused) bits
         */
        public function reserved0() { return $this->_m_reserved0; }

        /**
         * ignore uid
         */
        public function anyuid() { return $this->_m_anyuid; }

        /**
         * entry disabled
         */
        public function disabled() { return $this->_m_disabled; }

        /**
         * Reserved (unused) bits
         */
        public function reserved1() { return $this->_m_reserved1; }
    }
}

namespace SudoersTs {
    class RecordV1 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SudoersTs\Record $_parent = null, \SudoersTs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU2le();
            $this->_m_flags = new \SudoersTs\TsFlag($this->_io, $this, $this->_root);
            $this->_m_authUid = $this->_io->readU4le();
            $this->_m_sid = $this->_io->readU4le();
            $this->_m_ts = new \SudoersTs\Timespec($this->_io, $this, $this->_root);
            if ($this->type() == \SudoersTs\TsType::TTY) {
                $this->_m_ttydev = $this->_io->readU4le();
            }
            if ($this->type() == \SudoersTs\TsType::PPID) {
                $this->_m_ppid = $this->_io->readU4le();
            }
        }
        protected $_m_type;
        protected $_m_flags;
        protected $_m_authUid;
        protected $_m_sid;
        protected $_m_ts;
        protected $_m_ttydev;
        protected $_m_ppid;

        /**
         * record type
         */
        public function type() { return $this->_m_type; }

        /**
         * record flags
         */
        public function flags() { return $this->_m_flags; }

        /**
         * user ID that was used for authentication
         */
        public function authUid() { return $this->_m_authUid; }

        /**
         * session ID associated with tty/ppid
         */
        public function sid() { return $this->_m_sid; }

        /**
         * time stamp, from a monotonic time source
         */
        public function ts() { return $this->_m_ts; }

        /**
         * device number of the terminal associated with the session
         */
        public function ttydev() { return $this->_m_ttydev; }

        /**
         * ID of the parent process
         */
        public function ppid() { return $this->_m_ppid; }
    }
}

namespace SudoersTs {
    class Timespec extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \SudoersTs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sec = $this->_io->readS8le();
            $this->_m_nsec = $this->_io->readS8le();
        }
        protected $_m_sec;
        protected $_m_nsec;

        /**
         * seconds
         */
        public function sec() { return $this->_m_sec; }

        /**
         * nanoseconds
         */
        public function nsec() { return $this->_m_nsec; }
    }
}

namespace SudoersTs {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \SudoersTs $_parent = null, \SudoersTs $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU2le();
            $this->_m_lenRecord = $this->_io->readU2le();
            switch ($this->version()) {
                case 1:
                    $this->_m__raw_payload = $this->_io->readBytes(($this->lenRecord() - 4));
                    $_io__raw_payload = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                    $this->_m_payload = new \SudoersTs\RecordV1($_io__raw_payload, $this, $this->_root);
                    break;
                case 2:
                    $this->_m__raw_payload = $this->_io->readBytes(($this->lenRecord() - 4));
                    $_io__raw_payload = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                    $this->_m_payload = new \SudoersTs\RecordV2($_io__raw_payload, $this, $this->_root);
                    break;
                default:
                    $this->_m_payload = $this->_io->readBytes(($this->lenRecord() - 4));
                    break;
            }
        }
        protected $_m_version;
        protected $_m_lenRecord;
        protected $_m_payload;
        protected $_m__raw_payload;

        /**
         * version number of the timestamp_entry struct
         */
        public function version() { return $this->_m_version; }

        /**
         * size of the record in bytes
         */
        public function lenRecord() { return $this->_m_lenRecord; }
        public function payload() { return $this->_m_payload; }
        public function _raw_payload() { return $this->_m__raw_payload; }
    }
}

namespace SudoersTs {
    class TsType {
        const GLOBAL = 1;
        const TTY = 2;
        const PPID = 3;
        const LOCKEXCL = 4;
    }
}
