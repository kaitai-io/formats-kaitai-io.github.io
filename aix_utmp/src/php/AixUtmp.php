<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This spec can be used to parse utmp, wtmp and other similar as created by IBM AIX.
 */

namespace {
    class AixUtmp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AixUtmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \AixUtmp\Record($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_records;
        public function records() { return $this->_m_records; }
    }
}

namespace AixUtmp {
    class Record extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AixUtmp $_parent = null, \AixUtmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_user = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(256), "ascii");
            $this->_m_inittabId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(14), "ascii");
            $this->_m_device = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(64), "ascii");
            $this->_m_pid = $this->_io->readU8be();
            $this->_m_type = $this->_io->readS2be();
            $this->_m_timestamp = $this->_io->readS8be();
            $this->_m_exitStatus = new \AixUtmp\ExitStatus($this->_io, $this, $this->_root);
            $this->_m_hostname = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(256), "ascii");
            $this->_m_dblWordPad = $this->_io->readS4be();
            $this->_m_reservedA = $this->_io->readBytes(8);
            $this->_m_reservedV = $this->_io->readBytes(24);
        }
        protected $_m_user;
        protected $_m_inittabId;
        protected $_m_device;
        protected $_m_pid;
        protected $_m_type;
        protected $_m_timestamp;
        protected $_m_exitStatus;
        protected $_m_hostname;
        protected $_m_dblWordPad;
        protected $_m_reservedA;
        protected $_m_reservedV;

        /**
         * User login name
         */
        public function user() { return $this->_m_user; }

        /**
         * /etc/inittab id
         */
        public function inittabId() { return $this->_m_inittabId; }

        /**
         * device name (console, lnxx)
         */
        public function device() { return $this->_m_device; }

        /**
         * process id
         */
        public function pid() { return $this->_m_pid; }

        /**
         * Type of login
         */
        public function type() { return $this->_m_type; }

        /**
         * time entry was made
         */
        public function timestamp() { return $this->_m_timestamp; }

        /**
         * the exit status of a process marked as DEAD PROCESS
         */
        public function exitStatus() { return $this->_m_exitStatus; }

        /**
         * host name
         */
        public function hostname() { return $this->_m_hostname; }
        public function dblWordPad() { return $this->_m_dblWordPad; }
        public function reservedA() { return $this->_m_reservedA; }
        public function reservedV() { return $this->_m_reservedV; }
    }
}

namespace AixUtmp {
    class ExitStatus extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \AixUtmp\Record $_parent = null, \AixUtmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_terminationCode = $this->_io->readS2be();
            $this->_m_exitCode = $this->_io->readS2be();
        }
        protected $_m_terminationCode;
        protected $_m_exitCode;

        /**
         * process termination status
         */
        public function terminationCode() { return $this->_m_terminationCode; }

        /**
         * process exit status
         */
        public function exitCode() { return $this->_m_exitCode; }
    }
}

namespace AixUtmp {
    class EntryType {
        const EMPTY = 0;
        const RUN_LVL = 1;
        const BOOT_TIME = 2;
        const OLD_TIME = 3;
        const NEW_TIME = 4;
        const INIT_PROCESS = 5;
        const LOGIN_PROCESS = 6;
        const USER_PROCESS = 7;
        const DEAD_PROCESS = 8;
        const ACCOUNTING = 9;
    }
}
