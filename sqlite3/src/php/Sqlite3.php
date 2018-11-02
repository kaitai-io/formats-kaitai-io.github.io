<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * SQLite3 is a popular serverless SQL engine, implemented as a library
 * to be used within other applications. It keeps its databases as
 * regular disk files.
 * 
 * Every database file is segmented into pages. First page (starting at
 * the very beginning) is special: it contains a file-global header
 * which specifies some data relevant to proper parsing (i.e. format
 * versions, size of page, etc). After the header, normal contents of
 * the first page follow.
 * 
 * Each page would be of some type, and generally, they would be
 * reached via the links starting from the first page. First page type
 * (`root_page`) is always "btree_page".
 */

class Sqlite3 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x53\x51\x4C\x69\x74\x65\x20\x66\x6F\x72\x6D\x61\x74\x20\x33\x00");
        $this->_m_lenPageMod = $this->_io->readU2be();
        $this->_m_writeVersion = $this->_io->readU1();
        $this->_m_readVersion = $this->_io->readU1();
        $this->_m_reservedSpace = $this->_io->readU1();
        $this->_m_maxPayloadFrac = $this->_io->readU1();
        $this->_m_minPayloadFrac = $this->_io->readU1();
        $this->_m_leafPayloadFrac = $this->_io->readU1();
        $this->_m_fileChangeCounter = $this->_io->readU4be();
        $this->_m_numPages = $this->_io->readU4be();
        $this->_m_firstFreelistTrunkPage = $this->_io->readU4be();
        $this->_m_numFreelistPages = $this->_io->readU4be();
        $this->_m_schemaCookie = $this->_io->readU4be();
        $this->_m_schemaFormat = $this->_io->readU4be();
        $this->_m_defPageCacheSize = $this->_io->readU4be();
        $this->_m_largestRootPage = $this->_io->readU4be();
        $this->_m_textEncoding = $this->_io->readU4be();
        $this->_m_userVersion = $this->_io->readU4be();
        $this->_m_isIncrementalVacuum = $this->_io->readU4be();
        $this->_m_applicationId = $this->_io->readU4be();
        $this->_m_reserved = $this->_io->readBytes(20);
        $this->_m_versionValidFor = $this->_io->readU4be();
        $this->_m_sqliteVersionNumber = $this->_io->readU4be();
        $this->_m_rootPage = new \Sqlite3\BtreePage($this->_io, $this, $this->_root);
    }
    protected $_m_lenPage;
    public function lenPage() {
        if ($this->_m_lenPage !== null)
            return $this->_m_lenPage;
        $this->_m_lenPage = ($this->lenPageMod() == 1 ? 65536 : $this->lenPageMod());
        return $this->_m_lenPage;
    }
    protected $_m_magic;
    protected $_m_lenPageMod;
    protected $_m_writeVersion;
    protected $_m_readVersion;
    protected $_m_reservedSpace;
    protected $_m_maxPayloadFrac;
    protected $_m_minPayloadFrac;
    protected $_m_leafPayloadFrac;
    protected $_m_fileChangeCounter;
    protected $_m_numPages;
    protected $_m_firstFreelistTrunkPage;
    protected $_m_numFreelistPages;
    protected $_m_schemaCookie;
    protected $_m_schemaFormat;
    protected $_m_defPageCacheSize;
    protected $_m_largestRootPage;
    protected $_m_textEncoding;
    protected $_m_userVersion;
    protected $_m_isIncrementalVacuum;
    protected $_m_applicationId;
    protected $_m_reserved;
    protected $_m_versionValidFor;
    protected $_m_sqliteVersionNumber;
    protected $_m_rootPage;
    public function magic() { return $this->_m_magic; }

    /**
     * The database page size in bytes. Must be a power of two between
     * 512 and 32768 inclusive, or the value 1 representing a page size
     * of 65536.
     */
    public function lenPageMod() { return $this->_m_lenPageMod; }
    public function writeVersion() { return $this->_m_writeVersion; }
    public function readVersion() { return $this->_m_readVersion; }

    /**
     * Bytes of unused "reserved" space at the end of each page. Usually 0.
     */
    public function reservedSpace() { return $this->_m_reservedSpace; }

    /**
     * Maximum embedded payload fraction. Must be 64.
     */
    public function maxPayloadFrac() { return $this->_m_maxPayloadFrac; }

    /**
     * Minimum embedded payload fraction. Must be 32.
     */
    public function minPayloadFrac() { return $this->_m_minPayloadFrac; }

    /**
     * Leaf payload fraction. Must be 32.
     */
    public function leafPayloadFrac() { return $this->_m_leafPayloadFrac; }
    public function fileChangeCounter() { return $this->_m_fileChangeCounter; }

    /**
     * Size of the database file in pages. The "in-header database size".
     */
    public function numPages() { return $this->_m_numPages; }

    /**
     * Page number of the first freelist trunk page.
     */
    public function firstFreelistTrunkPage() { return $this->_m_firstFreelistTrunkPage; }

    /**
     * Total number of freelist pages.
     */
    public function numFreelistPages() { return $this->_m_numFreelistPages; }
    public function schemaCookie() { return $this->_m_schemaCookie; }

    /**
     * The schema format number. Supported schema formats are 1, 2, 3, and 4.
     */
    public function schemaFormat() { return $this->_m_schemaFormat; }

    /**
     * Default page cache size.
     */
    public function defPageCacheSize() { return $this->_m_defPageCacheSize; }

    /**
     * The page number of the largest root b-tree page when in auto-vacuum or incremental-vacuum modes, or zero otherwise.
     */
    public function largestRootPage() { return $this->_m_largestRootPage; }

    /**
     * The database text encoding. A value of 1 means UTF-8. A value of 2 means UTF-16le. A value of 3 means UTF-16be.
     */
    public function textEncoding() { return $this->_m_textEncoding; }

    /**
     * The "user version" as read and set by the user_version pragma.
     */
    public function userVersion() { return $this->_m_userVersion; }

    /**
     * True (non-zero) for incremental-vacuum mode. False (zero) otherwise.
     */
    public function isIncrementalVacuum() { return $this->_m_isIncrementalVacuum; }

    /**
     * The "Application ID" set by PRAGMA application_id.
     */
    public function applicationId() { return $this->_m_applicationId; }
    public function reserved() { return $this->_m_reserved; }
    public function versionValidFor() { return $this->_m_versionValidFor; }
    public function sqliteVersionNumber() { return $this->_m_sqliteVersionNumber; }
    public function rootPage() { return $this->_m_rootPage; }
}

