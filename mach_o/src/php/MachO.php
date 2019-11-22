<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class MachO extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->readU4be();
        $this->_m_header = new \MachO\MachHeader($this->_io, $this, $this->_root);
        $this->_m_loadCommands = [];
        $n = $this->header()->ncmds();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_loadCommands[] = new \MachO\LoadCommand($this->_io, $this, $this->_root);
        }
    }
    protected $_m_magic;
    protected $_m_header;
    protected $_m_loadCommands;
    public function magic() { return $this->_m_magic; }
    public function header() { return $this->_m_header; }
    public function loadCommands() { return $this->_m_loadCommands; }
}

namespace \MachO;

class RpathCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_pathOffset = $this->_io->readU4le();
        $this->_m_path = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "utf-8");
    }
    protected $_m_pathOffset;
    protected $_m_path;
    public function pathOffset() { return $this->_m_pathOffset; }
    public function path() { return $this->_m_path; }
}

namespace \MachO;

class Uleb128 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_b1 = $this->_io->readU1();
        if (($this->b1() & 128) != 0) {
            $this->_m_b2 = $this->_io->readU1();
        }
        if (($this->b2() & 128) != 0) {
            $this->_m_b3 = $this->_io->readU1();
        }
        if (($this->b3() & 128) != 0) {
            $this->_m_b4 = $this->_io->readU1();
        }
        if (($this->b4() & 128) != 0) {
            $this->_m_b5 = $this->_io->readU1();
        }
        if (($this->b5() & 128) != 0) {
            $this->_m_b6 = $this->_io->readU1();
        }
        if (($this->b6() & 128) != 0) {
            $this->_m_b7 = $this->_io->readU1();
        }
        if (($this->b7() & 128) != 0) {
            $this->_m_b8 = $this->_io->readU1();
        }
        if (($this->b8() & 128) != 0) {
            $this->_m_b9 = $this->_io->readU1();
        }
        if (($this->b9() & 128) != 0) {
            $this->_m_b10 = $this->_io->readU1();
        }
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = ((\Kaitai\Struct\Stream::mod($this->b1(), 128) << 0) + (($this->b1() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b2(), 128) << 7) + (($this->b2() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b3(), 128) << 14) + (($this->b3() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b4(), 128) << 21) + (($this->b4() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b5(), 128) << 28) + (($this->b5() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b6(), 128) << 35) + (($this->b6() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b7(), 128) << 42) + (($this->b7() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b8(), 128) << 49) + (($this->b8() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b9(), 128) << 56) + (($this->b8() & 128) == 0 ? 0 : (\Kaitai\Struct\Stream::mod($this->b10(), 128) << 63)))))))))))))))))));
        return $this->_m_value;
    }
    protected $_m_b1;
    protected $_m_b2;
    protected $_m_b3;
    protected $_m_b4;
    protected $_m_b5;
    protected $_m_b6;
    protected $_m_b7;
    protected $_m_b8;
    protected $_m_b9;
    protected $_m_b10;
    public function b1() { return $this->_m_b1; }
    public function b2() { return $this->_m_b2; }
    public function b3() { return $this->_m_b3; }
    public function b4() { return $this->_m_b4; }
    public function b5() { return $this->_m_b5; }
    public function b6() { return $this->_m_b6; }
    public function b7() { return $this->_m_b7; }
    public function b8() { return $this->_m_b8; }
    public function b9() { return $this->_m_b9; }
    public function b10() { return $this->_m_b10; }
}

namespace \MachO;

class SourceVersionCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU8le();
    }
    protected $_m_version;
    public function version() { return $this->_m_version; }
}

namespace \MachO;

class CsBlob extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->readU4be();
        $this->_m_length = $this->_io->readU4be();
        switch ($this->magic()) {
            case \MachO\CsBlob\CsMagic::DETACHED_SIGNATURE:
                $this->_m__raw_body = $this->_io->readBytes(($this->length() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CsBlob\SuperBlob($io, $this, $this->_root);
                break;
            case \MachO\CsBlob\CsMagic::EMBEDDED_SIGNATURE:
                $this->_m__raw_body = $this->_io->readBytes(($this->length() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CsBlob\SuperBlob($io, $this, $this->_root);
                break;
            case \MachO\CsBlob\CsMagic::ENTITLEMENT:
                $this->_m__raw_body = $this->_io->readBytes(($this->length() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CsBlob\Entitlement($io, $this, $this->_root);
                break;
            case \MachO\CsBlob\CsMagic::BLOB_WRAPPER:
                $this->_m__raw_body = $this->_io->readBytes(($this->length() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CsBlob\BlobWrapper($io, $this, $this->_root);
                break;
            case \MachO\CsBlob\CsMagic::REQUIREMENT:
                $this->_m__raw_body = $this->_io->readBytes(($this->length() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CsBlob\Requirement($io, $this, $this->_root);
                break;
            case \MachO\CsBlob\CsMagic::CODE_DIRECTORY:
                $this->_m__raw_body = $this->_io->readBytes(($this->length() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CsBlob\CodeDirectory($io, $this, $this->_root);
                break;
            case \MachO\CsBlob\CsMagic::REQUIREMENTS:
                $this->_m__raw_body = $this->_io->readBytes(($this->length() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CsBlob\Requirements($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes(($this->length() - 8));
                break;
        }
    }
    protected $_m_magic;
    protected $_m_length;
    protected $_m_body;
    protected $_m__raw_body;
    public function magic() { return $this->_m_magic; }
    public function length() { return $this->_m_length; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \MachO\CsBlob;

class Entitlement extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = $this->_io->readBytesFull();
    }
    protected $_m_data;
    public function data() { return $this->_m_data; }
}

namespace \MachO\CsBlob;

class CodeDirectory extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU4be();
        $this->_m_flags = $this->_io->readU4be();
        $this->_m_hashOffset = $this->_io->readU4be();
        $this->_m_identOffset = $this->_io->readU4be();
        $this->_m_nSpecialSlots = $this->_io->readU4be();
        $this->_m_nCodeSlots = $this->_io->readU4be();
        $this->_m_codeLimit = $this->_io->readU4be();
        $this->_m_hashSize = $this->_io->readU1();
        $this->_m_hashType = $this->_io->readU1();
        $this->_m_spare1 = $this->_io->readU1();
        $this->_m_pageSize = $this->_io->readU1();
        $this->_m_spare2 = $this->_io->readU4be();
        if ($this->version() >= 131328) {
            $this->_m_scatterOffset = $this->_io->readU4be();
        }
        if ($this->version() >= 131584) {
            $this->_m_teamIdOffset = $this->_io->readU4be();
        }
    }
    protected $_m_ident;
    public function ident() {
        if ($this->_m_ident !== null)
            return $this->_m_ident;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->identOffset() - 8));
        $this->_m_ident = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "utf-8");
        $this->_io->seek($_pos);
        return $this->_m_ident;
    }
    protected $_m_teamId;
    public function teamId() {
        if ($this->_m_teamId !== null)
            return $this->_m_teamId;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->teamIdOffset() - 8));
        $this->_m_teamId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "utf-8");
        $this->_io->seek($_pos);
        return $this->_m_teamId;
    }
    protected $_m_hashes;
    public function hashes() {
        if ($this->_m_hashes !== null)
            return $this->_m_hashes;
        $_pos = $this->_io->pos();
        $this->_io->seek((($this->hashOffset() - 8) - ($this->hashSize() * $this->nSpecialSlots())));
        $this->_m_hashes = [];
        $n = ($this->nSpecialSlots() + $this->nCodeSlots());
        for ($i = 0; $i < $n; $i++) {
            $this->_m_hashes[] = $this->_io->readBytes($this->hashSize());
        }
        $this->_io->seek($_pos);
        return $this->_m_hashes;
    }
    protected $_m_version;
    protected $_m_flags;
    protected $_m_hashOffset;
    protected $_m_identOffset;
    protected $_m_nSpecialSlots;
    protected $_m_nCodeSlots;
    protected $_m_codeLimit;
    protected $_m_hashSize;
    protected $_m_hashType;
    protected $_m_spare1;
    protected $_m_pageSize;
    protected $_m_spare2;
    protected $_m_scatterOffset;
    protected $_m_teamIdOffset;
    public function version() { return $this->_m_version; }
    public function flags() { return $this->_m_flags; }
    public function hashOffset() { return $this->_m_hashOffset; }
    public function identOffset() { return $this->_m_identOffset; }
    public function nSpecialSlots() { return $this->_m_nSpecialSlots; }
    public function nCodeSlots() { return $this->_m_nCodeSlots; }
    public function codeLimit() { return $this->_m_codeLimit; }
    public function hashSize() { return $this->_m_hashSize; }
    public function hashType() { return $this->_m_hashType; }
    public function spare1() { return $this->_m_spare1; }
    public function pageSize() { return $this->_m_pageSize; }
    public function spare2() { return $this->_m_spare2; }
    public function scatterOffset() { return $this->_m_scatterOffset; }
    public function teamIdOffset() { return $this->_m_teamIdOffset; }
}

namespace \MachO\CsBlob;

class Data extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU4be();
        $this->_m_value = $this->_io->readBytes($this->length());
        $this->_m_padding = $this->_io->readBytes((4 - ($this->length() & 3)));
    }
    protected $_m_length;
    protected $_m_value;
    protected $_m_padding;
    public function length() { return $this->_m_length; }
    public function value() { return $this->_m_value; }
    public function padding() { return $this->_m_padding; }
}

namespace \MachO\CsBlob;

class SuperBlob extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_count = $this->_io->readU4be();
        $this->_m_blobs = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_blobs[] = new \MachO\CsBlob\BlobIndex($this->_io, $this, $this->_root);
        }
    }
    protected $_m_count;
    protected $_m_blobs;
    public function count() { return $this->_m_count; }
    public function blobs() { return $this->_m_blobs; }
}

