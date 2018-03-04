<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * RAR is a archive format used by popular proprietary RAR archiver,
 * created by Eugene Roshal. There are two major versions of format
 * (v1.5-4.0 and RAR v5+).
 * 
 * File format essentially consists of a linear sequence of
 * blocks. Each block has fixed header and custom body (that depends on
 * block type), so it's possible to skip block even if one doesn't know
 * how to process a certain block type.
 */

class Rar extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Rar $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = new \Rar\MagicSignature($this->_io, $this, $this->_root);
        $this->_m_blocks = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            switch ($this->magic()->version()) {
                case 0:
                    $this->_m_blocks[] = new \Rar\Block($this->_io, $this, $this->_root);
                    break;
                case 1:
                    $this->_m_blocks[] = new \Rar\BlockV5($this->_io, $this, $this->_root);
                    break;
            }
            $i++;
        }
    }
    protected $_m_magic;
    protected $_m_blocks;

    /**
     * File format signature to validate that it is indeed a RAR archive
     */
    public function magic() { return $this->_m_magic; }

    /**
     * Sequence of blocks that constitute the RAR file
     */
    public function blocks() { return $this->_m_blocks; }
}

namespace \Rar;

class BlockV5 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Rar $_parent = null, \Rar $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
}

/**
 * Basic block that RAR files consist of. There are several block
 * types (see `block_type`), which have different `body` and
 * `add_body`.
 */

namespace \Rar;

class Block extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Rar $_parent = null, \Rar $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_crc16 = $this->_io->readU2le();
        $this->_m_blockType = $this->_io->readU1();
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_blockSize = $this->_io->readU2le();
        if ($this->hasAdd()) {
            $this->_m_addSize = $this->_io->readU4le();
        }
        switch ($this->blockType()) {
            case \Rar\BlockTypes::FILE_HEADER:
                $this->_m__raw_body = $this->_io->readBytes($this->bodySize());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \Rar\BlockFileHeader($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->bodySize());
                break;
        }
        if ($this->hasAdd()) {
            $this->_m_addBody = $this->_io->readBytes($this->addSize());
        }
    }
    protected $_m_hasAdd;

    /**
     * True if block has additional content attached to it
     */
    public function hasAdd() {
        if ($this->_m_hasAdd !== null)
            return $this->_m_hasAdd;
        $this->_m_hasAdd = ($this->flags() & 32768) != 0;
        return $this->_m_hasAdd;
    }
    protected $_m_headerSize;
    public function headerSize() {
        if ($this->_m_headerSize !== null)
            return $this->_m_headerSize;
        $this->_m_headerSize = ($this->hasAdd() ? 11 : 7);
        return $this->_m_headerSize;
    }
    protected $_m_bodySize;
    public function bodySize() {
        if ($this->_m_bodySize !== null)
            return $this->_m_bodySize;
        $this->_m_bodySize = ($this->blockSize() - $this->headerSize());
        return $this->_m_bodySize;
    }
    protected $_m_crc16;
    protected $_m_blockType;
    protected $_m_flags;
    protected $_m_blockSize;
    protected $_m_addSize;
    protected $_m_body;
    protected $_m_addBody;
    protected $_m__raw_body;

    /**
     * CRC16 of whole block or some part of it (depends on block type)
     */
    public function crc16() { return $this->_m_crc16; }
    public function blockType() { return $this->_m_blockType; }
    public function flags() { return $this->_m_flags; }

    /**
     * Size of block (header + body, but without additional content)
     */
    public function blockSize() { return $this->_m_blockSize; }

    /**
     * Size of additional content in this block
     */
    public function addSize() { return $this->_m_addSize; }
    public function body() { return $this->_m_body; }

    /**
     * Additional content in this block
     */
    public function addBody() { return $this->_m_addBody; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \Rar;

class BlockFileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Rar\Block $_parent = null, \Rar $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lowUnpSize = $this->_io->readU4le();
        $this->_m_hostOs = $this->_io->readU1();
        $this->_m_fileCrc32 = $this->_io->readU4le();
        $this->_m_fileTime = new \Rar\DosTime($this->_io, $this, $this->_root);
        $this->_m_rarVersion = $this->_io->readU1();
        $this->_m_method = $this->_io->readU1();
        $this->_m_nameSize = $this->_io->readU2le();
        $this->_m_attr = $this->_io->readU4le();
        if (($this->_parent()->flags() & 256) != 0) {
            $this->_m_highPackSize = $this->_io->readU4le();
        }
        $this->_m_fileName = $this->_io->readBytes($this->nameSize());
        if (($this->_parent()->flags() & 1024) != 0) {
            $this->_m_salt = $this->_io->readU8le();
        }
    }
    protected $_m_lowUnpSize;
    protected $_m_hostOs;
    protected $_m_fileCrc32;
    protected $_m_fileTime;
    protected $_m_rarVersion;
    protected $_m_method;
    protected $_m_nameSize;
    protected $_m_attr;
    protected $_m_highPackSize;
    protected $_m_fileName;
    protected $_m_salt;

    /**
     * Uncompressed file size (lower 32 bits, if 64-bit header flag is present)
     */
    public function lowUnpSize() { return $this->_m_lowUnpSize; }

    /**
     * Operating system used for archiving
     */
    public function hostOs() { return $this->_m_hostOs; }
    public function fileCrc32() { return $this->_m_fileCrc32; }

    /**
     * Date and time in standard MS DOS format
     */
    public function fileTime() { return $this->_m_fileTime; }

    /**
     * RAR version needed to extract file (Version number is encoded as 10 * Major version + minor version.)
     */
    public function rarVersion() { return $this->_m_rarVersion; }

    /**
     * Compression method
     */
    public function method() { return $this->_m_method; }

    /**
     * File name size
     */
    public function nameSize() { return $this->_m_nameSize; }

    /**
     * File attributes
     */
    public function attr() { return $this->_m_attr; }

    /**
     * Compressed file size, high 32 bits, only if 64-bit header flag is present
     */
    public function highPackSize() { return $this->_m_highPackSize; }
    public function fileName() { return $this->_m_fileName; }
    public function salt() { return $this->_m_salt; }
}

