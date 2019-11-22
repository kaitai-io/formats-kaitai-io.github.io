<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class TlsClientHello extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = new \TlsClientHello\Version($this->_io, $this, $this->_root);
        $this->_m_random = new \TlsClientHello\Random($this->_io, $this, $this->_root);
        $this->_m_sessionId = new \TlsClientHello\SessionId($this->_io, $this, $this->_root);
        $this->_m_cipherSuites = new \TlsClientHello\CipherSuites($this->_io, $this, $this->_root);
        $this->_m_compressionMethods = new \TlsClientHello\CompressionMethods($this->_io, $this, $this->_root);
        if ($this->_io()->isEof() == false) {
            $this->_m_extensions = new \TlsClientHello\Extensions($this->_io, $this, $this->_root);
        }
    }
    protected $_m_version;
    protected $_m_random;
    protected $_m_sessionId;
    protected $_m_cipherSuites;
    protected $_m_compressionMethods;
    protected $_m_extensions;
    public function version() { return $this->_m_version; }
    public function random() { return $this->_m_random; }
    public function sessionId() { return $this->_m_sessionId; }
    public function cipherSuites() { return $this->_m_cipherSuites; }
    public function compressionMethods() { return $this->_m_compressionMethods; }
    public function extensions() { return $this->_m_extensions; }
}

namespace \TlsClientHello;

class ServerName extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello\Sni $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_nameType = $this->_io->readU1();
        $this->_m_length = $this->_io->readU2be();
        $this->_m_hostName = $this->_io->readBytes($this->length());
    }
    protected $_m_nameType;
    protected $_m_length;
    protected $_m_hostName;
    public function nameType() { return $this->_m_nameType; }
    public function length() { return $this->_m_length; }
    public function hostName() { return $this->_m_hostName; }
}

namespace \TlsClientHello;

class Random extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_gmtUnixTime = $this->_io->readU4be();
        $this->_m_random = $this->_io->readBytes(28);
    }
    protected $_m_gmtUnixTime;
    protected $_m_random;
    public function gmtUnixTime() { return $this->_m_gmtUnixTime; }
    public function random() { return $this->_m_random; }
}

namespace \TlsClientHello;

class SessionId extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU1();
        $this->_m_sid = $this->_io->readBytes($this->len());
    }
    protected $_m_len;
    protected $_m_sid;
    public function len() { return $this->_m_len; }
    public function sid() { return $this->_m_sid; }
}

namespace \TlsClientHello;

class Sni extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello\Extension $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_listLength = $this->_io->readU2be();
        $this->_m_serverNames = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_serverNames[] = new \TlsClientHello\ServerName($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_listLength;
    protected $_m_serverNames;
    public function listLength() { return $this->_m_listLength; }
    public function serverNames() { return $this->_m_serverNames; }
}

namespace \TlsClientHello;

class CipherSuites extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU2be();
        $this->_m_cipherSuites = [];
        $n = intval($this->len() / 2);
        for ($i = 0; $i < $n; $i++) {
            $this->_m_cipherSuites[] = $this->_io->readU2be();
        }
    }
    protected $_m_len;
    protected $_m_cipherSuites;
    public function len() { return $this->_m_len; }
    public function cipherSuites() { return $this->_m_cipherSuites; }
}

namespace \TlsClientHello;

class CompressionMethods extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU1();
        $this->_m_compressionMethods = $this->_io->readBytes($this->len());
    }
    protected $_m_len;
    protected $_m_compressionMethods;
    public function len() { return $this->_m_len; }
    public function compressionMethods() { return $this->_m_compressionMethods; }
}

namespace \TlsClientHello;

class Alpn extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello\Extension $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_extLen = $this->_io->readU2be();
        $this->_m_alpnProtocols = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_alpnProtocols[] = new \TlsClientHello\Protocol($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_extLen;
    protected $_m_alpnProtocols;
    public function extLen() { return $this->_m_extLen; }
    public function alpnProtocols() { return $this->_m_alpnProtocols; }
}

namespace \TlsClientHello;

class Extensions extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = $this->_io->readU2be();
        $this->_m_extensions = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_extensions[] = new \TlsClientHello\Extension($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_len;
    protected $_m_extensions;
    public function len() { return $this->_m_len; }
    public function extensions() { return $this->_m_extensions; }
}

namespace \TlsClientHello;

class Version extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_major = $this->_io->readU1();
        $this->_m_minor = $this->_io->readU1();
    }
    protected $_m_major;
    protected $_m_minor;
    public function major() { return $this->_m_major; }
    public function minor() { return $this->_m_minor; }
}

namespace \TlsClientHello;

class Protocol extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello\Alpn $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_strlen = $this->_io->readU1();
        $this->_m_name = $this->_io->readBytes($this->strlen());
    }
    protected $_m_strlen;
    protected $_m_name;
    public function strlen() { return $this->_m_strlen; }
    public function name() { return $this->_m_name; }
}

namespace \TlsClientHello;

class Extension extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \TlsClientHello\Extensions $_parent = null, \TlsClientHello $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU2be();
        $this->_m_len = $this->_io->readU2be();
        switch ($this->type()) {
            case 0:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \TlsClientHello\Sni($io, $this, $this->_root);
                break;
            case 16:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \TlsClientHello\Alpn($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->len());
                break;
        }
    }
    protected $_m_type;
    protected $_m_len;
    protected $_m_body;
    protected $_m__raw_body;
    public function type() { return $this->_m_type; }
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}
