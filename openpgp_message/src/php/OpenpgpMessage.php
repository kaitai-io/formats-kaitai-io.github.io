<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The OpenPGP Message Format is a format to store encryption and signature keys for emails.
 */

class OpenpgpMessage extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_packets = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_packets[] = new \OpenpgpMessage\Packet($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_packets;
    public function packets() { return $this->_m_packets; }
}

namespace \OpenpgpMessage;

class PreferredHashAlgorithms extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_algorithm = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_algorithm[] = $this->_io->readU1();
            $i++;
        }
    }
    protected $_m_algorithm;
    public function algorithm() { return $this->_m_algorithm; }
}

namespace \OpenpgpMessage;

class PreferredCompressionAlgorithms extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_algorithm = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_algorithm[] = $this->_io->readU1();
            $i++;
        }
    }
    protected $_m_algorithm;
    public function algorithm() { return $this->_m_algorithm; }
}

namespace \OpenpgpMessage;

class SignersUserId extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_userId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
    }
    protected $_m_userId;
    public function userId() { return $this->_m_userId; }
}

namespace \OpenpgpMessage;

class SecretKeyPacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\OldPacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_publicKey = new \OpenpgpMessage\PublicKeyPacket($this->_io, $this, $this->_root);
        $this->_m_stringToKey = $this->_io->readU1();
        if ($this->stringToKey() >= 254) {
            $this->_m_symmetricEncryptionAlgorithm = $this->_io->readU1();
        }
        $this->_m_secretKey = $this->_io->readBytesFull();
    }
    protected $_m_publicKey;
    protected $_m_stringToKey;
    protected $_m_symmetricEncryptionAlgorithm;
    protected $_m_secretKey;
    public function publicKey() { return $this->_m_publicKey; }
    public function stringToKey() { return $this->_m_stringToKey; }
    public function symmetricEncryptionAlgorithm() { return $this->_m_symmetricEncryptionAlgorithm; }
    public function secretKey() { return $this->_m_secretKey; }
}

namespace \OpenpgpMessage;

class KeyServerPreferences extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flag = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_flag[] = $this->_io->readU1();
            $i++;
        }
    }
    protected $_m_flag;
    public function flag() { return $this->_m_flag; }
}

namespace \OpenpgpMessage;

class RegularExpression extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_regex = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
    }
    protected $_m_regex;
    public function regex() { return $this->_m_regex; }
}

namespace \OpenpgpMessage;

class Subpackets extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\SignaturePacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_subpacketss = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_subpacketss[] = new \OpenpgpMessage\Subpacket($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_subpacketss;
    public function subpacketss() { return $this->_m_subpacketss; }
}

namespace \OpenpgpMessage;

class RevocationKey extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_class = $this->_io->readU1();
        $this->_m_publicKeyAlgorithm = $this->_io->readU1();
        $this->_m_fingerprint = $this->_io->readBytes(20);
    }
    protected $_m_class;
    protected $_m_publicKeyAlgorithm;
    protected $_m_fingerprint;
    public function class() { return $this->_m_class; }
    public function publicKeyAlgorithm() { return $this->_m_publicKeyAlgorithm; }
    public function fingerprint() { return $this->_m_fingerprint; }
}

namespace \OpenpgpMessage;

class UserIdPacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\OldPacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_userId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
    }
    protected $_m_userId;
    public function userId() { return $this->_m_userId; }
}

namespace \OpenpgpMessage;

class PolicyUri extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_uri = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
    }
    protected $_m_uri;
    public function uri() { return $this->_m_uri; }
}

namespace \OpenpgpMessage;

class SignatureTarget extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_publicKeyAlgorithm = $this->_io->readU1();
        $this->_m_hashAlgorithm = $this->_io->readU1();
        $this->_m_hash = $this->_io->readBytesFull();
    }
    protected $_m_publicKeyAlgorithm;
    protected $_m_hashAlgorithm;
    protected $_m_hash;
    public function publicKeyAlgorithm() { return $this->_m_publicKeyAlgorithm; }
    public function hashAlgorithm() { return $this->_m_hashAlgorithm; }
    public function hash() { return $this->_m_hash; }
}

namespace \OpenpgpMessage;

class KeyFlags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flag = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_flag[] = $this->_io->readU1();
            $i++;
        }
    }
    protected $_m_flag;
    public function flag() { return $this->_m_flag; }
}