/**
 * RAR uses either 7-byte magic for RAR versions 1.5 to 4.0, and
 * 8-byte magic (and pretty different block format) for v5+. This
 * type would parse and validate both versions of signature. Note
 * that actually this signature is a valid RAR "block": in theory,
 * one can omit signature reading at all, and read this normally,
 * as a block, if exact RAR version is known (and thus it's
 * possible to choose correct block format).
 */

namespace \Rar;

class MagicSignature extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Rar $_parent = null, \Rar $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic1 = $this->_io->ensureFixedContents("\x52\x61\x72\x21\x1A\x07");
        $this->_m_version = $this->_io->readU1();
        if ($this->version() == 1) {
            $this->_m_magic3 = $this->_io->ensureFixedContents("\x00");
        }
    }
    protected $_m_magic1;
    protected $_m_version;
    protected $_m_magic3;

    /**
     * Fixed part of file's magic signature that doesn't change with RAR version
     */
    public function magic1() { return $this->_m_magic1; }

    /**
     * Variable part of magic signature: 0 means old (RAR 1.5-4.0)
     * format, 1 means new (RAR 5+) format
     */
    public function version() { return $this->_m_version; }

    /**
     * New format (RAR 5+) magic contains extra byte
     */
    public function magic3() { return $this->_m_magic3; }
}

namespace \Rar;

class DosTime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Rar\BlockFileHeader $_parent = null, \Rar $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_time = $this->_io->readU2le();
        $this->_m_date = $this->_io->readU2le();
    }
    protected $_m_month;
    public function month() {
        if ($this->_m_month !== null)
            return $this->_m_month;
        $this->_m_month = (($this->date() & 480) >> 5);
        return $this->_m_month;
    }
    protected $_m_seconds;
    public function seconds() {
        if ($this->_m_seconds !== null)
            return $this->_m_seconds;
        $this->_m_seconds = (($this->time() & 31) * 2);
        return $this->_m_seconds;
    }
    protected $_m_year;
    public function year() {
        if ($this->_m_year !== null)
            return $this->_m_year;
        $this->_m_year = ((($this->date() & 65024) >> 9) + 1980);
        return $this->_m_year;
    }
    protected $_m_minutes;
    public function minutes() {
        if ($this->_m_minutes !== null)
            return $this->_m_minutes;
        $this->_m_minutes = (($this->time() & 2016) >> 5);
        return $this->_m_minutes;
    }
    protected $_m_day;
    public function day() {
        if ($this->_m_day !== null)
            return $this->_m_day;
        $this->_m_day = ($this->date() & 31);
        return $this->_m_day;
    }
    protected $_m_hours;
    public function hours() {
        if ($this->_m_hours !== null)
            return $this->_m_hours;
        $this->_m_hours = (($this->time() & 63488) >> 11);
        return $this->_m_hours;
    }
    protected $_m_time;
    protected $_m_date;
    public function time() { return $this->_m_time; }
    public function date() { return $this->_m_date; }
}

namespace \Rar;

class BlockTypes {
    const MARKER = 114;
    const ARCHIVE_HEADER = 115;
    const FILE_HEADER = 116;
    const OLD_STYLE_COMMENT_HEADER = 117;
    const OLD_STYLE_AUTHENTICITY_INFO_76 = 118;
    const OLD_STYLE_SUBBLOCK = 119;
    const OLD_STYLE_RECOVERY_RECORD = 120;
    const OLD_STYLE_AUTHENTICITY_INFO_79 = 121;
    const SUBBLOCK = 122;
    const TERMINATOR = 123;
}

namespace \Rar;

class Oses {
    const MS_DOS = 0;
    const OS_2 = 1;
    const WINDOWS = 2;
    const UNIX = 3;
    const MAC_OS = 4;
    const BEOS = 5;
}

namespace \Rar;

class Methods {
    const STORE = 48;
    const FASTEST = 49;
    const FAST = 50;
    const NORMAL = 51;
    const GOOD = 52;
    const BEST = 53;
}
