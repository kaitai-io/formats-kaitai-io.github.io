<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * AppleSingle and AppleDouble files are used by certain Mac
 * applications (e.g. Finder) to store Mac-specific file attributes on
 * filesystems that do not support that.
 * 
 * Syntactically, both formats are the same, the only difference is how
 * they are being used:
 * 
 * * AppleSingle means that only one file will be created on external
 *   filesystem that will hold both the data (AKA "data fork" in Apple
 *   terminology), and the attributes (AKA "resource fork").
 * * AppleDouble means that two files will be created: a normal file
 *   that keeps the data ("data fork") is kept separately from an
 *   auxiliary file that contains attributes ("resource fork"), which
 *   is kept with the same name, but starting with an extra dot and
 *   underscore `._` to keep it hidden.
 * 
 * In modern practice (Mac OS X), Finder only uses AppleDouble to keep
 * compatibility with other OSes, as virtually nobody outside of Mac
 * understands how to access data in AppleSingle container.
 */

class AppleSingleDouble extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AppleSingleDouble $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->readU4be();
        $this->_m_version = $this->_io->readU4be();
        $this->_m_reserved = $this->_io->readBytes(16);
        $this->_m_numEntries = $this->_io->readU2be();
        $this->_m_entries = [];
        $n = $this->numEntries();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_entries[] = new \AppleSingleDouble\Entry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_magic;
    protected $_m_version;
    protected $_m_reserved;
    protected $_m_numEntries;
    protected $_m_entries;
    public function magic() { return $this->_m_magic; }
    public function version() { return $this->_m_version; }

    /**
     * Must be all 0.
     */
    public function reserved() { return $this->_m_reserved; }
    public function numEntries() { return $this->_m_numEntries; }
    public function entries() { return $this->_m_entries; }
}

namespace \AppleSingleDouble;

class Entry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleSingleDouble $_parent = null, \AppleSingleDouble $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU4be();
        $this->_m_ofsBody = $this->_io->readU4be();
        $this->_m_lenBody = $this->_io->readU4be();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->ofsBody());
        switch ($this->type()) {
            case \AppleSingleDouble\Entry\Types::FINDER_INFO:
                $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \AppleSingleDouble\FinderInfo($_io__raw_body, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->lenBody());
                break;
        }
        $this->_io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_type;
    protected $_m_ofsBody;
    protected $_m_lenBody;
    protected $_m__raw_body;
    public function type() { return $this->_m_type; }
    public function ofsBody() { return $this->_m_ofsBody; }
    public function lenBody() { return $this->_m_lenBody; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \AppleSingleDouble\Entry;

class Types {
    const DATA_FORK = 1;
    const RESOURCE_FORK = 2;

    /**
     * File name on a file system that supports all the attributes.
     */
    const REAL_NAME = 3;
    const COMMENT = 4;
    const ICON_BW = 5;
    const ICON_COLOR = 6;

    /**
     * File creation, modification, access date/timestamps.
     */
    const FILE_DATES_INFO = 8;
    const FINDER_INFO = 9;
    const MACINTOSH_FILE_INFO = 10;
    const PRODOS_FILE_INFO = 11;
    const MSDOS_FILE_INFO = 12;
    const AFP_SHORT_NAME = 13;
    const AFP_FILE_INFO = 14;
    const AFP_DIRECTORY_ID = 15;
}

/**
 * Information specific to Finder
 */

namespace \AppleSingleDouble;

class FinderInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleSingleDouble\Entry $_parent = null, \AppleSingleDouble $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fileType = $this->_io->readBytes(4);
        $this->_m_fileCreator = $this->_io->readBytes(4);
        $this->_m_flags = $this->_io->readU2be();
        $this->_m_location = new \AppleSingleDouble\Point($this->_io, $this, $this->_root);
        $this->_m_folderId = $this->_io->readU2be();
    }
    protected $_m_fileType;
    protected $_m_fileCreator;
    protected $_m_flags;
    protected $_m_location;
    protected $_m_folderId;
    public function fileType() { return $this->_m_fileType; }
    public function fileCreator() { return $this->_m_fileCreator; }
    public function flags() { return $this->_m_flags; }

    /**
     * File icon's coordinates when displaying this folder.
     */
    public function location() { return $this->_m_location; }

    /**
     * File folder ID (=window).
     */
    public function folderId() { return $this->_m_folderId; }
}

/**
 * Specifies 2D coordinate in QuickDraw grid.
 */

namespace \AppleSingleDouble;

class Point extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \AppleSingleDouble\FinderInfo $_parent = null, \AppleSingleDouble $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readU2be();
        $this->_m_y = $this->_io->readU2be();
    }
    protected $_m_x;
    protected $_m_y;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
}

namespace \AppleSingleDouble;

class FileType {
    const APPLE_SINGLE = 333312;
    const APPLE_DOUBLE = 333319;
}
