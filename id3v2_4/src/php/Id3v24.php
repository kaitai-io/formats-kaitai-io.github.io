<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Id3v24 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tag = new \Id3v24\Tag($this->_io, $this, $this->_root);
    }
    protected $_m_tag;
    public function tag() { return $this->_m_tag; }
}

namespace \Id3v24;

class U1beSynchsafe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\U2beSynchsafe $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_padding = $this->_io->readBitsInt(1) != 0;
        $this->_m_value = $this->_io->readBitsInt(7);
    }
    protected $_m_padding;
    protected $_m_value;
    public function padding() { return $this->_m_padding; }
    public function value() { return $this->_m_value; }
}

namespace \Id3v24;

class U2beSynchsafe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\U4beSynchsafe $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_byte0 = new \Id3v24\U1beSynchsafe($this->_io, $this, $this->_root);
        $this->_m_byte1 = new \Id3v24\U1beSynchsafe($this->_io, $this, $this->_root);
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = (($this->byte0()->value() << 7) | $this->byte1()->value());
        return $this->_m_value;
    }
    protected $_m_byte0;
    protected $_m_byte1;
    public function byte0() { return $this->_m_byte0; }
    public function byte1() { return $this->_m_byte1; }
}

namespace \Id3v24;

class Tag extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24 $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Id3v24\Header($this->_io, $this, $this->_root);
        if ($this->header()->flags()->flagHeaderex()) {
            $this->_m_headerEx = new \Id3v24\HeaderEx($this->_io, $this, $this->_root);
        }
        $this->_m_frames = [];
        do {
            $_ = new \Id3v24\Frame($this->_io, $this, $this->_root);
            $this->_m_frames[] = $_;
        } while (!( ((($this->_io()->pos() + $_->size()->value()) > $this->header()->size()->value()) || ($_->isInvalid())) ));
        if (!($this->header()->flags()->flagFooter())) {
            $this->_m_padding = new \Id3v24\Padding($this->_io, $this, $this->_root);
        }
        if ($this->header()->flags()->flagFooter()) {
            $this->_m_footer = new \Id3v24\Footer($this->_io, $this, $this->_root);
        }
    }
    protected $_m_header;
    protected $_m_headerEx;
    protected $_m_frames;
    protected $_m_padding;
    protected $_m_footer;
    public function header() { return $this->_m_header; }
    public function headerEx() { return $this->_m_headerEx; }
    public function frames() { return $this->_m_frames; }
    public function padding() { return $this->_m_padding; }
    public function footer() { return $this->_m_footer; }
}

namespace \Id3v24;

class U4beSynchsafe extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_short0 = new \Id3v24\U2beSynchsafe($this->_io, $this, $this->_root);
        $this->_m_short1 = new \Id3v24\U2beSynchsafe($this->_io, $this, $this->_root);
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = (($this->short0()->value() << 14) | $this->short1()->value());
        return $this->_m_value;
    }
    protected $_m_short0;
    protected $_m_short1;
    public function short0() { return $this->_m_short0; }
    public function short1() { return $this->_m_short1; }
}

namespace \Id3v24;

class Frame extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Tag $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_id = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
        $this->_m_size = new \Id3v24\U4beSynchsafe($this->_io, $this, $this->_root);
        $this->_m_flagsStatus = new \Id3v24\Frame\FlagsStatus($this->_io, $this, $this->_root);
        $this->_m_flagsFormat = new \Id3v24\Frame\FlagsFormat($this->_io, $this, $this->_root);
        $this->_m_data = $this->_io->readBytes($this->size()->value());
    }
    protected $_m_isInvalid;
    public function isInvalid() {
        if ($this->_m_isInvalid !== null)
            return $this->_m_isInvalid;
        $this->_m_isInvalid = $this->id() == "\000\000\000\000";
        return $this->_m_isInvalid;
    }
    protected $_m_id;
    protected $_m_size;
    protected $_m_flagsStatus;
    protected $_m_flagsFormat;
    protected $_m_data;
    public function id() { return $this->_m_id; }
    public function size() { return $this->_m_size; }
    public function flagsStatus() { return $this->_m_flagsStatus; }
    public function flagsFormat() { return $this->_m_flagsFormat; }
    public function data() { return $this->_m_data; }
}

namespace \Id3v24\Frame;

class FlagsStatus extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Frame $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagDiscardAlterTag = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagDiscardAlterFile = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagReadOnly = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved2 = $this->_io->readBitsInt(4);
    }
    protected $_m_reserved1;
    protected $_m_flagDiscardAlterTag;
    protected $_m_flagDiscardAlterFile;
    protected $_m_flagReadOnly;
    protected $_m_reserved2;
    public function reserved1() { return $this->_m_reserved1; }
    public function flagDiscardAlterTag() { return $this->_m_flagDiscardAlterTag; }
    public function flagDiscardAlterFile() { return $this->_m_flagDiscardAlterFile; }
    public function flagReadOnly() { return $this->_m_flagReadOnly; }
    public function reserved2() { return $this->_m_reserved2; }
}

namespace \Id3v24\Frame;