namespace \MachO\CsBlob;

class Expr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_op = $this->_io->readU4be();
        switch ($this->op()) {
            case \MachO\CsBlob\Expr\OpEnum::CERT_GENERIC:
                $this->_m_data = new \MachO\CsBlob\Expr\CertGenericExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::APPLE_GENERIC_ANCHOR:
                $this->_m_data = new \MachO\CsBlob\Expr\AppleGenericAnchorExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::INFO_KEY_FIELD:
                $this->_m_data = new \MachO\CsBlob\Expr\InfoKeyFieldExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::AND_OP:
                $this->_m_data = new \MachO\CsBlob\Expr\AndExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::ANCHOR_HASH:
                $this->_m_data = new \MachO\CsBlob\Expr\AnchorHashExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::INFO_KEY_VALUE:
                $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::OR_OP:
                $this->_m_data = new \MachO\CsBlob\Expr\OrExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::TRUSTED_CERT:
                $this->_m_data = new \MachO\CsBlob\Expr\CertSlotExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::NOT_OP:
                $this->_m_data = new \MachO\CsBlob\Expr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::IDENT:
                $this->_m_data = new \MachO\CsBlob\Expr\IdentExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::CERT_FIELD:
                $this->_m_data = new \MachO\CsBlob\Expr\CertFieldExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::ENTITLEMENT_FIELD:
                $this->_m_data = new \MachO\CsBlob\Expr\EntitlementFieldExpr($this->_io, $this, $this->_root);
                break;
            case \MachO\CsBlob\Expr\OpEnum::CD_HASH:
                $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_op;
    protected $_m_data;
    public function op() { return $this->_m_op; }
    public function data() { return $this->_m_data; }
}

namespace \MachO\CsBlob\Expr;

class InfoKeyFieldExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
        $this->_m_match = new \MachO\CsBlob\Match($this->_io, $this, $this->_root);
    }
    protected $_m_data;
    protected $_m_match;
    public function data() { return $this->_m_data; }
    public function match() { return $this->_m_match; }
}

namespace \MachO\CsBlob\Expr;

class CertSlotExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_value = $this->_io->readU4be();
    }
    protected $_m_value;
    public function value() { return $this->_m_value; }
}

namespace \MachO\CsBlob\Expr;

class CertGenericExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_certSlot = $this->_io->readU4be();
        $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
        $this->_m_match = new \MachO\CsBlob\Match($this->_io, $this, $this->_root);
    }
    protected $_m_certSlot;
    protected $_m_data;
    protected $_m_match;
    public function certSlot() { return $this->_m_certSlot; }
    public function data() { return $this->_m_data; }
    public function match() { return $this->_m_match; }
}

namespace \MachO\CsBlob\Expr;

class IdentExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_identifier = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
    }
    protected $_m_identifier;
    public function identifier() { return $this->_m_identifier; }
}

namespace \MachO\CsBlob\Expr;

class CertFieldExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_certSlot = $this->_io->readU4be();
        $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
        $this->_m_match = new \MachO\CsBlob\Match($this->_io, $this, $this->_root);
    }
    protected $_m_certSlot;
    protected $_m_data;
    protected $_m_match;
    public function certSlot() { return $this->_m_certSlot; }
    public function data() { return $this->_m_data; }
    public function match() { return $this->_m_match; }
}

namespace \MachO\CsBlob\Expr;

class AnchorHashExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_certSlot = $this->_io->readU4be();
        $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
    }
    protected $_m_certSlot;
    protected $_m_data;
    public function certSlot() { return $this->_m_certSlot; }
    public function data() { return $this->_m_data; }
}

namespace \MachO\CsBlob\Expr;

class AppleGenericAnchorExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = "anchor apple generic";
        return $this->_m_value;
    }
}

namespace \MachO\CsBlob\Expr;

class EntitlementFieldExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
        $this->_m_match = new \MachO\CsBlob\Match($this->_io, $this, $this->_root);
    }
    protected $_m_data;
    protected $_m_match;
    public function data() { return $this->_m_data; }
    public function match() { return $this->_m_match; }
}

namespace \MachO\CsBlob\Expr;

class AndExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_left = new \MachO\CsBlob\Expr($this->_io, $this, $this->_root);
        $this->_m_right = new \MachO\CsBlob\Expr($this->_io, $this, $this->_root);
    }
    protected $_m_left;
    protected $_m_right;
    public function left() { return $this->_m_left; }
    public function right() { return $this->_m_right; }
}

namespace \MachO\CsBlob\Expr;

class OrExpr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Expr $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_left = new \MachO\CsBlob\Expr($this->_io, $this, $this->_root);
        $this->_m_right = new \MachO\CsBlob\Expr($this->_io, $this, $this->_root);
    }
    protected $_m_left;
    protected $_m_right;
    public function left() { return $this->_m_left; }
    public function right() { return $this->_m_right; }
}

namespace \MachO\CsBlob\Expr;

class OpEnum {
    const FALSE = 0;
    const TRUE = 1;
    const IDENT = 2;
    const APPLE_ANCHOR = 3;
    const ANCHOR_HASH = 4;
    const INFO_KEY_VALUE = 5;
    const AND_OP = 6;
    const OR_OP = 7;
    const CD_HASH = 8;
    const NOT_OP = 9;
    const INFO_KEY_FIELD = 10;
    const CERT_FIELD = 11;
    const TRUSTED_CERT = 12;
    const TRUSTED_CERTS = 13;
    const CERT_GENERIC = 14;
    const APPLE_GENERIC_ANCHOR = 15;
    const ENTITLEMENT_FIELD = 16;
}

namespace \MachO\CsBlob\Expr;

class CertSlot {
    const LEFT_CERT = 0;
    const ANCHOR_CERT = 4294967295;
}

namespace \MachO\CsBlob;

class BlobIndex extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\SuperBlob $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU4be();
        $this->_m_offset = $this->_io->readU4be();
    }
    protected $_m_blob;
    public function blob() {
        if ($this->_m_blob !== null)
            return $this->_m_blob;
        $io = $this->_parent()->_io();
        $_pos = $io->pos();
        $io->seek(($this->offset() - 8));
        $this->_m__raw_blob = $io->readBytesFull();
        $io = new \Kaitai\Struct\Stream($this->_m__raw_blob);
        $this->_m_blob = new \MachO\CsBlob($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_blob;
    }
    protected $_m_type;
    protected $_m_offset;
    protected $_m__raw_blob;
    public function type() { return $this->_m_type; }
    public function offset() { return $this->_m_offset; }
    public function _raw_blob() { return $this->_m__raw_blob; }
}

namespace \MachO\CsBlob\BlobIndex;

class CsslotType {
    const CODE_DIRECTORY = 0;
    const INFO_SLOT = 1;
    const REQUIREMENTS = 2;
    const RESOURCE_DIR = 3;
    const APPLICATION = 4;
    const ENTITLEMENTS = 5;
    const ALTERNATE_CODE_DIRECTORIES = 4096;
    const SIGNATURE_SLOT = 65536;
}

namespace \MachO\CsBlob;

class Match extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_matchOp = $this->_io->readU4be();
        if ($this->matchOp() != \MachO\CsBlob\Match\Op::EXISTS) {
            $this->_m_data = new \MachO\CsBlob\Data($this->_io, $this, $this->_root);
        }
    }
    protected $_m_matchOp;
    protected $_m_data;
    public function matchOp() { return $this->_m_matchOp; }
    public function data() { return $this->_m_data; }
}

namespace \MachO\CsBlob\Match;

class Op {
    const EXISTS = 0;
    const EQUAL = 1;
    const CONTAINS = 2;
    const BEGINS_WITH = 3;
    const ENDS_WITH = 4;
    const LESS_THAN = 5;
    const GREATER_THAN = 6;
    const LESS_EQUAL = 7;
    const GREATER_EQUAL = 8;
}

namespace \MachO\CsBlob;