namespace \Sqlite3;

class Serial extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = new \VlqBase128Be($this->_io);
    }
    protected $_m_isBlob;
    public function isBlob() {
        if ($this->_m_isBlob !== null)
            return $this->_m_isBlob;
        $this->_m_isBlob =  (($this->code()->value() >= 12) && (\Kaitai\Struct\Stream::mod($this->code()->value(), 2) == 0)) ;
        return $this->_m_isBlob;
    }
    protected $_m_isString;
    public function isString() {
        if ($this->_m_isString !== null)
            return $this->_m_isString;
        $this->_m_isString =  (($this->code()->value() >= 13) && (\Kaitai\Struct\Stream::mod($this->code()->value(), 2) == 1)) ;
        return $this->_m_isString;
    }
    protected $_m_lenContent;
    public function lenContent() {
        if ($this->_m_lenContent !== null)
            return $this->_m_lenContent;
        if ($this->code()->value() >= 12) {
            $this->_m_lenContent = intval(($this->code()->value() - 12) / 2);
        }
        return $this->_m_lenContent;
    }
    protected $_m_code;
    public function code() { return $this->_m_code; }
}

namespace \Sqlite3;

class BtreePage extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Sqlite3 $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_pageType = $this->_io->readU1();
        $this->_m_firstFreeblock = $this->_io->readU2be();
        $this->_m_numCells = $this->_io->readU2be();
        $this->_m_ofsCells = $this->_io->readU2be();
        $this->_m_numFragFreeBytes = $this->_io->readU1();
        if ( (($this->pageType() == 2) || ($this->pageType() == 5)) ) {
            $this->_m_rightPtr = $this->_io->readU4be();
        }
        $this->_m_cells = [];
        $n = $this->numCells();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_cells[] = new \Sqlite3\RefCell($this->_io, $this, $this->_root);
        }
    }
    protected $_m_pageType;
    protected $_m_firstFreeblock;
    protected $_m_numCells;
    protected $_m_ofsCells;
    protected $_m_numFragFreeBytes;
    protected $_m_rightPtr;
    protected $_m_cells;
    public function pageType() { return $this->_m_pageType; }
    public function firstFreeblock() { return $this->_m_firstFreeblock; }
    public function numCells() { return $this->_m_numCells; }
    public function ofsCells() { return $this->_m_ofsCells; }
    public function numFragFreeBytes() { return $this->_m_numFragFreeBytes; }
    public function rightPtr() { return $this->_m_rightPtr; }
    public function cells() { return $this->_m_cells; }
}

