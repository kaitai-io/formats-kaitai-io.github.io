<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class BitcoinTransaction extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \BitcoinTransaction $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU4le();
        $this->_m_numVins = $this->_io->readU1();
        $this->_m_vins = [];
        $n = $this->numVins();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_vins[] = new \BitcoinTransaction\Vin($this->_io, $this, $this->_root);
        }
        $this->_m_numVouts = $this->_io->readU1();
        $this->_m_vouts = [];
        $n = $this->numVouts();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_vouts[] = new \BitcoinTransaction\Vout($this->_io, $this, $this->_root);
        }
        $this->_m_locktime = $this->_io->readU4le();
    }
    protected $_m_version;
    protected $_m_numVins;
    protected $_m_vins;
    protected $_m_numVouts;
    protected $_m_vouts;
    protected $_m_locktime;

    /**
     * Version number.
     */
    public function version() { return $this->_m_version; }

    /**
     * Number of input transactions.
     */
    public function numVins() { return $this->_m_numVins; }

    /**
     * Input transactions.
     * An input refers to an output from a previous transaction.
     */
    public function vins() { return $this->_m_vins; }

    /**
     * Number of output transactions.
     */
    public function numVouts() { return $this->_m_numVouts; }

    /**
     * Output transactions.
     */
    public function vouts() { return $this->_m_vouts; }
    public function locktime() { return $this->_m_locktime; }
}

namespace \BitcoinTransaction;

class Vout extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BitcoinTransaction $_parent = null, \BitcoinTransaction $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_amount = $this->_io->readU8le();
        $this->_m_scriptLen = $this->_io->readU1();
        $this->_m_scriptPubKey = $this->_io->readBytes($this->scriptLen());
    }
    protected $_m_amount;
    protected $_m_scriptLen;
    protected $_m_scriptPubKey;

    /**
     * Number of Satoshis to be transfered.
     */
    public function amount() { return $this->_m_amount; }

    /**
     * ScriptPubKey's length.
     */
    public function scriptLen() { return $this->_m_scriptLen; }

    /**
     * ScriptPubKey.
     */
    public function scriptPubKey() { return $this->_m_scriptPubKey; }
}

namespace \BitcoinTransaction;

class PublicKey extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BitcoinTransaction\ScriptSignature $_parent = null, \BitcoinTransaction $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU1();
        $this->_m_x = $this->_io->readBytes(32);
        $this->_m_y = $this->_io->readBytes(32);
    }
    protected $_m_type;
    protected $_m_x;
    protected $_m_y;
    public function type() { return $this->_m_type; }

    /**
     * 'x' coordinate of the public key on the elliptic curve.
     */
    public function x() { return $this->_m_x; }

    /**
     * 'y' coordinate of the public key on the elliptic curve.
     */
    public function y() { return $this->_m_y; }
}

namespace \BitcoinTransaction;

class Vin extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BitcoinTransaction $_parent = null, \BitcoinTransaction $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_txid = $this->_io->readBytes(32);
        $this->_m_outputId = $this->_io->readU4le();
        $this->_m_scriptLen = $this->_io->readU1();
        $this->_m__raw_scriptSig = $this->_io->readBytes($this->scriptLen());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_scriptSig);
        $this->_m_scriptSig = new \BitcoinTransaction\ScriptSignature($io, $this, $this->_root);
        $this->_m_endOfVin = $this->_io->ensureFixedContents("\xFF\xFF\xFF\xFF");
    }
    protected $_m_txid;
    protected $_m_outputId;
    protected $_m_scriptLen;
    protected $_m_scriptSig;
    protected $_m_endOfVin;
    protected $_m__raw_scriptSig;

    /**
     * Previous transaction hash.
     */
    public function txid() { return $this->_m_txid; }

    /**
     * ID indexing an ouput of the transaction refered by txid.
     * This output will be used as an input in the present transaction.
     */
    public function outputId() { return $this->_m_outputId; }

    /**
     * ScriptSig's length.
     */
    public function scriptLen() { return $this->_m_scriptLen; }

    /**
     * ScriptSig.
     */
    public function scriptSig() { return $this->_m_scriptSig; }

    /**
     * Magic number indicating the end of the current input.
     */
    public function endOfVin() { return $this->_m_endOfVin; }
    public function _raw_scriptSig() { return $this->_m__raw_scriptSig; }
}

namespace \BitcoinTransaction;

class ScriptSignature extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BitcoinTransaction\Vin $_parent = null, \BitcoinTransaction $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sigStackLen = $this->_io->readU1();
        $this->_m_derSig = new \BitcoinTransaction\DerSignature($this->_io, $this, $this->_root);
        $this->_m_sigType = $this->_io->readU1();
        $this->_m_pubkeyStackLen = $this->_io->readU1();
        $this->_m_pubkey = new \BitcoinTransaction\PublicKey($this->_io, $this, $this->_root);
    }
    protected $_m_sigStackLen;
    protected $_m_derSig;
    protected $_m_sigType;
    protected $_m_pubkeyStackLen;
    protected $_m_pubkey;
    public function sigStackLen() { return $this->_m_sigStackLen; }

    /**
     * DER-encoded ECDSA signature.
     */
    public function derSig() { return $this->_m_derSig; }

    /**
     * Type of signature.
     */
    public function sigType() { return $this->_m_sigType; }
    public function pubkeyStackLen() { return $this->_m_pubkeyStackLen; }

    /**
     * Public key (bitcoin address of the recipient).
     */
    public function pubkey() { return $this->_m_pubkey; }
}

namespace \BitcoinTransaction;

class DerSignature extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BitcoinTransaction\ScriptSignature $_parent = null, \BitcoinTransaction $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sequence = $this->_io->ensureFixedContents("\x30");
        $this->_m_sigLen = $this->_io->readU1();
        $this->_m_sep1 = $this->_io->ensureFixedContents("\x02");
        $this->_m_sigRLen = $this->_io->readU1();
        $this->_m_sigR = $this->_io->readBytes($this->sigRLen());
        $this->_m_sep2 = $this->_io->ensureFixedContents("\x02");
        $this->_m_sigSLen = $this->_io->readU1();
        $this->_m_sigS = $this->_io->readBytes($this->sigSLen());
    }
    protected $_m_sequence;
    protected $_m_sigLen;
    protected $_m_sep1;
    protected $_m_sigRLen;
    protected $_m_sigR;
    protected $_m_sep2;
    protected $_m_sigSLen;
    protected $_m_sigS;
    public function sequence() { return $this->_m_sequence; }
    public function sigLen() { return $this->_m_sigLen; }
    public function sep1() { return $this->_m_sep1; }

    /**
     * 'r' value's length.
     */
    public function sigRLen() { return $this->_m_sigRLen; }

    /**
     * 'r' value of the ECDSA signature.
     */
    public function sigR() { return $this->_m_sigR; }
    public function sep2() { return $this->_m_sep2; }

    /**
     * 's' value's length.
     */
    public function sigSLen() { return $this->_m_sigSLen; }

    /**
     * 's' value of the ECDSA signature.
     */
    public function sigS() { return $this->_m_sigS; }
}

namespace \BitcoinTransaction;

class SighashType {
    const SIGHASH_ALL = 1;
    const SIGHASH_NONE = 2;
    const SIGHASH_SINGLE = 3;
    const SIGHASH_ANYONECANPAY = 80;
}