class Requirement extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_kind = $this->_io->readU4be();
        $this->_m_expr = new \MachO\CsBlob\Expr($this->_io, $this, $this->_root);
    }
    protected $_m_kind;
    protected $_m_expr;
    public function kind() { return $this->_m_kind; }
    public function expr() { return $this->_m_expr; }
}

namespace \MachO\CsBlob;

class Requirements extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_count = $this->_io->readU4be();
        $this->_m_items = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_items[] = new \MachO\CsBlob\RequirementsBlobIndex($this->_io, $this, $this->_root);
        }
    }
    protected $_m_count;
    protected $_m_items;
    public function count() { return $this->_m_count; }
    public function items() { return $this->_m_items; }
}

namespace \MachO\CsBlob;

class BlobWrapper extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = $this->_io->readBytesFull();
    }
    protected $_m_data;
    public function data() { return $this->_m_data; }
}

namespace \MachO\CsBlob;

class RequirementsBlobIndex extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\CsBlob\Requirements $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU4be();
        $this->_m_offset = $this->_io->readU4be();
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->offset() - 8));
        $this->_m_value = new \MachO\CsBlob($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_value;
    }
    protected $_m_type;
    protected $_m_offset;
    public function type() { return $this->_m_type; }
    public function offset() { return $this->_m_offset; }
}

namespace \MachO\CsBlob\RequirementsBlobIndex;

class RequirementType {
    const HOST = 1;
    const GUEST = 2;
    const DESIGNATED = 3;
    const LIBRARY = 4;
}

namespace \MachO\CsBlob;

class CsMagic {
    const BLOB_WRAPPER = 4208855809;
    const REQUIREMENT = 4208856064;
    const REQUIREMENTS = 4208856065;
    const CODE_DIRECTORY = 4208856066;
    const EMBEDDED_SIGNATURE = 4208856256;
    const DETACHED_SIGNATURE = 4208856257;
    const ENTITLEMENT = 4208882033;
}

namespace \MachO;

class RoutinesCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_initAddress = $this->_io->readU4le();
        $this->_m_initModule = $this->_io->readU4le();
        $this->_m_reserved = $this->_io->readBytes(24);
    }
    protected $_m_initAddress;
    protected $_m_initModule;
    protected $_m_reserved;
    public function initAddress() { return $this->_m_initAddress; }
    public function initModule() { return $this->_m_initModule; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \MachO;

class MachoFlags extends \Kaitai\Struct\Struct {
    public function __construct(int $value, \Kaitai\Struct\Stream $_io, \MachO\MachHeader $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_value = $value;
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_subsectionsViaSymbols;

    /**
     * safe to divide up the sections into sub-sections via symbols for dead code stripping
     */
    public function subsectionsViaSymbols() {
        if ($this->_m_subsectionsViaSymbols !== null)
            return $this->_m_subsectionsViaSymbols;
        $this->_m_subsectionsViaSymbols = ($this->value() & 8192) != 0;
        return $this->_m_subsectionsViaSymbols;
    }
    protected $_m_deadStrippableDylib;
    public function deadStrippableDylib() {
        if ($this->_m_deadStrippableDylib !== null)
            return $this->_m_deadStrippableDylib;
        $this->_m_deadStrippableDylib = ($this->value() & 4194304) != 0;
        return $this->_m_deadStrippableDylib;
    }
    protected $_m_weakDefines;

    /**
     * the final linked image contains external weak symbols
     */
    public function weakDefines() {
        if ($this->_m_weakDefines !== null)
            return $this->_m_weakDefines;
        $this->_m_weakDefines = ($this->value() & 32768) != 0;
        return $this->_m_weakDefines;
    }
    protected $_m_prebound;

    /**
     * the file has its dynamic undefined references prebound.
     */
    public function prebound() {
        if ($this->_m_prebound !== null)
            return $this->_m_prebound;
        $this->_m_prebound = ($this->value() & 16) != 0;
        return $this->_m_prebound;
    }
    protected $_m_allModsBound;

    /**
     * indicates that this binary binds to all two-level namespace modules of its dependent libraries. only used when MH_PREBINDABLE and MH_TWOLEVEL are both set.
     */
    public function allModsBound() {
        if ($this->_m_allModsBound !== null)
            return $this->_m_allModsBound;
        $this->_m_allModsBound = ($this->value() & 4096) != 0;
        return $this->_m_allModsBound;
    }
    protected $_m_hasTlvDescriptors;
    public function hasTlvDescriptors() {
        if ($this->_m_hasTlvDescriptors !== null)
            return $this->_m_hasTlvDescriptors;
        $this->_m_hasTlvDescriptors = ($this->value() & 8388608) != 0;
        return $this->_m_hasTlvDescriptors;
    }
    protected $_m_forceFlat;

    /**
     * the executable is forcing all images to use flat name space bindings
     */
    public function forceFlat() {
        if ($this->_m_forceFlat !== null)
            return $this->_m_forceFlat;
        $this->_m_forceFlat = ($this->value() & 256) != 0;
        return $this->_m_forceFlat;
    }
    protected $_m_rootSafe;

    /**
     * When this bit is set, the binary declares it is safe for use in processes with uid zero
     */
    public function rootSafe() {
        if ($this->_m_rootSafe !== null)
            return $this->_m_rootSafe;
        $this->_m_rootSafe = ($this->value() & 262144) != 0;
        return $this->_m_rootSafe;
    }
    protected $_m_noUndefs;

    /**
     * the object file has no undefined references
     */
    public function noUndefs() {
        if ($this->_m_noUndefs !== null)
            return $this->_m_noUndefs;
        $this->_m_noUndefs = ($this->value() & 1) != 0;
        return $this->_m_noUndefs;
    }
    protected $_m_setuidSafe;

    /**
     * When this bit is set, the binary declares it is safe for use in processes when issetugid() is true
     */
    public function setuidSafe() {
        if ($this->_m_setuidSafe !== null)
            return $this->_m_setuidSafe;
        $this->_m_setuidSafe = ($this->value() & 524288) != 0;
        return $this->_m_setuidSafe;
    }
    protected $_m_noHeapExecution;
    public function noHeapExecution() {
        if ($this->_m_noHeapExecution !== null)
            return $this->_m_noHeapExecution;
        $this->_m_noHeapExecution = ($this->value() & 16777216) != 0;
        return $this->_m_noHeapExecution;
    }
    protected $_m_noReexportedDylibs;

    /**
     * When this bit is set on a dylib, the static linker does not need to examine dependent dylibs to see if any are re-exported
     */
    public function noReexportedDylibs() {
        if ($this->_m_noReexportedDylibs !== null)
            return $this->_m_noReexportedDylibs;
        $this->_m_noReexportedDylibs = ($this->value() & 1048576) != 0;
        return $this->_m_noReexportedDylibs;
    }
    protected $_m_noMultiDefs;

    /**
     * this umbrella guarantees no multiple defintions of symbols in its sub-images so the two-level namespace hints can always be used.
     */
    public function noMultiDefs() {
        if ($this->_m_noMultiDefs !== null)
            return $this->_m_noMultiDefs;
        $this->_m_noMultiDefs = ($this->value() & 512) != 0;
        return $this->_m_noMultiDefs;
    }
    protected $_m_appExtensionSafe;
    public function appExtensionSafe() {
        if ($this->_m_appExtensionSafe !== null)
            return $this->_m_appExtensionSafe;
        $this->_m_appExtensionSafe = ($this->value() & 33554432) != 0;
        return $this->_m_appExtensionSafe;
    }
    protected $_m_prebindable;

    /**
     * the binary is not prebound but can have its prebinding redone. only used when MH_PREBOUND is not set.
     */
    public function prebindable() {
        if ($this->_m_prebindable !== null)
            return $this->_m_prebindable;
        $this->_m_prebindable = ($this->value() & 2048) != 0;
        return $this->_m_prebindable;
    }
    protected $_m_incrLink;

    /**
     * the object file is the output of an incremental link against a base file and can't be link edited again
     */
    public function incrLink() {
        if ($this->_m_incrLink !== null)
            return $this->_m_incrLink;
        $this->_m_incrLink = ($this->value() & 2) != 0;
        return $this->_m_incrLink;
    }
    protected $_m_bindAtLoad;

    /**
     * the object file's undefined references are bound by the dynamic linker when loaded.
     */
    public function bindAtLoad() {
        if ($this->_m_bindAtLoad !== null)
            return $this->_m_bindAtLoad;
        $this->_m_bindAtLoad = ($this->value() & 8) != 0;
        return $this->_m_bindAtLoad;
    }
    protected $_m_canonical;

    /**
     * the binary has been canonicalized via the unprebind operation
     */
    public function canonical() {
        if ($this->_m_canonical !== null)
            return $this->_m_canonical;
        $this->_m_canonical = ($this->value() & 16384) != 0;
        return $this->_m_canonical;
    }
    protected $_m_twoLevel;

    /**
     * the image is using two-level name space bindings
     */
    public function twoLevel() {
        if ($this->_m_twoLevel !== null)
            return $this->_m_twoLevel;
        $this->_m_twoLevel = ($this->value() & 128) != 0;
        return $this->_m_twoLevel;
    }
    protected $_m_splitSegs;

    /**
     * the file has its read-only and read-write segments split
     */
    public function splitSegs() {
        if ($this->_m_splitSegs !== null)
            return $this->_m_splitSegs;
        $this->_m_splitSegs = ($this->value() & 32) != 0;
        return $this->_m_splitSegs;
    }
    protected $_m_lazyInit;

    /**
     * the shared library init routine is to be run lazily via catching memory faults to its writeable segments (obsolete)
     */
    public function lazyInit() {
        if ($this->_m_lazyInit !== null)
            return $this->_m_lazyInit;
        $this->_m_lazyInit = ($this->value() & 64) != 0;
        return $this->_m_lazyInit;
    }
    protected $_m_allowStackExecution;

    /**
     * When this bit is set, all stacks in the task will be given stack execution privilege.  Only used in MH_EXECUTE filetypes.
     */
    public function allowStackExecution() {
        if ($this->_m_allowStackExecution !== null)
            return $this->_m_allowStackExecution;
        $this->_m_allowStackExecution = ($this->value() & 131072) != 0;
        return $this->_m_allowStackExecution;
    }
    protected $_m_bindsToWeak;

    /**
     * the final linked image uses weak symbols
     */
    public function bindsToWeak() {
        if ($this->_m_bindsToWeak !== null)
            return $this->_m_bindsToWeak;
        $this->_m_bindsToWeak = ($this->value() & 65536) != 0;
        return $this->_m_bindsToWeak;
    }
    protected $_m_noFixPrebinding;

    /**
     * do not have dyld notify the prebinding agent about this executable
     */
    public function noFixPrebinding() {
        if ($this->_m_noFixPrebinding !== null)
            return $this->_m_noFixPrebinding;
        $this->_m_noFixPrebinding = ($this->value() & 1024) != 0;
        return $this->_m_noFixPrebinding;
    }
    protected $_m_dyldLink;

    /**
     * the object file is input for the dynamic linker and can't be staticly link edited again
     */
    public function dyldLink() {
        if ($this->_m_dyldLink !== null)
            return $this->_m_dyldLink;
        $this->_m_dyldLink = ($this->value() & 4) != 0;
        return $this->_m_dyldLink;
    }
    protected $_m_pie;

    /**
     * When this bit is set, the OS will load the main executable at a random address. Only used in MH_EXECUTE filetypes.
     */
    public function pie() {
        if ($this->_m_pie !== null)
            return $this->_m_pie;
        $this->_m_pie = ($this->value() & 2097152) != 0;
        return $this->_m_pie;
    }
    protected $_m_value;
    public function value() { return $this->_m_value; }
}

namespace \MachO;

class RoutinesCommand64 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_initAddress = $this->_io->readU8le();
        $this->_m_initModule = $this->_io->readU8le();
        $this->_m_reserved = $this->_io->readBytes(48);
    }
    protected $_m_initAddress;
    protected $_m_initModule;
    protected $_m_reserved;
    public function initAddress() { return $this->_m_initAddress; }
    public function initModule() { return $this->_m_initModule; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \MachO;

class LinkerOptionCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numStrings = $this->_io->readU4le();
        $this->_m_strings = [];
        $n = $this->numStrings();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_strings[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "utf-8");
        }
    }
    protected $_m_numStrings;
    protected $_m_strings;
    public function numStrings() { return $this->_m_numStrings; }
    public function strings() { return $this->_m_strings; }
}

