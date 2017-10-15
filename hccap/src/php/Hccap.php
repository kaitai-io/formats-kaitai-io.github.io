<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Native format of Hashcat password "recovery" utility
 * A sample of file for testing can be downloaded from https://web.archive.org/web/20150220013635if_/http://hashcat.net:80/misc/example_hashes/hashcat.hccap
 */

class Hccap extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Hccap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_records = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_records[] = new \Hccap\Hccap($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_records;
    public function records() { return $this->_m_records; }
}

namespace \Hccap;

class Hccap extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Hccap $_parent = null, \Hccap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_essid = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(36), 0, false), "utf-8");
        $this->_m_apMac = $this->_io->readBytes(6);
        $this->_m_stantionMac = $this->_io->readBytes(6);
        $this->_m_stantionNonce = $this->_io->readBytes(32);
        $this->_m_apNonce = $this->_io->readBytes(32);
        $this->_m__raw_eapol = $this->_io->readBytes(256);
        $io = new \Kaitai\Struct\Stream($this->_m__raw_eapol);
        $this->_m_eapol = new \Hccap\EapolFrame($io, $this, $this->_root);
        $this->_m_eapolSize = $this->_io->readU4le();
        $this->_m_keyver = $this->_io->readU4le();
        $this->_m_keymic = $this->_io->readBytes(16);
    }
    protected $_m_essid;
    protected $_m_apMac;
    protected $_m_stantionMac;
    protected $_m_stantionNonce;
    protected $_m_apNonce;
    protected $_m_eapol;
    protected $_m_eapolSize;
    protected $_m_keyver;
    protected $_m_keymic;
    protected $_m__raw_eapol;
    public function essid() { return $this->_m_essid; }

    /**
     * the bssid(MAC) of the access point
     */
    public function apMac() { return $this->_m_apMac; }

    /**
     * the MAC address of a client connecting to the access point
     */
    public function stantionMac() { return $this->_m_stantionMac; }
    public function stantionNonce() { return $this->_m_stantionNonce; }
    public function apNonce() { return $this->_m_apNonce; }
    public function eapol() { return $this->_m_eapol; }

    /**
     * size of eapol
     */
    public function eapolSize() { return $this->_m_eapolSize; }

    /**
     * the flag used to distinguish WPA from WPA2 ciphers. Value of 1 means WPA, other - WPA2
     */
    public function keyver() { return $this->_m_keyver; }

    /**
     * the final hash value. MD5 for WPA and SHA-1 for WPA2 (truncated to 128 bit)
     */
    public function keymic() { return $this->_m_keymic; }
    public function _raw_eapol() { return $this->_m__raw_eapol; }
}

namespace \Hccap;

class EapolFrame extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Hccap\Hccap $_parent = null, \Hccap $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $_pos = $this->_io->pos();
        $this->_io->seek(0);
        $this->_m_body = $this->_io->readBytes($this->_parent()->eapolSize());
        $this->_io->seek($_pos);
        return $this->_m_body;
    }
}
