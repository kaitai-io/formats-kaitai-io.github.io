<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * (No support for Auth-Name + Add-Name for simplicity)
 */

class DnsPacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_transactionId = $this->_io->readU2be();
        $this->_m_flags = new \DnsPacket\PacketFlags($this->_io, $this, $this->_root);
        if ($this->flags()->isOpcodeValid()) {
            $this->_m_qdcount = $this->_io->readU2be();
        }
        if ($this->flags()->isOpcodeValid()) {
            $this->_m_ancount = $this->_io->readU2be();
        }
        if ($this->flags()->isOpcodeValid()) {
            $this->_m_nscount = $this->_io->readU2be();
        }
        if ($this->flags()->isOpcodeValid()) {
            $this->_m_arcount = $this->_io->readU2be();
        }
        if ($this->flags()->isOpcodeValid()) {
            $this->_m_queries = [];
            $n = $this->qdcount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_queries[] = new \DnsPacket\Query($this->_io, $this, $this->_root);
            }
        }
        if ($this->flags()->isOpcodeValid()) {
            $this->_m_answers = [];
            $n = $this->ancount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_answers[] = new \DnsPacket\Answer($this->_io, $this, $this->_root);
            }
        }
        if ($this->flags()->isOpcodeValid()) {
            $this->_m_additionals = [];
            $n = $this->arcount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_additionals[] = new \DnsPacket\Answer($this->_io, $this, $this->_root);
            }
        }
    }
    protected $_m_transactionId;
    protected $_m_flags;
    protected $_m_qdcount;
    protected $_m_ancount;
    protected $_m_nscount;
    protected $_m_arcount;
    protected $_m_queries;
    protected $_m_answers;
    protected $_m_additionals;

    /**
     * ID to keep track of request/responces
     */
    public function transactionId() { return $this->_m_transactionId; }
    public function flags() { return $this->_m_flags; }

    /**
     * How many questions are there
     */
    public function qdcount() { return $this->_m_qdcount; }

    /**
     * Number of resource records answering the question
     */
    public function ancount() { return $this->_m_ancount; }

    /**
     * Number of resource records pointing toward an authority
     */
    public function nscount() { return $this->_m_nscount; }

    /**
     * Number of resource records holding additional information
     */
    public function arcount() { return $this->_m_arcount; }
    public function queries() { return $this->_m_queries; }
    public function answers() { return $this->_m_answers; }
    public function additionals() { return $this->_m_additionals; }
}

namespace \DnsPacket;

class PointerStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket\Label $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_value = $this->_io->readU1();
    }
    protected $_m_contents;
    public function contents() {
        if ($this->_m_contents !== null)
            return $this->_m_contents;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek(($this->value() + (($this->_parent()->length() - 192) << 8)));
        $this->_m_contents = new \DnsPacket\DomainName($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_contents;
    }
    protected $_m_value;

    /**
     * Read one byte, then offset to that position, read one domain-name and return
     */
    public function value() { return $this->_m_value; }
}

namespace \DnsPacket;

class Label extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket\DomainName $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU1();
        if ($this->isPointer()) {
            $this->_m_pointer = new \DnsPacket\PointerStruct($this->_io, $this, $this->_root);
        }
        if (!($this->isPointer())) {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->length()), "utf-8");
        }
    }
    protected $_m_isPointer;
    public function isPointer() {
        if ($this->_m_isPointer !== null)
            return $this->_m_isPointer;
        $this->_m_isPointer = $this->length() >= 192;
        return $this->_m_isPointer;
    }
    protected $_m_length;
    protected $_m_pointer;
    protected $_m_name;

    /**
     * RFC1035 4.1.4: If the first two bits are raised it's a pointer-offset to a previously defined name
     */
    public function length() { return $this->_m_length; }
    public function pointer() { return $this->_m_pointer; }

    /**
     * Otherwise its a string the length of the length value
     */
    public function name() { return $this->_m_name; }
}

namespace \DnsPacket;