namespace \MachO;

class SegmentCommand64 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_segname = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(16), 0), "ascii");
        $this->_m_vmaddr = $this->_io->readU8le();
        $this->_m_vmsize = $this->_io->readU8le();
        $this->_m_fileoff = $this->_io->readU8le();
        $this->_m_filesize = $this->_io->readU8le();
        $this->_m_maxprot = new \MachO\VmProt($this->_io, $this, $this->_root);
        $this->_m_initprot = new \MachO\VmProt($this->_io, $this, $this->_root);
        $this->_m_nsects = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU4le();
        $this->_m_sections = [];
        $n = $this->nsects();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_sections[] = new \MachO\SegmentCommand64\Section64($this->_io, $this, $this->_root);
        }
    }
    protected $_m_segname;
    protected $_m_vmaddr;
    protected $_m_vmsize;
    protected $_m_fileoff;
    protected $_m_filesize;
    protected $_m_maxprot;
    protected $_m_initprot;
    protected $_m_nsects;
    protected $_m_flags;
    protected $_m_sections;
    public function segname() { return $this->_m_segname; }
    public function vmaddr() { return $this->_m_vmaddr; }
    public function vmsize() { return $this->_m_vmsize; }
    public function fileoff() { return $this->_m_fileoff; }
    public function filesize() { return $this->_m_filesize; }
    public function maxprot() { return $this->_m_maxprot; }
    public function initprot() { return $this->_m_initprot; }
    public function nsects() { return $this->_m_nsects; }
    public function flags() { return $this->_m_flags; }
    public function sections() { return $this->_m_sections; }
}

namespace \MachO\SegmentCommand64;

class Section64 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64 $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sectName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(16), 0), "ascii");
        $this->_m_segName = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesStripRight($this->_io->readBytes(16), 0), "ascii");
        $this->_m_addr = $this->_io->readU8le();
        $this->_m_size = $this->_io->readU8le();
        $this->_m_offset = $this->_io->readU4le();
        $this->_m_align = $this->_io->readU4le();
        $this->_m_reloff = $this->_io->readU4le();
        $this->_m_nreloc = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU4le();
        $this->_m_reserved1 = $this->_io->readU4le();
        $this->_m_reserved2 = $this->_io->readU4le();
        $this->_m_reserved3 = $this->_io->readU4le();
    }
    protected $_m_data;
    public function data() {
        if ($this->_m_data !== null)
            return $this->_m_data;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->offset());
        switch ($this->sectName()) {
            case "__objc_nlclslist":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__objc_methname":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\StringList($io, $this, $this->_root);
                break;
            case "__nl_symbol_ptr":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__la_symbol_ptr":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__objc_selrefs":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__cstring":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\StringList($io, $this, $this->_root);
                break;
            case "__objc_classlist":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__objc_protolist":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__objc_imageinfo":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__objc_methtype":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\StringList($io, $this, $this->_root);
                break;
            case "__cfstring":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\CfStringList($io, $this, $this->_root);
                break;
            case "__objc_classrefs":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__objc_protorefs":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__objc_classname":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\StringList($io, $this, $this->_root);
                break;
            case "__got":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            case "__eh_frame":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\EhFrame($io, $this, $this->_root);
                break;
            case "__objc_superrefs":
                $this->_m__raw_data = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \MachO\SegmentCommand64\Section64\PointerList($io, $this, $this->_root);
                break;
            default:
                $this->_m_data = $io->readBytes($this->size());
                break;
        }
        $io->seek($_pos);
        return $this->_m_data;
    }
    protected $_m_sectName;
    protected $_m_segName;
    protected $_m_addr;
    protected $_m_size;
    protected $_m_offset;
    protected $_m_align;
    protected $_m_reloff;
    protected $_m_nreloc;
    protected $_m_flags;
    protected $_m_reserved1;
    protected $_m_reserved2;
    protected $_m_reserved3;
    protected $_m__raw_data;
    public function sectName() { return $this->_m_sectName; }
    public function segName() { return $this->_m_segName; }
    public function addr() { return $this->_m_addr; }
    public function size() { return $this->_m_size; }
    public function offset() { return $this->_m_offset; }
    public function align() { return $this->_m_align; }
    public function reloff() { return $this->_m_reloff; }
    public function nreloc() { return $this->_m_nreloc; }
    public function flags() { return $this->_m_flags; }
    public function reserved1() { return $this->_m_reserved1; }
    public function reserved2() { return $this->_m_reserved2; }
    public function reserved3() { return $this->_m_reserved3; }
    public function _raw_data() { return $this->_m__raw_data; }
}

namespace \MachO\SegmentCommand64\Section64;

class CfStringList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64 $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_items[] = new \MachO\SegmentCommand64\Section64\CfString($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \MachO\SegmentCommand64\Section64;

class CfString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64\CfStringList $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_isa = $this->_io->readU8le();
        $this->_m_info = $this->_io->readU8le();
        $this->_m_data = $this->_io->readU8le();
        $this->_m_length = $this->_io->readU8le();
    }
    protected $_m_isa;
    protected $_m_info;
    protected $_m_data;
    protected $_m_length;
    public function isa() { return $this->_m_isa; }
    public function info() { return $this->_m_info; }
    public function data() { return $this->_m_data; }
    public function length() { return $this->_m_length; }
}