namespace \OpenpgpMessage;

class Features extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = $this->_io->readBytesFull();
    }
    protected $_m_flags;
    public function flags() { return $this->_m_flags; }
}

namespace \OpenpgpMessage;

class PrimaryUserId extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_userId = $this->_io->readU1();
    }
    protected $_m_userId;
    public function userId() { return $this->_m_userId; }
}

namespace \OpenpgpMessage;

class Subpacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpackets $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_len = new \OpenpgpMessage\LenSubpacket($this->_io, $this, $this->_root);
        $this->_m_subpacketType = $this->_io->readU1();
        switch ($this->subpacketType()) {
            case \OpenpgpMessage\SubpacketTypes::PREFERRED_KEY_SERVER:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\PreferredKeyServer($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::ISSUER:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\Issuer($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::REVOCABLE:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\Revocable($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::SIGNATURE_TARGET:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\SignatureTarget($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::REGULAR_EXPRESSION:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\RegularExpression($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::EXPORTABLE_CERTIFICATION:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\ExportableCertification($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::REASON_FOR_REVOCATION:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\ReasonForRevocation($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::KEY_SERVER_PREFERENCES:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\KeyServerPreferences($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::SIGNATURE_CREATION_TIME:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\SignatureCreationTime($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::PREFERRED_HASH_ALGORITHMS:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\PreferredHashAlgorithms($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::TRUST_SIGNATURE:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\TrustSignature($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::KEY_EXPIRATION_TIME:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\KeyExpirationTime($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::KEY_FLAGS:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\KeyFlags($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::SIGNATURE_EXPIRATION_TIME:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\SignatureExpirationTime($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::FEATURES:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\Features($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::SIGNERS_USER_ID:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\SignersUserId($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::NOTATION_DATA:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\NotationData($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::REVOCATION_KEY:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\RevocationKey($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::PREFERRED_COMPRESSION_ALGORITHMS:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\PreferredCompressionAlgorithms($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::POLICY_URI:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\PolicyUri($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::PRIMARY_USER_ID:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\PrimaryUserId($_io__raw_content, $this, $this->_root);
                break;
            case \OpenpgpMessage\SubpacketTypes::EMBEDDED_SIGNATURE:
                $this->_m__raw_content = $this->_io->readBytes(($this->len()->len() - 1));
                $_io__raw_content = new \Kaitai\Struct\Stream($this->_m__raw_content);
                $this->_m_content = new \OpenpgpMessage\EmbeddedSignature($_io__raw_content, $this, $this->_root);
                break;
            default:
                $this->_m_content = $this->_io->readBytes(($this->len()->len() - 1));
                break;
        }
    }
    protected $_m_len;
    protected $_m_subpacketType;
    protected $_m_content;
    protected $_m__raw_content;
    public function len() { return $this->_m_len; }
    public function subpacketType() { return $this->_m_subpacketType; }
    public function content() { return $this->_m_content; }
    public function _raw_content() { return $this->_m__raw_content; }
}

namespace \OpenpgpMessage;

class OldPacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Packet $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        switch ($this->_parent()->lenType()) {
            case 0:
                $this->_m_len = $this->_io->readU1();
                break;
            case 1:
                $this->_m_len = $this->_io->readU2be();
                break;
            case 2:
                $this->_m_len = $this->_io->readU4be();
                break;
        }
        switch ($this->_parent()->packetTypeOld()) {
            case \OpenpgpMessage\PacketTags::PUBLIC_KEY_PACKET:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \OpenpgpMessage\PublicKeyPacket($_io__raw_body, $this, $this->_root);
                break;
            case \OpenpgpMessage\PacketTags::PUBLIC_SUBKEY_PACKET:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \OpenpgpMessage\PublicKeyPacket($_io__raw_body, $this, $this->_root);
                break;
            case \OpenpgpMessage\PacketTags::USER_ID_PACKET:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \OpenpgpMessage\UserIdPacket($_io__raw_body, $this, $this->_root);
                break;
            case \OpenpgpMessage\PacketTags::SIGNATURE_PACKET:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \OpenpgpMessage\SignaturePacket($_io__raw_body, $this, $this->_root);
                break;
            case \OpenpgpMessage\PacketTags::SECRET_SUBKEY_PACKET:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \OpenpgpMessage\PublicKeyPacket($_io__raw_body, $this, $this->_root);
                break;
            case \OpenpgpMessage\PacketTags::SECRET_KEY_PACKET:
                $this->_m__raw_body = $this->_io->readBytes($this->len());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \OpenpgpMessage\SecretKeyPacket($_io__raw_body, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->len());
                break;
        }
    }
    protected $_m_len;
    protected $_m_body;
    protected $_m__raw_body;
    public function len() { return $this->_m_len; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \OpenpgpMessage;

class Issuer extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_keyid = $this->_io->readU8be();
    }
    protected $_m_keyid;
    public function keyid() { return $this->_m_keyid; }
}

namespace \OpenpgpMessage;

class ExportableCertification extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_exportable = $this->_io->readU1();
    }
    protected $_m_exportable;
    public function exportable() { return $this->_m_exportable; }
}

namespace \OpenpgpMessage;

class SignatureExpirationTime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_time = $this->_io->readU4be();
    }
    protected $_m_time;
    public function time() { return $this->_m_time; }
}

namespace \OpenpgpMessage;

class SignatureCreationTime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_time = $this->_io->readU4be();
    }
    protected $_m_time;
    public function time() { return $this->_m_time; }
}

namespace \OpenpgpMessage;

class SignaturePacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU1();
        $this->_m_signatureType = $this->_io->readU1();
        $this->_m_publicKeyAlgorithm = $this->_io->readU1();
        $this->_m_hashAlgorithm = $this->_io->readU1();
        $this->_m_lenHashedSubpacket = $this->_io->readU2be();
        $this->_m__raw_hashedSubpackets = $this->_io->readBytes($this->lenHashedSubpacket());
        $_io__raw_hashedSubpackets = new \Kaitai\Struct\Stream($this->_m__raw_hashedSubpackets);
        $this->_m_hashedSubpackets = new \OpenpgpMessage\Subpackets($_io__raw_hashedSubpackets, $this, $this->_root);
        $this->_m_lenUnhashedSubpacket = $this->_io->readU2be();
        $this->_m__raw_unhashedSubpackets = $this->_io->readBytes($this->lenUnhashedSubpacket());
        $_io__raw_unhashedSubpackets = new \Kaitai\Struct\Stream($this->_m__raw_unhashedSubpackets);
        $this->_m_unhashedSubpackets = new \OpenpgpMessage\Subpackets($_io__raw_unhashedSubpackets, $this, $this->_root);
        $this->_m_leftSignedHash = $this->_io->readU2be();
        $this->_m_rsaN = $this->_io->readU2be();
        $this->_m_signature = $this->_io->readBytesFull();
    }
    protected $_m_version;
    protected $_m_signatureType;
    protected $_m_publicKeyAlgorithm;
    protected $_m_hashAlgorithm;
    protected $_m_lenHashedSubpacket;
    protected $_m_hashedSubpackets;
    protected $_m_lenUnhashedSubpacket;
    protected $_m_unhashedSubpackets;
    protected $_m_leftSignedHash;
    protected $_m_rsaN;
    protected $_m_signature;
    protected $_m__raw_hashedSubpackets;
    protected $_m__raw_unhashedSubpackets;
    public function version() { return $this->_m_version; }
    public function signatureType() { return $this->_m_signatureType; }
    public function publicKeyAlgorithm() { return $this->_m_publicKeyAlgorithm; }
    public function hashAlgorithm() { return $this->_m_hashAlgorithm; }
    public function lenHashedSubpacket() { return $this->_m_lenHashedSubpacket; }
    public function hashedSubpackets() { return $this->_m_hashedSubpackets; }
    public function lenUnhashedSubpacket() { return $this->_m_lenUnhashedSubpacket; }
    public function unhashedSubpackets() { return $this->_m_unhashedSubpackets; }
    public function leftSignedHash() { return $this->_m_leftSignedHash; }
    public function rsaN() { return $this->_m_rsaN; }
    public function signature() { return $this->_m_signature; }
    public function _raw_hashedSubpackets() { return $this->_m__raw_hashedSubpackets; }
    public function _raw_unhashedSubpackets() { return $this->_m__raw_unhashedSubpackets; }
}

namespace \OpenpgpMessage;

class Revocable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_revocable = $this->_io->readU1();
    }
    protected $_m_revocable;
    public function revocable() { return $this->_m_revocable; }
}

namespace \OpenpgpMessage;

class EmbeddedSignature extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signaturePacket = new \OpenpgpMessage\SignaturePacket($this->_io, $this, $this->_root);
    }
    protected $_m_signaturePacket;
    public function signaturePacket() { return $this->_m_signaturePacket; }
}

namespace \OpenpgpMessage;

class PreferredKeyServer extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_uri = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
    }
    protected $_m_uri;
    public function uri() { return $this->_m_uri; }
}

namespace \OpenpgpMessage;

class ReasonForRevocation extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_revocationCode = $this->_io->readU1();
        $this->_m_reason = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
    }
    protected $_m_revocationCode;
    protected $_m_reason;
    public function revocationCode() { return $this->_m_revocationCode; }
    public function reason() { return $this->_m_reason; }
}

