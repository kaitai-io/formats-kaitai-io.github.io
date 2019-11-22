<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class GlibcUtmp extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \GlibcUtmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__raw_records = [];
        $this->_m_records = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m__raw_records[] = $this->_io->readBytes(384);
            $io = new \Kaitai\Struct\Stream(end($this->_m__raw_records));
            $this->_m_records[] = new \GlibcUtmp\Record($io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_records;
    protected $_m__raw_records;
    public function records() { return $this->_m_records; }
    public function _raw_records() { return $this->_m__raw_records; }
}

namespace \GlibcUtmp;

class Record extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \GlibcUtmp $_parent = null, \GlibcUtmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_utType = $this->_io->readS4le();
        $this->_m_pid = $this->_io->readU4le();
        $this->_m_line = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "UTF-8");
        $this->_m_id = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
        $this->_m_user = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "UTF-8");
        $this->_m_host = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(256), "UTF-8");
        $this->_m_exit = $this->_io->readU4le();
        $this->_m_session = $this->_io->readS4le();
        $this->_m_tv = new \GlibcUtmp\Timeval($this->_io, $this, $this->_root);
        $this->_m_addrV6 = $this->_io->readBytes(16);
        $this->_m_reserved = $this->_io->readBytes(20);
    }
    protected $_m_utType;
    protected $_m_pid;
    protected $_m_line;
    protected $_m_id;
    protected $_m_user;
    protected $_m_host;
    protected $_m_exit;
    protected $_m_session;
    protected $_m_tv;
    protected $_m_addrV6;
    protected $_m_reserved;

    /**
     * Type of login
     */
    public function utType() { return $this->_m_utType; }

    /**
     * Process ID of login process
     */
    public function pid() { return $this->_m_pid; }

    /**
     * Devicename
     */
    public function line() { return $this->_m_line; }

    /**
     * Inittab ID
     */
    public function id() { return $this->_m_id; }

    /**
     * Username
     */
    public function user() { return $this->_m_user; }

    /**
     * Hostname for remote login
     */
    public function host() { return $this->_m_host; }

    /**
     * Exit status of a process marked as DEAD_PROCESS
     */
    public function exit() { return $this->_m_exit; }

    /**
     * Session ID, used for windowing
     */
    public function session() { return $this->_m_session; }

    /**
     * Time entry was made
     */
    public function tv() { return $this->_m_tv; }

    /**
     * Internet address of remote host
     */
    public function addrV6() { return $this->_m_addrV6; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \GlibcUtmp;

class Timeval extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \GlibcUtmp\Record $_parent = null, \GlibcUtmp $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sec = $this->_io->readS4le();
        $this->_m_usec = $this->_io->readS4le();
    }
    protected $_m_sec;
    protected $_m_usec;

    /**
     * Seconds
     */
    public function sec() { return $this->_m_sec; }

    /**
     * Microseconds
     */
    public function usec() { return $this->_m_usec; }
}

namespace \GlibcUtmp;

class EntryType {
    const EMPTY = 0;
    const RUN_LVL = 1;
    const BOOT_TIME = 2;
    const NEW_TIME = 3;
    const OLD_TIME = 4;
    const INIT_PROCESS = 5;
    const LOGIN_PROCESS = 6;
    const USER_PROCESS = 7;
    const DEAD_PROCESS = 8;
    const ACCOUNTING = 9;
}
