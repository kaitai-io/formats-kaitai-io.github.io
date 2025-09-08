<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Native format of Hashcat password "recovery" utility
 */

namespace {
    class Hccapx extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Hccapx $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_records = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_records[] = new \Hccapx\HccapxRecord($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_records;
        public function records() { return $this->_m_records; }
    }
}

namespace Hccapx {
    class HccapxRecord extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Hccapx $_parent = null, ?\Hccapx $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x48\x43\x50\x58")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x48\x43\x50\x58", $this->_m_magic, $this->_io, "/types/hccapx_record/seq/0");
            }
            $this->_m_version = $this->_io->readU4le();
            $this->_m_ignoreReplayCounter = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_messagePair = $this->_io->readBitsIntBe(7);
            $this->_io->alignToByte();
            $this->_m_lenEssid = $this->_io->readU1();
            $this->_m_essid = $this->_io->readBytes($this->lenEssid());
            $this->_m_padding1 = $this->_io->readBytes(32 - $this->lenEssid());
            $this->_m_keyver = $this->_io->readU1();
            $this->_m_keymic = $this->_io->readBytes(16);
            $this->_m_macAp = $this->_io->readBytes(6);
            $this->_m_nonceAp = $this->_io->readBytes(32);
            $this->_m_macStation = $this->_io->readBytes(6);
            $this->_m_nonceStation = $this->_io->readBytes(32);
            $this->_m_lenEapol = $this->_io->readU2le();
            $this->_m_eapol = $this->_io->readBytes($this->lenEapol());
            $this->_m_padding2 = $this->_io->readBytes(256 - $this->lenEapol());
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_ignoreReplayCounter;
        protected $_m_messagePair;
        protected $_m_lenEssid;
        protected $_m_essid;
        protected $_m_padding1;
        protected $_m_keyver;
        protected $_m_keymic;
        protected $_m_macAp;
        protected $_m_nonceAp;
        protected $_m_macStation;
        protected $_m_nonceStation;
        protected $_m_lenEapol;
        protected $_m_eapol;
        protected $_m_padding2;
        public function magic() { return $this->_m_magic; }

        /**
         * The version number of the .hccapx file format.
         */
        public function version() { return $this->_m_version; }

        /**
         * Indicates if the message pair matching was done based on
         * replay counter or not.
         * 
         * Whenever it was set to 1 it means that the replay counter
         * was ignored (i.e. it was not considered at all by the
         * matching algorithm).
         * 
         * Hashcat currently does not perform any particular action
         * based on this bit, but nonetheless this information could be
         * crucial for some 3th party tools and for
         * analysis/statistics. There could be some opportunity to
         * implement some further logic based on this particular
         * information also within hashcat (in the future).
         */
        public function ignoreReplayCounter() { return $this->_m_ignoreReplayCounter; }

        /**
         * The message_pair value describes which messages of the 4-way
         * handshake were combined to form the .hccapx structure. It is
         * always a pair of 2 messages: 1 from the AP (access point)
         * and 1 from the STA (client).
         * 
         * Furthermore, the message_pair value also gives a hint from
         * which of the 2 messages the EAPOL origins. This is
         * interesting data, but not necessarily needed for hashcat to
         * be able to crack the hash.
         * 
         * On the other hand, it could be very important to know if
         * "only" message 1 and message 2 were captured or if for
         * instance message 3 and/or message 4 were captured too. If
         * message 3 and/or message 4 were captured it should be a hard
         * evidence that the connection was established and that the
         * password the client used was the correct one.
         */
        public function messagePair() { return $this->_m_messagePair; }
        public function lenEssid() { return $this->_m_lenEssid; }
        public function essid() { return $this->_m_essid; }
        public function padding1() { return $this->_m_padding1; }

        /**
         * The flag used to distinguish WPA from WPA2 ciphers. Value of
         * 1 means WPA, other - WPA2.
         */
        public function keyver() { return $this->_m_keyver; }

        /**
         * The final hash value. MD5 for WPA and SHA-1 for WPA2
         * (truncated to 128 bit).
         */
        public function keymic() { return $this->_m_keymic; }

        /**
         * The BSSID (MAC address) of the access point.
         */
        public function macAp() { return $this->_m_macAp; }

        /**
         * Nonce (random salt) generated by the access point.
         */
        public function nonceAp() { return $this->_m_nonceAp; }

        /**
         * The MAC address of the client connecting to the access point.
         */
        public function macStation() { return $this->_m_macStation; }

        /**
         * Nonce (random salt) generated by the client connecting to the access point.
         */
        public function nonceStation() { return $this->_m_nonceStation; }

        /**
         * The length of the EAPOL data.
         */
        public function lenEapol() { return $this->_m_lenEapol; }
        public function eapol() { return $this->_m_eapol; }
        public function padding2() { return $this->_m_padding2; }
    }
}