namespace \OpenpgpMessage;

class LenSubpacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_firstOctet = $this->_io->readU1();
        if ( (($this->firstOctet() >= 192) && ($this->firstOctet() < 255)) ) {
            $this->_m_secondOctet = $this->_io->readU1();
        }
        if ($this->firstOctet() == 255) {
            $this->_m_scalar = $this->_io->readU4be();
        }
    }
    protected $_m_len;
    public function len() {
        if ($this->_m_len !== null)
            return $this->_m_len;
        $this->_m_len = ($this->firstOctet() < 192 ? $this->firstOctet() : ( (($this->firstOctet() >= 192) && ($this->firstOctet() < 255))  ? (((($this->firstOctet() - 192) << 8) + $this->secondOctet()) + 192) : $this->scalar()));
        return $this->_m_len;
    }
    protected $_m_firstOctet;
    protected $_m_secondOctet;
    protected $_m_scalar;
    public function firstOctet() { return $this->_m_firstOctet; }
    public function secondOctet() { return $this->_m_secondOctet; }
    public function scalar() { return $this->_m_scalar; }
}

namespace \OpenpgpMessage;

class NotationData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = $this->_io->readBytes(4);
        $this->_m_lenName = $this->_io->readU2be();
        $this->_m_lenValue = $this->_io->readU2be();
        $this->_m_name = $this->_io->readBytes($this->lenName());
        $this->_m_value = $this->_io->readBytes($this->lenValue());
    }
    protected $_m_flags;
    protected $_m_lenName;
    protected $_m_lenValue;
    protected $_m_name;
    protected $_m_value;
    public function flags() { return $this->_m_flags; }
    public function lenName() { return $this->_m_lenName; }
    public function lenValue() { return $this->_m_lenValue; }
    public function name() { return $this->_m_name; }
    public function value() { return $this->_m_value; }
}