class FlagsFormat extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Frame $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagGrouping = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved2 = $this->_io->readBitsInt(2);
        $this->_m_flagCompressed = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagEncrypted = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagUnsynchronisated = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagIndicator = $this->_io->readBitsInt(1) != 0;
    }
    protected $_m_reserved1;
    protected $_m_flagGrouping;
    protected $_m_reserved2;
    protected $_m_flagCompressed;
    protected $_m_flagEncrypted;
    protected $_m_flagUnsynchronisated;
    protected $_m_flagIndicator;
    public function reserved1() { return $this->_m_reserved1; }
    public function flagGrouping() { return $this->_m_flagGrouping; }
    public function reserved2() { return $this->_m_reserved2; }
    public function flagCompressed() { return $this->_m_flagCompressed; }
    public function flagEncrypted() { return $this->_m_flagEncrypted; }
    public function flagUnsynchronisated() { return $this->_m_flagUnsynchronisated; }
    public function flagIndicator() { return $this->_m_flagIndicator; }
}

namespace \Id3v24;

class HeaderEx extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Tag $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_size = new \Id3v24\U4beSynchsafe($this->_io, $this, $this->_root);
        $this->_m_flagsEx = new \Id3v24\HeaderEx\FlagsEx($this->_io, $this, $this->_root);
        $this->_m_data = $this->_io->readBytes(($this->size()->value() - 5));
    }
    protected $_m_size;
    protected $_m_flagsEx;
    protected $_m_data;
    public function size() { return $this->_m_size; }
    public function flagsEx() { return $this->_m_flagsEx; }
    public function data() { return $this->_m_data; }
}

namespace \Id3v24\HeaderEx;

class FlagsEx extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\HeaderEx $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagUpdate = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagCrc = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagRestrictions = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved2 = $this->_io->readBitsInt(4);
    }
    protected $_m_reserved1;
    protected $_m_flagUpdate;
    protected $_m_flagCrc;
    protected $_m_flagRestrictions;
    protected $_m_reserved2;
    public function reserved1() { return $this->_m_reserved1; }
    public function flagUpdate() { return $this->_m_flagUpdate; }
    public function flagCrc() { return $this->_m_flagCrc; }
    public function flagRestrictions() { return $this->_m_flagRestrictions; }
    public function reserved2() { return $this->_m_reserved2; }
}

namespace \Id3v24;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Tag $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x49\x44\x33");
        $this->_m_versionMajor = $this->_io->readU1();
        $this->_m_versionRevision = $this->_io->readU1();
        $this->_m_flags = new \Id3v24\Header\Flags($this->_io, $this, $this->_root);
        $this->_m_size = new \Id3v24\U4beSynchsafe($this->_io, $this, $this->_root);
    }
    protected $_m_magic;
    protected $_m_versionMajor;
    protected $_m_versionRevision;
    protected $_m_flags;
    protected $_m_size;
    public function magic() { return $this->_m_magic; }
    public function versionMajor() { return $this->_m_versionMajor; }
    public function versionRevision() { return $this->_m_versionRevision; }
    public function flags() { return $this->_m_flags; }
    public function size() { return $this->_m_size; }
}

namespace \Id3v24\Header;

class Flags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Header $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flagUnsynchronization = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagHeaderex = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagExperimental = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagFooter = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved = $this->_io->readBitsInt(4);
    }
    protected $_m_flagUnsynchronization;
    protected $_m_flagHeaderex;
    protected $_m_flagExperimental;
    protected $_m_flagFooter;
    protected $_m_reserved;
    public function flagUnsynchronization() { return $this->_m_flagUnsynchronization; }
    public function flagHeaderex() { return $this->_m_flagHeaderex; }
    public function flagExperimental() { return $this->_m_flagExperimental; }
    public function flagFooter() { return $this->_m_flagFooter; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \Id3v24;

class Padding extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Tag $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_padding = $this->_io->readBytes(($this->_root()->tag()->header()->size()->value() - $this->_io()->pos()));
    }
    protected $_m_padding;
    public function padding() { return $this->_m_padding; }
}

namespace \Id3v24;

class Footer extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Tag $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x33\x44\x49");
        $this->_m_versionMajor = $this->_io->readU1();
        $this->_m_versionRevision = $this->_io->readU1();
        $this->_m_flags = new \Id3v24\Footer\Flags($this->_io, $this, $this->_root);
        $this->_m_size = new \Id3v24\U4beSynchsafe($this->_io, $this, $this->_root);
    }
    protected $_m_magic;
    protected $_m_versionMajor;
    protected $_m_versionRevision;
    protected $_m_flags;
    protected $_m_size;
    public function magic() { return $this->_m_magic; }
    public function versionMajor() { return $this->_m_versionMajor; }
    public function versionRevision() { return $this->_m_versionRevision; }
    public function flags() { return $this->_m_flags; }
    public function size() { return $this->_m_size; }
}

namespace \Id3v24\Footer;

class Flags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v24\Footer $parent = null, \Id3v24 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flagUnsynchronization = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagHeaderex = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagExperimental = $this->_io->readBitsInt(1) != 0;
        $this->_m_flagFooter = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved = $this->_io->readBitsInt(4);
    }
    protected $_m_flagUnsynchronization;
    protected $_m_flagHeaderex;
    protected $_m_flagExperimental;
    protected $_m_flagFooter;
    protected $_m_reserved;
    public function flagUnsynchronization() { return $this->_m_flagUnsynchronization; }
    public function flagHeaderex() { return $this->_m_flagHeaderex; }
    public function flagExperimental() { return $this->_m_flagExperimental; }
    public function flagFooter() { return $this->_m_flagFooter; }
    public function reserved() { return $this->_m_reserved; }
}