namespace \Sqlite3;

class CellIndexLeaf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Sqlite3\RefCell $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenPayload = new \VlqBase128Be($this->_io);
        $this->_m__raw_payload = $this->_io->readBytes($this->lenPayload()->value());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
        $this->_m_payload = new \Sqlite3\CellPayload($io, $this, $this->_root);
    }
    protected $_m_lenPayload;
    protected $_m_payload;
    protected $_m__raw_payload;
    public function lenPayload() { return $this->_m_lenPayload; }
    public function payload() { return $this->_m_payload; }
    public function _raw_payload() { return $this->_m__raw_payload; }
}

namespace \Sqlite3;

class Serials extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Sqlite3\CellPayload $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \VlqBase128Be($this->_io);
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Sqlite3;

class CellTableLeaf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Sqlite3\RefCell $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenPayload = new \VlqBase128Be($this->_io);
        $this->_m_rowId = new \VlqBase128Be($this->_io);
        $this->_m__raw_payload = $this->_io->readBytes($this->lenPayload()->value());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
        $this->_m_payload = new \Sqlite3\CellPayload($io, $this, $this->_root);
    }
    protected $_m_lenPayload;
    protected $_m_rowId;
    protected $_m_payload;
    protected $_m__raw_payload;
    public function lenPayload() { return $this->_m_lenPayload; }
    public function rowId() { return $this->_m_rowId; }
    public function payload() { return $this->_m_payload; }
    public function _raw_payload() { return $this->_m__raw_payload; }
}

namespace \Sqlite3;

class CellPayload extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenHeaderAndLen = new \VlqBase128Be($this->_io);
        $this->_m__raw_columnSerials = $this->_io->readBytes(($this->lenHeaderAndLen()->value() - 1));
        $io = new \Kaitai\Struct\Stream($this->_m__raw_columnSerials);
        $this->_m_columnSerials = new \Sqlite3\Serials($io, $this, $this->_root);
        $this->_m_columnContents = [];
        $n = count($this->columnSerials()->entries());
        for ($i = 0; $i < $n; $i++) {
            $this->_m_columnContents[] = new \Sqlite3\ColumnContent($this->columnSerials()->entries()[$i], $this->_io, $this, $this->_root);
        }
    }
    protected $_m_lenHeaderAndLen;
    protected $_m_columnSerials;
    protected $_m_columnContents;
    protected $_m__raw_columnSerials;
    public function lenHeaderAndLen() { return $this->_m_lenHeaderAndLen; }
    public function columnSerials() { return $this->_m_columnSerials; }
    public function columnContents() { return $this->_m_columnContents; }
    public function _raw_columnSerials() { return $this->_m__raw_columnSerials; }
}

namespace \Sqlite3;

class CellTableInterior extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Sqlite3\RefCell $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_leftChildPage = $this->_io->readU4be();
        $this->_m_rowId = new \VlqBase128Be($this->_io);
    }
    protected $_m_leftChildPage;
    protected $_m_rowId;
    public function leftChildPage() { return $this->_m_leftChildPage; }
    public function rowId() { return $this->_m_rowId; }
}