namespace \OpenpgpMessage;

class PublicKeyPacket extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU1();
        $this->_m_timestamp = $this->_io->readU4be();
        $this->_m_publicKeyAlgorithm = $this->_io->readU1();
        $this->_m_lenAlg = $this->_io->readU2be();
        $this->_m_rsaN = $this->_io->readBytes(intval($this->lenAlg() / 8));
        $this->_m_padding = $this->_io->readU2be();
        $this->_m_rsaE = $this->_io->readBytes(3);
    }
    protected $_m_version;
    protected $_m_timestamp;
    protected $_m_publicKeyAlgorithm;
    protected $_m_lenAlg;
    protected $_m_rsaN;
    protected $_m_padding;
    protected $_m_rsaE;
    public function version() { return $this->_m_version; }
    public function timestamp() { return $this->_m_timestamp; }
    public function publicKeyAlgorithm() { return $this->_m_publicKeyAlgorithm; }
    public function lenAlg() { return $this->_m_lenAlg; }
    public function rsaN() { return $this->_m_rsaN; }
    public function padding() { return $this->_m_padding; }
    public function rsaE() { return $this->_m_rsaE; }
}

namespace \OpenpgpMessage;

class KeyExpirationTime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_time = $this->_io->readU4be();
    }
    protected $_m_time;
    public function time() { return $this->_m_time; }
}

namespace \OpenpgpMessage;