namespace \MachO\SegmentCommand64\Section64;

class EhFrameItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64\EhFrame $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU4le();
        if ($this->length() == 4294967295) {
            $this->_m_length64 = $this->_io->readU8le();
        }
        $this->_m_id = $this->_io->readU4le();
        if ($this->length() > 0) {
            switch ($this->id()) {
                case 0:
                    $this->_m__raw_body = $this->_io->readBytes(($this->length() - 4));
                    $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \MachO\SegmentCommand64\Section64\EhFrameItem\Cie($io, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes(($this->length() - 4));
                    break;
            }
        }
    }
    protected $_m_length;
    protected $_m_length64;
    protected $_m_id;
    protected $_m_body;
    protected $_m__raw_body;
    public function length() { return $this->_m_length; }
    public function length64() { return $this->_m_length64; }
    public function id() { return $this->_m_id; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \MachO\SegmentCommand64\Section64\EhFrameItem;

class CharChain extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_chr = $this->_io->readU1();
        if ($this->chr() != 0) {
            $this->_m_next = new \MachO\SegmentCommand64\Section64\EhFrameItem\CharChain($this->_io, $this, $this->_root);
        }
    }
    protected $_m_chr;
    protected $_m_next;
    public function chr() { return $this->_m_chr; }
    public function next() { return $this->_m_next; }
}

namespace \MachO\SegmentCommand64\Section64\EhFrameItem;

class Cie extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64\EhFrameItem $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU1();
        $this->_m_augStr = new \MachO\SegmentCommand64\Section64\EhFrameItem\CharChain($this->_io, $this, $this->_root);
        $this->_m_codeAlignmentFactor = new \MachO\Uleb128($this->_io, $this, $this->_root);
        $this->_m_dataAlignmentFactor = new \MachO\Uleb128($this->_io, $this, $this->_root);
        $this->_m_returnAddressRegister = $this->_io->readU1();
        if ($this->augStr()->chr() == 122) {
            $this->_m_augmentation = new \MachO\SegmentCommand64\Section64\EhFrameItem\AugmentationEntry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_version;
    protected $_m_augStr;
    protected $_m_codeAlignmentFactor;
    protected $_m_dataAlignmentFactor;
    protected $_m_returnAddressRegister;
    protected $_m_augmentation;
    public function version() { return $this->_m_version; }
    public function augStr() { return $this->_m_augStr; }
    public function codeAlignmentFactor() { return $this->_m_codeAlignmentFactor; }
    public function dataAlignmentFactor() { return $this->_m_dataAlignmentFactor; }
    public function returnAddressRegister() { return $this->_m_returnAddressRegister; }
    public function augmentation() { return $this->_m_augmentation; }
}

namespace \MachO\SegmentCommand64\Section64\EhFrameItem;

class AugmentationEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64\EhFrameItem\Cie $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = new \MachO\Uleb128($this->_io, $this, $this->_root);
        if ($this->_parent()->augStr()->next()->chr() == 82) {
            $this->_m_fdePointerEncoding = $this->_io->readU1();
        }
    }
    protected $_m_length;
    protected $_m_fdePointerEncoding;
    public function length() { return $this->_m_length; }
    public function fdePointerEncoding() { return $this->_m_fdePointerEncoding; }
}

namespace \MachO\SegmentCommand64\Section64;

class EhFrame extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64 $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_items[] = new \MachO\SegmentCommand64\Section64\EhFrameItem($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \MachO\SegmentCommand64\Section64;

class PointerList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64 $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_items[] = $this->_io->readU8le();
            $i++;
        }
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \MachO\SegmentCommand64\Section64;

class StringList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64\Section64 $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_strings = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_strings[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ascii");
            $i++;
        }
    }
    protected $_m_strings;
    public function strings() { return $this->_m_strings; }
}

namespace \MachO;

class VmProt extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SegmentCommand64 $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_stripRead = $this->_io->readBitsInt(1) != 0;
        $this->_m_isMask = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved0 = $this->_io->readBitsInt(1) != 0;
        $this->_m_copy = $this->_io->readBitsInt(1) != 0;
        $this->_m_noChange = $this->_io->readBitsInt(1) != 0;
        $this->_m_execute = $this->_io->readBitsInt(1) != 0;
        $this->_m_write = $this->_io->readBitsInt(1) != 0;
        $this->_m_read = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved1 = $this->_io->readBitsInt(24);
    }
    protected $_m_stripRead;
    protected $_m_isMask;
    protected $_m_reserved0;
    protected $_m_copy;
    protected $_m_noChange;
    protected $_m_execute;
    protected $_m_write;
    protected $_m_read;
    protected $_m_reserved1;

    /**
     * Special marker to support execute-only protection.
     */
    public function stripRead() { return $this->_m_stripRead; }

    /**
     * Indicates to use value as a mask against the actual protection bits.
     */
    public function isMask() { return $this->_m_isMask; }

    /**
     * Reserved (unused) bit.
     */
    public function reserved0() { return $this->_m_reserved0; }

    /**
     * Used when write permission can not be obtained, to mark the entry as COW.
     */
    public function copy() { return $this->_m_copy; }

    /**
     * Used only by memory_object_lock_request to indicate no change to page locks.
     */
    public function noChange() { return $this->_m_noChange; }

    /**
     * Execute permission.
     */
    public function execute() { return $this->_m_execute; }

    /**
     * Write permission.
     */
    public function write() { return $this->_m_write; }

    /**
     * Read permission.
     */
    public function read() { return $this->_m_read; }

    /**
     * Reserved (unused) bits.
     */
    public function reserved1() { return $this->_m_reserved1; }
}

namespace \MachO;

class DysymtabCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_iLocalSym = $this->_io->readU4le();
        $this->_m_nLocalSym = $this->_io->readU4le();
        $this->_m_iExtDefSym = $this->_io->readU4le();
        $this->_m_nExtDefSym = $this->_io->readU4le();
        $this->_m_iUndefSym = $this->_io->readU4le();
        $this->_m_nUndefSym = $this->_io->readU4le();
        $this->_m_tocOff = $this->_io->readU4le();
        $this->_m_nToc = $this->_io->readU4le();
        $this->_m_modTabOff = $this->_io->readU4le();
        $this->_m_nModTab = $this->_io->readU4le();
        $this->_m_extRefSymOff = $this->_io->readU4le();
        $this->_m_nExtRefSyms = $this->_io->readU4le();
        $this->_m_indirectSymOff = $this->_io->readU4le();
        $this->_m_nIndirectSyms = $this->_io->readU4le();
        $this->_m_extRelOff = $this->_io->readU4le();
        $this->_m_nExtRel = $this->_io->readU4le();
        $this->_m_locRelOff = $this->_io->readU4le();
        $this->_m_nLocRel = $this->_io->readU4le();
    }
    protected $_m_indirectSymbols;
    public function indirectSymbols() {
        if ($this->_m_indirectSymbols !== null)
            return $this->_m_indirectSymbols;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->indirectSymOff());
        $this->_m_indirectSymbols = [];
        $n = $this->nIndirectSyms();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_indirectSymbols[] = $io->readU4le();
        }
        $io->seek($_pos);
        return $this->_m_indirectSymbols;
    }
    protected $_m_iLocalSym;
    protected $_m_nLocalSym;
    protected $_m_iExtDefSym;
    protected $_m_nExtDefSym;
    protected $_m_iUndefSym;
    protected $_m_nUndefSym;
    protected $_m_tocOff;
    protected $_m_nToc;
    protected $_m_modTabOff;
    protected $_m_nModTab;
    protected $_m_extRefSymOff;
    protected $_m_nExtRefSyms;
    protected $_m_indirectSymOff;
    protected $_m_nIndirectSyms;
    protected $_m_extRelOff;
    protected $_m_nExtRel;
    protected $_m_locRelOff;
    protected $_m_nLocRel;
    public function iLocalSym() { return $this->_m_iLocalSym; }
    public function nLocalSym() { return $this->_m_nLocalSym; }
    public function iExtDefSym() { return $this->_m_iExtDefSym; }
    public function nExtDefSym() { return $this->_m_nExtDefSym; }
    public function iUndefSym() { return $this->_m_iUndefSym; }
    public function nUndefSym() { return $this->_m_nUndefSym; }
    public function tocOff() { return $this->_m_tocOff; }
    public function nToc() { return $this->_m_nToc; }
    public function modTabOff() { return $this->_m_modTabOff; }
    public function nModTab() { return $this->_m_nModTab; }
    public function extRefSymOff() { return $this->_m_extRefSymOff; }
    public function nExtRefSyms() { return $this->_m_nExtRefSyms; }
    public function indirectSymOff() { return $this->_m_indirectSymOff; }
    public function nIndirectSyms() { return $this->_m_nIndirectSyms; }
    public function extRelOff() { return $this->_m_extRelOff; }
    public function nExtRel() { return $this->_m_nExtRel; }
    public function locRelOff() { return $this->_m_locRelOff; }
    public function nLocRel() { return $this->_m_nLocRel; }
}