namespace \Sqlite3;

class CellIndexInterior extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Sqlite3\RefCell $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_leftChildPage = $this->_io->readU4be();
        $this->_m_lenPayload = new \VlqBase128Be($this->_io);
        $this->_m__raw_payload = $this->_io->readBytes($this->lenPayload()->value());
        $io = new \Kaitai\Struct\Stream($this->_m__raw_payload);
        $this->_m_payload = new \Sqlite3\CellPayload($io, $this, $this->_root);
    }
    protected $_m_leftChildPage;
    protected $_m_lenPayload;
    protected $_m_payload;
    protected $_m__raw_payload;
    public function leftChildPage() { return $this->_m_leftChildPage; }
    public function lenPayload() { return $this->_m_lenPayload; }
    public function payload() { return $this->_m_payload; }
    public function _raw_payload() { return $this->_m__raw_payload; }
}

namespace \Sqlite3;

class ColumnContent extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Struct $ser, \Kaitai\Struct\Stream $_io, \Sqlite3\CellPayload $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_ser = $ser;
        $this->_read();
    }

    private function _read() {
        if ( (($this->serialType()->code()->value() >= 1) && ($this->serialType()->code()->value() <= 6)) ) {
            switch ($this->serialType()->code()->value()) {
                case 4:
                    $this->_m_asInt = $this->_io->readU4be();
                    break;
                case 6:
                    $this->_m_asInt = $this->_io->readU8be();
                    break;
                case 1:
                    $this->_m_asInt = $this->_io->readU1();
                    break;
                case 3:
                    $this->_m_asInt = $this->_io->readBitsInt(24);
                    break;
                case 5:
                    $this->_m_asInt = $this->_io->readBitsInt(48);
                    break;
                case 2:
                    $this->_m_asInt = $this->_io->readU2be();
                    break;
            }
        }
        if ($this->serialType()->code()->value() == 7) {
            $this->_m_asFloat = $this->_io->readF8be();
        }
        if ($this->serialType()->isBlob()) {
            $this->_m_asBlob = $this->_io->readBytes($this->serialType()->lenContent());
        }
        $this->_m_asStr = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->serialType()->lenContent()), "UTF-8");
    }
    protected $_m_serialType;
    public function serialType() {
        if ($this->_m_serialType !== null)
            return $this->_m_serialType;
        $this->_m_serialType = $this->ser();
        return $this->_m_serialType;
    }
    protected $_m_asInt;
    protected $_m_asFloat;
    protected $_m_asBlob;
    protected $_m_asStr;
    protected $_m_ser;
    public function asInt() { return $this->_m_asInt; }
    public function asFloat() { return $this->_m_asFloat; }
    public function asBlob() { return $this->_m_asBlob; }
    public function asStr() { return $this->_m_asStr; }
    public function ser() { return $this->_m_ser; }
}

namespace \Sqlite3;

class RefCell extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Sqlite3\BtreePage $_parent = null, \Sqlite3 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_ofsBody = $this->_io->readU2be();
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->ofsBody());
        switch ($this->_parent()->pageType()) {
            case 13:
                $this->_m_body = new \Sqlite3\CellTableLeaf($this->_io, $this, $this->_root);
                break;
            case 5:
                $this->_m_body = new \Sqlite3\CellTableInterior($this->_io, $this, $this->_root);
                break;
            case 10:
                $this->_m_body = new \Sqlite3\CellIndexLeaf($this->_io, $this, $this->_root);
                break;
            case 2:
                $this->_m_body = new \Sqlite3\CellIndexInterior($this->_io, $this, $this->_root);
                break;
        }
        $this->_io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_ofsBody;
    public function ofsBody() { return $this->_m_ofsBody; }
}

namespace \Sqlite3;

class Versions {
    const LEGACY = 1;
    const WAL = 2;
}

namespace \Sqlite3;

class Encodings {
    const UTF_8 = 1;
    const UTF_16LE = 2;
    const UTF_16BE = 3;
}