class Packet extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_one = $this->_io->readBitsInt(1) != 0;
        $this->_m_newPacketFormat = $this->_io->readBitsInt(1) != 0;
        if ($this->newPacketFormat()) {
            $this->_m_packetTypeNew = $this->_io->readBitsInt(6);
        }
        if (!($this->newPacketFormat())) {
            $this->_m_packetTypeOld = $this->_io->readBitsInt(4);
        }
        if (!($this->newPacketFormat())) {
            $this->_m_lenType = $this->_io->readBitsInt(2);
        }
        $this->_io->alignToByte();
        switch ($this->newPacketFormat()) {
            case false:
                $this->_m_body = new \OpenpgpMessage\OldPacket($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_one;
    protected $_m_newPacketFormat;
    protected $_m_packetTypeNew;
    protected $_m_packetTypeOld;
    protected $_m_lenType;
    protected $_m_body;
    public function one() { return $this->_m_one; }
    public function newPacketFormat() { return $this->_m_newPacketFormat; }
    public function packetTypeNew() { return $this->_m_packetTypeNew; }
    public function packetTypeOld() { return $this->_m_packetTypeOld; }
    public function lenType() { return $this->_m_lenType; }
    public function body() { return $this->_m_body; }
}

namespace \OpenpgpMessage;

class TrustSignature extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \OpenpgpMessage\Subpacket $_parent = null, \OpenpgpMessage $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_level = $this->_io->readU1();
        $this->_m_amount = $this->_io->readU1();
    }
    protected $_m_level;
    protected $_m_amount;
    public function level() { return $this->_m_level; }
    public function amount() { return $this->_m_amount; }
}

namespace \OpenpgpMessage;

class PublicKeyAlgorithms {
    const RSA_ENCRYPT_OR_SIGN_HAC = 1;
    const RSA_ENCRYPT_ONLY_HAC = 2;
    const RSA_SIGN_ONLY_HAC = 3;
    const ELGAMAL_ENCRYPT_ONLY_ELGAMAL_HAC = 16;
    const DSA_DIGITAL_SIGNATURE_ALGORITHM_FIPS_HAC = 17;
    const RESERVED_FOR_ELLIPTIC_CURVE = 18;
    const RESERVED_FOR_ECDSA = 19;
    const RESERVED_FORMERLY_ELGAMAL_ENCRYPT_OR_SIGN_ = 20;
    const RESERVED_FOR_DIFFIE_HELLMAN_X_AS_DEFINED_FOR_IETF_S_MIME = 21;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;
}

namespace \OpenpgpMessage;

class ServerFlags {
    const NO_MODIFY = 128;
}

namespace \OpenpgpMessage;

class KeyFlags {
    const THIS_KEY_MAY_BE_USED_TO_CERTIFY_OTHER_KEYS = 1;
    const THIS_KEY_MAY_BE_USED_TO_SIGN_DATA = 2;
    const THIS_KEY_MAY_BE_USED_TO_ENCRYPT_COMMUNICATIONS = 4;
    const THIS_KEY_MAY_BE_USED_TO_ENCRYPT_STORAGE = 8;
    const THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_HAVE_BEEN_SPLIT_BY_A_SECRET_SHARING_MECHANISM = 16;
    const THIS_KEY_MAY_BE_USED_FOR_AUTHENTICATION = 32;
    const THE_PRIVATE_COMPONENT_OF_THIS_KEY_MAY_BE_IN_THE_POSSESSION_OF_MORE_THAN_ONE_PERSON = 128;
}

namespace \OpenpgpMessage;

class CompressionAlgorithms {
    const UNCOMPRESSED = 0;
    const ZIB = 1;
    const ZLIB = 2;
    const BZIP = 3;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;
}

namespace \OpenpgpMessage;

class PacketTags {
    const RESERVED_A_PACKET_TAG_MUST_NOT_HAVE_THIS_VALUE = 0;
    const PUBLIC_KEY_ENCRYPTED_SESSION_KEY_PACKET = 1;
    const SIGNATURE_PACKET = 2;
    const SYMMETRIC_KEY_ENCRYPTED_SESSION_KEY_PACKET = 3;
    const ONE_PASS_SIGNATURE_PACKET = 4;
    const SECRET_KEY_PACKET = 5;
    const PUBLIC_KEY_PACKET = 6;
    const SECRET_SUBKEY_PACKET = 7;
    const COMPRESSED_DATA_PACKET = 8;
    const SYMMETRICALLY_ENCRYPTED_DATA_PACKET = 9;
    const MARKER_PACKET = 10;
    const LITERAL_DATA_PACKET = 11;
    const TRUST_PACKET = 12;
    const USER_ID_PACKET = 13;
    const PUBLIC_SUBKEY_PACKET = 14;
    const USER_ATTRIBUTE_PACKET = 17;
    const SYM_ENCRYPTED_AND_INTEGRITY_PROTECTED_DATA_PACKET = 18;
    const MODIFICATION_DETECTION_CODE_PACKET = 19;
    const PRIVATE_OR_EXPERIMENTAL_VALUES_0 = 60;
    const PRIVATE_OR_EXPERIMENTAL_VALUES_1 = 61;
    const PRIVATE_OR_EXPERIMENTAL_VALUES_2 = 62;
    const PRIVATE_OR_EXPERIMENTAL_VALUES_3 = 63;
}