class Query extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = new \DnsPacket\DomainName($this->_io, $this, $this->_root);
        $this->_m_type = $this->_io->readU2be();
        $this->_m_queryClass = $this->_io->readU2be();
    }
    protected $_m_name;
    protected $_m_type;
    protected $_m_queryClass;
    public function name() { return $this->_m_name; }
    public function type() { return $this->_m_type; }
    public function queryClass() { return $this->_m_queryClass; }
}

namespace \DnsPacket;

class DomainName extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = [];
        $i = 0;
        do {
            $_ = new \DnsPacket\Label($this->_io, $this, $this->_root);
            $this->_m_name[] = $_;
            $i++;
        } while (!( (($_->length() == 0) || ($_->length() >= 192)) ));
    }
    protected $_m_name;

    /**
     * Repeat until the length is 0 or it is a pointer (bit-hack to get around lack of OR operator)
     */
    public function name() { return $this->_m_name; }
}

namespace \DnsPacket;

class Service extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket\Answer $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_priority = $this->_io->readU2be();
        $this->_m_weight = $this->_io->readU2be();
        $this->_m_port = $this->_io->readU2be();
        $this->_m_target = new \DnsPacket\DomainName($this->_io, $this, $this->_root);
    }
    protected $_m_priority;
    protected $_m_weight;
    protected $_m_port;
    protected $_m_target;
    public function priority() { return $this->_m_priority; }
    public function weight() { return $this->_m_weight; }
    public function port() { return $this->_m_port; }
    public function target() { return $this->_m_target; }
}

namespace \DnsPacket;

class Txt extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket\TxtBody $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU1();
        $this->_m_text = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->length()), "utf-8");
    }
    protected $_m_length;
    protected $_m_text;
    public function length() { return $this->_m_length; }
    public function text() { return $this->_m_text; }
}

namespace \DnsPacket;

class TxtBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket\Answer $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_data[] = new \DnsPacket\Txt($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_data;
    public function data() { return $this->_m_data; }
}

namespace \DnsPacket;

class Address extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket\Answer $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_ip = [];
        $n = 4;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_ip[] = $this->_io->readU1();
        }
    }
    protected $_m_ip;
    public function ip() { return $this->_m_ip; }
}

namespace \DnsPacket;

class Answer extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = new \DnsPacket\DomainName($this->_io, $this, $this->_root);
        $this->_m_type = $this->_io->readU2be();
        $this->_m_answerClass = $this->_io->readU2be();
        $this->_m_ttl = $this->_io->readS4be();
        $this->_m_rdlength = $this->_io->readU2be();
        switch ($this->type()) {
            case \DnsPacket\TypeType::PTR:
                $this->_m__raw_payload = $this->_io->readBytes($this->rdlength());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                $this->_m_payload = new \DnsPacket\DomainName($io, $this, $this->_root);
                break;
            case \DnsPacket\TypeType::CNAME:
                $this->_m__raw_payload = $this->_io->readBytes($this->rdlength());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                $this->_m_payload = new \DnsPacket\DomainName($io, $this, $this->_root);
                break;
            case \DnsPacket\TypeType::TXT:
                $this->_m__raw_payload = $this->_io->readBytes($this->rdlength());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                $this->_m_payload = new \DnsPacket\TxtBody($io, $this, $this->_root);
                break;
            case \DnsPacket\TypeType::SRV:
                $this->_m__raw_payload = $this->_io->readBytes($this->rdlength());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                $this->_m_payload = new \DnsPacket\Service($io, $this, $this->_root);
                break;
            case \DnsPacket\TypeType::A:
                $this->_m__raw_payload = $this->_io->readBytes($this->rdlength());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
                $this->_m_payload = new \DnsPacket\Address($io, $this, $this->_root);
                break;
            default:
                $this->_m_payload = $this->_io->readBytes($this->rdlength());
                break;
        }
    }
    protected $_m_name;
    protected $_m_type;
    protected $_m_answerClass;
    protected $_m_ttl;
    protected $_m_rdlength;
    protected $_m_payload;
    protected $_m__raw_payload;
    public function name() { return $this->_m_name; }
    public function type() { return $this->_m_type; }
    public function answerClass() { return $this->_m_answerClass; }

    /**
     * Time to live (in seconds)
     */
    public function ttl() { return $this->_m_ttl; }

    /**
     * Length in octets of the following payload
     */
    public function rdlength() { return $this->_m_rdlength; }
    public function payload() { return $this->_m_payload; }
    public function _raw_payload() { return $this->_m__raw_payload; }
}