namespace \MachO;

class MachHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_cputype = $this->_io->readU4le();
        $this->_m_cpusubtype = $this->_io->readU4le();
        $this->_m_filetype = $this->_io->readU4le();
        $this->_m_ncmds = $this->_io->readU4le();
        $this->_m_sizeofcmds = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU4le();
        if ( (($this->_root()->magic() == \MachO\MagicType::MACHO_BE_X64) || ($this->_root()->magic() == \MachO\MagicType::MACHO_LE_X64)) ) {
            $this->_m_reserved = $this->_io->readU4le();
        }
    }
    protected $_m_flagsObj;
    public function flagsObj() {
        if ($this->_m_flagsObj !== null)
            return $this->_m_flagsObj;
        $this->_m_flagsObj = new \MachO\MachoFlags($this->flags(), $this->_io, $this, $this->_root);
        return $this->_m_flagsObj;
    }
    protected $_m_cputype;
    protected $_m_cpusubtype;
    protected $_m_filetype;
    protected $_m_ncmds;
    protected $_m_sizeofcmds;
    protected $_m_flags;
    protected $_m_reserved;
    public function cputype() { return $this->_m_cputype; }
    public function cpusubtype() { return $this->_m_cpusubtype; }
    public function filetype() { return $this->_m_filetype; }
    public function ncmds() { return $this->_m_ncmds; }
    public function sizeofcmds() { return $this->_m_sizeofcmds; }
    public function flags() { return $this->_m_flags; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \MachO;

class LinkeditDataCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dataOff = $this->_io->readU4le();
        $this->_m_dataSize = $this->_io->readU4le();
    }
    protected $_m_dataOff;
    protected $_m_dataSize;
    public function dataOff() { return $this->_m_dataOff; }
    public function dataSize() { return $this->_m_dataSize; }
}

namespace \MachO;

class SubCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = new \MachO\LcStr($this->_io, $this, $this->_root);
    }
    protected $_m_name;
    public function name() { return $this->_m_name; }
}

namespace \MachO;

class TwolevelHintsCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_offset = $this->_io->readU4le();
        $this->_m_numHints = $this->_io->readU4le();
    }
    protected $_m_offset;
    protected $_m_numHints;
    public function offset() { return $this->_m_offset; }
    public function numHints() { return $this->_m_numHints; }
}

namespace \MachO;

class Version extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\VersionMinCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_p1 = $this->_io->readU1();
        $this->_m_minor = $this->_io->readU1();
        $this->_m_major = $this->_io->readU1();
        $this->_m_release = $this->_io->readU1();
    }
    protected $_m_p1;
    protected $_m_minor;
    protected $_m_major;
    protected $_m_release;
    public function p1() { return $this->_m_p1; }
    public function minor() { return $this->_m_minor; }
    public function major() { return $this->_m_major; }
    public function release() { return $this->_m_release; }
}

namespace \MachO;

class EncryptionInfoCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_cryptoff = $this->_io->readU4le();
        $this->_m_cryptsize = $this->_io->readU4le();
        $this->_m_cryptid = $this->_io->readU4le();
        if ( (($this->_root()->magic() == \MachO\MagicType::MACHO_BE_X64) || ($this->_root()->magic() == \MachO\MagicType::MACHO_LE_X64)) ) {
            $this->_m_pad = $this->_io->readU4le();
        }
    }
    protected $_m_cryptoff;
    protected $_m_cryptsize;
    protected $_m_cryptid;
    protected $_m_pad;
    public function cryptoff() { return $this->_m_cryptoff; }
    public function cryptsize() { return $this->_m_cryptsize; }
    public function cryptid() { return $this->_m_cryptid; }
    public function pad() { return $this->_m_pad; }
}

namespace \MachO;

class CodeSignatureCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_dataOff = $this->_io->readU4le();
        $this->_m_dataSize = $this->_io->readU4le();
    }
    protected $_m_codeSignature;
    public function codeSignature() {
        if ($this->_m_codeSignature !== null)
            return $this->_m_codeSignature;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->dataOff());
        $this->_m__raw_codeSignature = $io->readBytes($this->dataSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_codeSignature);
        $this->_m_codeSignature = new \MachO\CsBlob($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_codeSignature;
    }
    protected $_m_dataOff;
    protected $_m_dataSize;
    protected $_m__raw_codeSignature;
    public function dataOff() { return $this->_m_dataOff; }
    public function dataSize() { return $this->_m_dataSize; }
    public function _raw_codeSignature() { return $this->_m__raw_codeSignature; }
}

namespace \MachO;

class DyldInfoCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_rebaseOff = $this->_io->readU4le();
        $this->_m_rebaseSize = $this->_io->readU4le();
        $this->_m_bindOff = $this->_io->readU4le();
        $this->_m_bindSize = $this->_io->readU4le();
        $this->_m_weakBindOff = $this->_io->readU4le();
        $this->_m_weakBindSize = $this->_io->readU4le();
        $this->_m_lazyBindOff = $this->_io->readU4le();
        $this->_m_lazyBindSize = $this->_io->readU4le();
        $this->_m_exportOff = $this->_io->readU4le();
        $this->_m_exportSize = $this->_io->readU4le();
    }
    protected $_m_rebase;
    public function rebase() {
        if ($this->_m_rebase !== null)
            return $this->_m_rebase;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->rebaseOff());
        $this->_m__raw_rebase = $io->readBytes($this->rebaseSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_rebase);
        $this->_m_rebase = new \MachO\DyldInfoCommand\RebaseData($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_rebase;
    }
    protected $_m_bind;
    public function bind() {
        if ($this->_m_bind !== null)
            return $this->_m_bind;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->bindOff());
        $this->_m__raw_bind = $io->readBytes($this->bindSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_bind);
        $this->_m_bind = new \MachO\DyldInfoCommand\BindData($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_bind;
    }
    protected $_m_lazyBind;
    public function lazyBind() {
        if ($this->_m_lazyBind !== null)
            return $this->_m_lazyBind;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->lazyBindOff());
        $this->_m__raw_lazyBind = $io->readBytes($this->lazyBindSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_lazyBind);
        $this->_m_lazyBind = new \MachO\DyldInfoCommand\LazyBindData($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_lazyBind;
    }
    protected $_m_exports;
    public function exports() {
        if ($this->_m_exports !== null)
            return $this->_m_exports;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->exportOff());
        $this->_m__raw_exports = $io->readBytes($this->exportSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_exports);
        $this->_m_exports = new \MachO\DyldInfoCommand\ExportNode($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_exports;
    }
    protected $_m_rebaseOff;
    protected $_m_rebaseSize;
    protected $_m_bindOff;
    protected $_m_bindSize;
    protected $_m_weakBindOff;
    protected $_m_weakBindSize;
    protected $_m_lazyBindOff;
    protected $_m_lazyBindSize;
    protected $_m_exportOff;
    protected $_m_exportSize;
    protected $_m__raw_rebase;
    protected $_m__raw_bind;
    protected $_m__raw_lazyBind;
    protected $_m__raw_exports;
    public function rebaseOff() { return $this->_m_rebaseOff; }
    public function rebaseSize() { return $this->_m_rebaseSize; }
    public function bindOff() { return $this->_m_bindOff; }
    public function bindSize() { return $this->_m_bindSize; }
    public function weakBindOff() { return $this->_m_weakBindOff; }
    public function weakBindSize() { return $this->_m_weakBindSize; }
    public function lazyBindOff() { return $this->_m_lazyBindOff; }
    public function lazyBindSize() { return $this->_m_lazyBindSize; }
    public function exportOff() { return $this->_m_exportOff; }
    public function exportSize() { return $this->_m_exportSize; }
    public function _raw_rebase() { return $this->_m__raw_rebase; }
    public function _raw_bind() { return $this->_m__raw_bind; }
    public function _raw_lazyBind() { return $this->_m__raw_lazyBind; }
    public function _raw_exports() { return $this->_m__raw_exports; }
}

namespace \MachO\DyldInfoCommand;

class BindItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_opcodeAndImmediate = $this->_io->readU1();
        if ( (($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::SET_DYLIB_ORDINAL_ULEB) || ($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::SET_APPEND_SLEB) || ($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::SET_SEGMENT_AND_OFFSET_ULEB) || ($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::ADD_ADDRESS_ULEB) || ($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::DO_BIND_ADD_ADDRESS_ULEB) || ($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::DO_BIND_ULEB_TIMES_SKIPPING_ULEB)) ) {
            $this->_m_uleb = new \MachO\Uleb128($this->_io, $this, $this->_root);
        }
        if ($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::DO_BIND_ULEB_TIMES_SKIPPING_ULEB) {
            $this->_m_skip = new \MachO\Uleb128($this->_io, $this, $this->_root);
        }
        if ($this->opcode() == \MachO\DyldInfoCommand\BindOpcode::SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE) {
            $this->_m_symbol = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ascii");
        }
    }
    protected $_m_opcode;
    public function opcode() {
        if ($this->_m_opcode !== null)
            return $this->_m_opcode;
        $this->_m_opcode = ($this->opcodeAndImmediate() & 240);
        return $this->_m_opcode;
    }
    protected $_m_immediate;
    public function immediate() {
        if ($this->_m_immediate !== null)
            return $this->_m_immediate;
        $this->_m_immediate = ($this->opcodeAndImmediate() & 15);
        return $this->_m_immediate;
    }
    protected $_m_opcodeAndImmediate;
    protected $_m_uleb;
    protected $_m_skip;
    protected $_m_symbol;
    public function opcodeAndImmediate() { return $this->_m_opcodeAndImmediate; }
    public function uleb() { return $this->_m_uleb; }
    public function skip() { return $this->_m_skip; }
    public function symbol() { return $this->_m_symbol; }
}

namespace \MachO\DyldInfoCommand;

class RebaseData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\DyldInfoCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        do {
            $_ = new \MachO\DyldInfoCommand\RebaseData\RebaseItem($this->_io, $this, $this->_root);
            $this->_m_items[] = $_;
            $i++;
        } while (!($_->opcode() == \MachO\DyldInfoCommand\RebaseData\Opcode::DONE));
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \MachO\DyldInfoCommand\RebaseData;

class RebaseItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\DyldInfoCommand\RebaseData $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_opcodeAndImmediate = $this->_io->readU1();
        if ( (($this->opcode() == \MachO\DyldInfoCommand\RebaseData\Opcode::SET_SEGMENT_AND_OFFSET_ULEB) || ($this->opcode() == \MachO\DyldInfoCommand\RebaseData\Opcode::ADD_ADDRESS_ULEB) || ($this->opcode() == \MachO\DyldInfoCommand\RebaseData\Opcode::DO_REBASE_ULEB_TIMES) || ($this->opcode() == \MachO\DyldInfoCommand\RebaseData\Opcode::DO_REBASE_ADD_ADDRESS_ULEB) || ($this->opcode() == \MachO\DyldInfoCommand\RebaseData\Opcode::DO_REBASE_ULEB_TIMES_SKIPPING_ULEB)) ) {
            $this->_m_uleb = new \MachO\Uleb128($this->_io, $this, $this->_root);
        }
        if ($this->opcode() == \MachO\DyldInfoCommand\RebaseData\Opcode::DO_REBASE_ULEB_TIMES_SKIPPING_ULEB) {
            $this->_m_skip = new \MachO\Uleb128($this->_io, $this, $this->_root);
        }
    }
    protected $_m_opcode;
    public function opcode() {
        if ($this->_m_opcode !== null)
            return $this->_m_opcode;
        $this->_m_opcode = ($this->opcodeAndImmediate() & 240);
        return $this->_m_opcode;
    }
    protected $_m_immediate;
    public function immediate() {
        if ($this->_m_immediate !== null)
            return $this->_m_immediate;
        $this->_m_immediate = ($this->opcodeAndImmediate() & 15);
        return $this->_m_immediate;
    }
    protected $_m_opcodeAndImmediate;
    protected $_m_uleb;
    protected $_m_skip;
    public function opcodeAndImmediate() { return $this->_m_opcodeAndImmediate; }
    public function uleb() { return $this->_m_uleb; }
    public function skip() { return $this->_m_skip; }
}

namespace \MachO\DyldInfoCommand\RebaseData;

class Opcode {
    const DONE = 0;
    const SET_TYPE_IMMEDIATE = 16;
    const SET_SEGMENT_AND_OFFSET_ULEB = 32;
    const ADD_ADDRESS_ULEB = 48;
    const ADD_ADDRESS_IMMEDIATE_SCALED = 64;
    const DO_REBASE_IMMEDIATE_TIMES = 80;
    const DO_REBASE_ULEB_TIMES = 96;
    const DO_REBASE_ADD_ADDRESS_ULEB = 112;
    const DO_REBASE_ULEB_TIMES_SKIPPING_ULEB = 128;
}

namespace \MachO\DyldInfoCommand;

class ExportNode extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_terminalSize = new \MachO\Uleb128($this->_io, $this, $this->_root);
        $this->_m_childrenCount = $this->_io->readU1();
        $this->_m_children = [];
        $n = $this->childrenCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_children[] = new \MachO\DyldInfoCommand\ExportNode\Child($this->_io, $this, $this->_root);
        }
        $this->_m_terminal = $this->_io->readBytes($this->terminalSize()->value());
    }
    protected $_m_terminalSize;
    protected $_m_childrenCount;
    protected $_m_children;
    protected $_m_terminal;
    public function terminalSize() { return $this->_m_terminalSize; }
    public function childrenCount() { return $this->_m_childrenCount; }
    public function children() { return $this->_m_children; }
    public function terminal() { return $this->_m_terminal; }
}

namespace \MachO\DyldInfoCommand\ExportNode;

class Child extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\DyldInfoCommand\ExportNode $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ascii");
        $this->_m_nodeOffset = new \MachO\Uleb128($this->_io, $this, $this->_root);
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->nodeOffset()->value());
        $this->_m_value = new \MachO\DyldInfoCommand\ExportNode($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_value;
    }
    protected $_m_name;
    protected $_m_nodeOffset;
    public function name() { return $this->_m_name; }
    public function nodeOffset() { return $this->_m_nodeOffset; }
}

namespace \MachO\DyldInfoCommand;

class BindData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\DyldInfoCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        do {
            $_ = new \MachO\DyldInfoCommand\BindItem($this->_io, $this, $this->_root);
            $this->_m_items[] = $_;
            $i++;
        } while (!($_->opcode() == \MachO\DyldInfoCommand\BindOpcode::DONE));
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \MachO\DyldInfoCommand;

class LazyBindData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\DyldInfoCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_items[] = new \MachO\DyldInfoCommand\BindItem($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \MachO\DyldInfoCommand;

class BindOpcode {
    const DONE = 0;
    const SET_DYLIB_ORDINAL_IMMEDIATE = 16;
    const SET_DYLIB_ORDINAL_ULEB = 32;
    const SET_DYLIB_SPECIAL_IMMEDIATE = 48;
    const SET_SYMBOL_TRAILING_FLAGS_IMMEDIATE = 64;
    const SET_TYPE_IMMEDIATE = 80;
    const SET_APPEND_SLEB = 96;
    const SET_SEGMENT_AND_OFFSET_ULEB = 112;
    const ADD_ADDRESS_ULEB = 128;
    const DO_BIND = 144;
    const DO_BIND_ADD_ADDRESS_ULEB = 160;
    const DO_BIND_ADD_ADDRESS_IMMEDIATE_SCALED = 176;
    const DO_BIND_ULEB_TIMES_SKIPPING_ULEB = 192;
}

namespace \MachO;

class DylinkerCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_name = new \MachO\LcStr($this->_io, $this, $this->_root);
    }
    protected $_m_name;
    public function name() { return $this->_m_name; }
}

namespace \MachO;

class DylibCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_nameOffset = $this->_io->readU4le();
        $this->_m_timestamp = $this->_io->readU4le();
        $this->_m_currentVersion = $this->_io->readU4le();
        $this->_m_compatibilityVersion = $this->_io->readU4le();
        $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "utf-8");
    }
    protected $_m_nameOffset;
    protected $_m_timestamp;
    protected $_m_currentVersion;
    protected $_m_compatibilityVersion;
    protected $_m_name;
    public function nameOffset() { return $this->_m_nameOffset; }
    public function timestamp() { return $this->_m_timestamp; }
    public function currentVersion() { return $this->_m_currentVersion; }
    public function compatibilityVersion() { return $this->_m_compatibilityVersion; }
    public function name() { return $this->_m_name; }
}

namespace \MachO;

class LcStr extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU4le();
        $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
    }
    protected $_m_length;
    protected $_m_value;
    public function length() { return $this->_m_length; }
    public function value() { return $this->_m_value; }
}

namespace \MachO;

class LoadCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU4le();
        $this->_m_size = $this->_io->readU4le();
        switch ($this->type()) {
            case \MachO\LoadCommandType::SUB_LIBRARY:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\SubCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::SEGMENT_SPLIT_INFO:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\LinkeditDataCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::RPATH:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\RpathCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::SOURCE_VERSION:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\SourceVersionCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::ENCRYPTION_INFO_64:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\EncryptionInfoCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::VERSION_MIN_TVOS:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\VersionMinCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::LOAD_DYLINKER:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylinkerCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::SUB_FRAMEWORK:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\SubCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::LOAD_WEAK_DYLIB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylibCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::VERSION_MIN_IPHONEOS:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\VersionMinCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::LINKER_OPTIMIZATION_HINT:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\LinkeditDataCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::DYLD_ENVIRONMENT:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylinkerCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::LOAD_UPWARD_DYLIB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylibCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::DYLIB_CODE_SIGN_DRS:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\LinkeditDataCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::DYLD_INFO:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DyldInfoCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::REEXPORT_DYLIB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylibCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::SYMTAB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\SymtabCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::ROUTINES_64:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\RoutinesCommand64($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::ID_DYLINKER:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylinkerCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::MAIN:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\EntryPointCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::FUNCTION_STARTS:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\LinkeditDataCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::VERSION_MIN_MACOSX:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\VersionMinCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::DATA_IN_CODE:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\LinkeditDataCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::VERSION_MIN_WATCHOS:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\VersionMinCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::ENCRYPTION_INFO:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\EncryptionInfoCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::SUB_UMBRELLA:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\SubCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::LINKER_OPTION:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\LinkerOptionCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::TWOLEVEL_HINTS:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\TwolevelHintsCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::UUID:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\UuidCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::DYLD_INFO_ONLY:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DyldInfoCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::LAZY_LOAD_DYLIB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylibCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::SUB_CLIENT:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\SubCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::ROUTINES:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\RoutinesCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::CODE_SIGNATURE:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\CodeSignatureCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::DYSYMTAB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DysymtabCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::LOAD_DYLIB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylibCommand($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::SEGMENT_64:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\SegmentCommand64($io, $this, $this->_root);
                break;
            case \MachO\LoadCommandType::ID_DYLIB:
                $this->_m__raw_body = $this->_io->readBytes(($this->size() - 8));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \MachO\DylibCommand($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes(($this->size() - 8));
                break;
        }
    }
    protected $_m_type;
    protected $_m_size;
    protected $_m_body;
    protected $_m__raw_body;
    public function type() { return $this->_m_type; }
    public function size() { return $this->_m_size; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \MachO;

class UuidCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_uuid = $this->_io->readBytes(16);
    }
    protected $_m_uuid;
    public function uuid() { return $this->_m_uuid; }
}

namespace \MachO;

class SymtabCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_symOff = $this->_io->readU4le();
        $this->_m_nSyms = $this->_io->readU4le();
        $this->_m_strOff = $this->_io->readU4le();
        $this->_m_strSize = $this->_io->readU4le();
    }
    protected $_m_symbols;
    public function symbols() {
        if ($this->_m_symbols !== null)
            return $this->_m_symbols;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->symOff());
        $this->_m_symbols = [];
        $n = $this->nSyms();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_symbols[] = new \MachO\SymtabCommand\Nlist64($io, $this, $this->_root);
        }
        $io->seek($_pos);
        return $this->_m_symbols;
    }
    protected $_m_strs;
    public function strs() {
        if ($this->_m_strs !== null)
            return $this->_m_strs;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->strOff());
        $this->_m__raw_strs = $io->readBytes($this->strSize());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_strs);
        $this->_m_strs = new \MachO\SymtabCommand\StrTable($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_strs;
    }
    protected $_m_symOff;
    protected $_m_nSyms;
    protected $_m_strOff;
    protected $_m_strSize;
    protected $_m__raw_strs;
    public function symOff() { return $this->_m_symOff; }
    public function nSyms() { return $this->_m_nSyms; }
    public function strOff() { return $this->_m_strOff; }
    public function strSize() { return $this->_m_strSize; }
    public function _raw_strs() { return $this->_m__raw_strs; }
}

namespace \MachO\SymtabCommand;

class StrTable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SymtabCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_unknown = $this->_io->readU4le();
        $this->_m_items = [];
        $i = 0;
        do {
            $_ = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ascii");
            $this->_m_items[] = $_;
            $i++;
        } while (!($_ == ""));
    }
    protected $_m_unknown;
    protected $_m_items;
    public function unknown() { return $this->_m_unknown; }
    public function items() { return $this->_m_items; }
}

namespace \MachO\SymtabCommand;

class Nlist64 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\SymtabCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_un = $this->_io->readU4le();
        $this->_m_type = $this->_io->readU1();
        $this->_m_sect = $this->_io->readU1();
        $this->_m_desc = $this->_io->readU2le();
        $this->_m_value = $this->_io->readU8le();
    }
    protected $_m_un;
    protected $_m_type;
    protected $_m_sect;
    protected $_m_desc;
    protected $_m_value;
    public function un() { return $this->_m_un; }
    public function type() { return $this->_m_type; }
    public function sect() { return $this->_m_sect; }
    public function desc() { return $this->_m_desc; }
    public function value() { return $this->_m_value; }
}

namespace \MachO;

class VersionMinCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = new \MachO\Version($this->_io, $this, $this->_root);
        $this->_m_sdk = new \MachO\Version($this->_io, $this, $this->_root);
    }
    protected $_m_version;
    protected $_m_sdk;
    public function version() { return $this->_m_version; }
    public function sdk() { return $this->_m_sdk; }
}

namespace \MachO;

class EntryPointCommand extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \MachO\LoadCommand $_parent = null, \MachO $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entryOff = $this->_io->readU8le();
        $this->_m_stackSize = $this->_io->readU8le();
    }
    protected $_m_entryOff;
    protected $_m_stackSize;
    public function entryOff() { return $this->_m_entryOff; }
    public function stackSize() { return $this->_m_stackSize; }
}

namespace \MachO;

class MagicType {
    const FAT_LE = 3199925962;
    const FAT_BE = 3405691582;
    const MACHO_LE_X86 = 3472551422;
    const MACHO_LE_X64 = 3489328638;
    const MACHO_BE_X86 = 4277009102;
    const MACHO_BE_X64 = 4277009103;
}

namespace \MachO;

class CpuType {
    const VAX = 1;
    const ROMP = 2;
    const NS32032 = 4;
    const NS32332 = 5;
    const I386 = 7;
    const MIPS = 8;
    const NS32532 = 9;
    const HPPA = 11;
    const ARM = 12;
    const MC88000 = 13;
    const SPARC = 14;
    const I860 = 15;
    const I860_LITTLE = 16;
    const RS6000 = 17;
    const POWERPC = 18;
    const ABI64 = 16777216;
    const X86_64 = 16777223;
    const ARM64 = 16777228;
    const POWERPC64 = 16777234;
    const ANY = 4294967295;
}

namespace \MachO;

class FileType {
    const OBJECT = 1;
    const EXECUTE = 2;
    const FVMLIB = 3;
    const CORE = 4;
    const PRELOAD = 5;
    const DYLIB = 6;
    const DYLINKER = 7;
    const BUNDLE = 8;
    const DYLIB_STUB = 9;
    const DSYM = 10;
    const KEXT_BUNDLE = 11;
}

namespace \MachO;

class LoadCommandType {
    const SEGMENT = 1;
    const SYMTAB = 2;
    const SYMSEG = 3;
    const THREAD = 4;
    const UNIX_THREAD = 5;
    const LOAD_FVM_LIB = 6;
    const ID_FVM_LIB = 7;
    const IDENT = 8;
    const FVM_FILE = 9;
    const PREPAGE = 10;
    const DYSYMTAB = 11;
    const LOAD_DYLIB = 12;
    const ID_DYLIB = 13;
    const LOAD_DYLINKER = 14;
    const ID_DYLINKER = 15;
    const PREBOUND_DYLIB = 16;
    const ROUTINES = 17;
    const SUB_FRAMEWORK = 18;
    const SUB_UMBRELLA = 19;
    const SUB_CLIENT = 20;
    const SUB_LIBRARY = 21;
    const TWOLEVEL_HINTS = 22;
    const PREBIND_CKSUM = 23;
    const SEGMENT_64 = 25;
    const ROUTINES_64 = 26;
    const UUID = 27;
    const CODE_SIGNATURE = 29;
    const SEGMENT_SPLIT_INFO = 30;
    const LAZY_LOAD_DYLIB = 32;
    const ENCRYPTION_INFO = 33;
    const DYLD_INFO = 34;
    const VERSION_MIN_MACOSX = 36;
    const VERSION_MIN_IPHONEOS = 37;
    const FUNCTION_STARTS = 38;
    const DYLD_ENVIRONMENT = 39;
    const DATA_IN_CODE = 41;
    const SOURCE_VERSION = 42;
    const DYLIB_CODE_SIGN_DRS = 43;
    const ENCRYPTION_INFO_64 = 44;
    const LINKER_OPTION = 45;
    const LINKER_OPTIMIZATION_HINT = 46;
    const VERSION_MIN_TVOS = 47;
    const VERSION_MIN_WATCHOS = 48;
    const REQ_DYLD = 2147483648;
    const LOAD_WEAK_DYLIB = 2147483672;
    const RPATH = 2147483676;
    const REEXPORT_DYLIB = 2147483679;
    const DYLD_INFO_ONLY = 2147483682;
    const LOAD_UPWARD_DYLIB = 2147483683;
    const MAIN = 2147483688;
}