namespace \OpenpgpMessage;

class RevocationCodes {
    const NO_REASON_SPECIFIED_KEY_REVOCATIONS_OR_CERT_REVOCATIONS = 0;
    const KEY_IS_SUPERSEDED_KEY_REVOCATIONS = 1;
    const KEY_MATERIAL_HAS_BEEN_COMPROMISED_KEY_REVOCATIONS = 2;
    const KEY_IS_RETIRED_AND_NO_LONGER_USED_KEY_REVOCATIONS = 3;
    const USER_ID_INFORMATION_IS_NO_LONGER_VALID_CERT_REVOCATIONS = 32;
    const PRIVATE_USE_1 = 100;
    const PRIVATE_USE_2 = 101;
    const PRIVATE_USE_3 = 102;
    const PRIVATE_USE_4 = 103;
    const PRIVATE_USE_11 = 110;
}

namespace \OpenpgpMessage;

class HashAlgorithms {
    const MD5 = 1;
    const SHA1 = 2;
    const RIPEMD160 = 3;
    const RESERVED_4 = 4;
    const RESERVED_5 = 5;
    const RESERVED_6 = 6;
    const RESERVED_7 = 7;
    const SHA256 = 8;
    const SHA384 = 9;
    const SHA512 = 10;
    const SHA224 = 11;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;
}

namespace \OpenpgpMessage;

class SymmetricKeyAlgorithm {
    const PLAIN = 0;
    const IDEA = 1;
    const TRIPLE_DES = 2;
    const CAST5 = 3;
    const BLOWFISCH = 4;
    const RESERVED_5 = 5;
    const RESERVED_6 = 6;
    const AES_128 = 7;
    const AES_192 = 8;
    const AES_256 = 9;
    const TWOFISH_256 = 10;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_00 = 100;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_01 = 101;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_02 = 102;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_03 = 103;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_04 = 104;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_05 = 105;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_06 = 106;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_07 = 107;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_08 = 108;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_09 = 109;
    const PRIVATE_EXPERIMENTAL_ALGORITHM_10 = 110;
}

namespace \OpenpgpMessage;

class SubpacketTypes {
    const RESERVED = 0;
    const RESERVED = 1;
    const SIGNATURE_CREATION_TIME = 2;
    const SIGNATURE_EXPIRATION_TIME = 3;
    const EXPORTABLE_CERTIFICATION = 4;
    const TRUST_SIGNATURE = 5;
    const REGULAR_EXPRESSION = 6;
    const REVOCABLE = 7;
    const RESERVED = 8;
    const KEY_EXPIRATION_TIME = 9;
    const PLACEHOLDER_FOR_BACKWARD_COMPATIBILITY = 10;
    const PREFERRED_SYMMETRIC_ALGORITHMS = 11;
    const REVOCATION_KEY = 12;
    const RESERVED = 13;
    const RESERVED = 14;
    const RESERVED = 15;
    const ISSUER = 16;
    const RESERVED = 17;
    const RESERVED = 18;
    const RESERVED = 19;
    const NOTATION_DATA = 20;
    const PREFERRED_HASH_ALGORITHMS = 21;
    const PREFERRED_COMPRESSION_ALGORITHMS = 22;
    const KEY_SERVER_PREFERENCES = 23;
    const PREFERRED_KEY_SERVER = 24;
    const PRIMARY_USER_ID = 25;
    const POLICY_URI = 26;
    const KEY_FLAGS = 27;
    const SIGNERS_USER_ID = 28;
    const REASON_FOR_REVOCATION = 29;
    const FEATURES = 30;
    const SIGNATURE_TARGET = 31;
    const EMBEDDED_SIGNATURE = 32;
}