namespace \DnsPacket;

class PacketFlags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \DnsPacket $_parent = null, \DnsPacket $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flag = $this->_io->readU2be();
    }
    protected $_m_qr;
    public function qr() {
        if ($this->_m_qr !== null)
            return $this->_m_qr;
        $this->_m_qr = (($this->flag() & 32768) >> 15);
        return $this->_m_qr;
    }
    protected $_m_ra;
    public function ra() {
        if ($this->_m_ra !== null)
            return $this->_m_ra;
        $this->_m_ra = (($this->flag() & 128) >> 7);
        return $this->_m_ra;
    }
    protected $_m_tc;
    public function tc() {
        if ($this->_m_tc !== null)
            return $this->_m_tc;
        $this->_m_tc = (($this->flag() & 512) >> 9);
        return $this->_m_tc;
    }
    protected $_m_isOpcodeValid;
    public function isOpcodeValid() {
        if ($this->_m_isOpcodeValid !== null)
            return $this->_m_isOpcodeValid;
        $this->_m_isOpcodeValid =  (($this->opcode() == 0) || ($this->opcode() == 1) || ($this->opcode() == 2)) ;
        return $this->_m_isOpcodeValid;
    }
    protected $_m_rcode;
    public function rcode() {
        if ($this->_m_rcode !== null)
            return $this->_m_rcode;
        $this->_m_rcode = (($this->flag() & 15) >> 0);
        return $this->_m_rcode;
    }
    protected $_m_opcode;
    public function opcode() {
        if ($this->_m_opcode !== null)
            return $this->_m_opcode;
        $this->_m_opcode = (($this->flag() & 30720) >> 11);
        return $this->_m_opcode;
    }
    protected $_m_aa;
    public function aa() {
        if ($this->_m_aa !== null)
            return $this->_m_aa;
        $this->_m_aa = (($this->flag() & 1024) >> 10);
        return $this->_m_aa;
    }
    protected $_m_z;
    public function z() {
        if ($this->_m_z !== null)
            return $this->_m_z;
        $this->_m_z = (($this->flag() & 64) >> 6);
        return $this->_m_z;
    }
    protected $_m_rd;
    public function rd() {
        if ($this->_m_rd !== null)
            return $this->_m_rd;
        $this->_m_rd = (($this->flag() & 256) >> 8);
        return $this->_m_rd;
    }
    protected $_m_cd;
    public function cd() {
        if ($this->_m_cd !== null)
            return $this->_m_cd;
        $this->_m_cd = (($this->flag() & 16) >> 4);
        return $this->_m_cd;
    }
    protected $_m_ad;
    public function ad() {
        if ($this->_m_ad !== null)
            return $this->_m_ad;
        $this->_m_ad = (($this->flag() & 32) >> 5);
        return $this->_m_ad;
    }
    protected $_m_flag;
    public function flag() { return $this->_m_flag; }
}

namespace \DnsPacket;

class ClassType {
    const IN_CLASS = 1;
    const CS = 2;
    const CH = 3;
    const HS = 4;
}

namespace \DnsPacket;

class TypeType {
    const A = 1;
    const NS = 2;
    const MD = 3;
    const MF = 4;
    const CNAME = 5;
    const SOE = 6;
    const MB = 7;
    const MG = 8;
    const MR = 9;
    const NULL = 10;
    const WKS = 11;
    const PTR = 12;
    const HINFO = 13;
    const MINFO = 14;
    const MX = 15;
    const TXT = 16;
    const SRV = 33;
}
