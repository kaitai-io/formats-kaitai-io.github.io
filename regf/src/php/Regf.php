<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * This spec allows to parse files used by Microsoft Windows family of
 * operating systems to store parts of its "registry". "Registry" is a
 * hierarchical database that is used to store system settings (global
 * configuration, per-user, per-application configuration, etc).
 * 
 * Typically, registry files are stored in:
 * 
 * * System-wide: several files in `%SystemRoot%\System32\Config\`
 * * User-wide:
 *   * `%USERPROFILE%\Ntuser.dat`
 *   * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
 *   * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
 * 
 * Note that one typically can't access files directly on a mounted
 * filesystem with a running Windows OS.
 */

class Regf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Regf\FileHeader($this->_io, $this, $this->_root);
        $this->_m__raw_hiveBins = [];
        $this->_m_hiveBins = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m__raw_hiveBins[] = $this->_io->readBytes(4096);
            $_io__raw_hiveBins = new \Kaitai\Struct\Stream(end($this->_m__raw_hiveBins));
            $this->_m_hiveBins[] = new \Regf\HiveBin($_io__raw_hiveBins, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_header;
    protected $_m_hiveBins;
    protected $_m__raw_hiveBins;
    public function header() { return $this->_m_header; }
    public function hiveBins() { return $this->_m_hiveBins; }
    public function _raw_hiveBins() { return $this->_m__raw_hiveBins; }
}

namespace \Regf;

class Filetime extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_value = $this->_io->readU8le();
    }
    protected $_m_value;
    public function value() { return $this->_m_value; }
}

namespace \Regf;

class HiveBin extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Regf\HiveBinHeader($this->_io, $this, $this->_root);
        $this->_m_cells = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_cells[] = new \Regf\HiveBinCell($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_header;
    protected $_m_cells;
    public function header() { return $this->_m_header; }
    public function cells() { return $this->_m_cells; }
}

namespace \Regf;

class HiveBinHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBin $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\x68\x62\x69\x6E");
        $this->_m_offset = $this->_io->readU4le();
        $this->_m_size = $this->_io->readU4le();
        $this->_m_unknown1 = $this->_io->readU4le();
        $this->_m_unknown2 = $this->_io->readU4le();
        $this->_m_timestamp = new \Regf\Filetime($this->_io, $this, $this->_root);
        $this->_m_unknown4 = $this->_io->readU4le();
    }
    protected $_m_signature;
    protected $_m_offset;
    protected $_m_size;
    protected $_m_unknown1;
    protected $_m_unknown2;
    protected $_m_timestamp;
    protected $_m_unknown4;
    public function signature() { return $this->_m_signature; }

    /**
     * The offset of the hive bin, Value in bytes and relative from
     * the start of the hive bin data
     */
    public function offset() { return $this->_m_offset; }

    /**
     * Size of the hive bin
     */
    public function size() { return $this->_m_size; }

    /**
     * 0 most of the time, can contain remnant data
     */
    public function unknown1() { return $this->_m_unknown1; }

    /**
     * 0 most of the time, can contain remnant data
     */
    public function unknown2() { return $this->_m_unknown2; }

    /**
     * Only the root (first) hive bin seems to contain a valid FILETIME
     */
    public function timestamp() { return $this->_m_timestamp; }

    /**
     * Contains number of bytes
     */
    public function unknown4() { return $this->_m_unknown4; }
}

namespace \Regf;

class HiveBinCell extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBin $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_cellSizeRaw = $this->_io->readS4le();
        $this->_m_identifier = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "ascii");
        switch ($this->identifier()) {
            case "li":
                $this->_m__raw_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Regf\HiveBinCell\SubKeyListLi($_io__raw_data, $this, $this->_root);
                break;
            case "vk":
                $this->_m__raw_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Regf\HiveBinCell\SubKeyListVk($_io__raw_data, $this, $this->_root);
                break;
            case "lf":
                $this->_m__raw_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Regf\HiveBinCell\SubKeyListLhLf($_io__raw_data, $this, $this->_root);
                break;
            case "ri":
                $this->_m__raw_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Regf\HiveBinCell\SubKeyListRi($_io__raw_data, $this, $this->_root);
                break;
            case "lh":
                $this->_m__raw_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Regf\HiveBinCell\SubKeyListLhLf($_io__raw_data, $this, $this->_root);
                break;
            case "nk":
                $this->_m__raw_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Regf\HiveBinCell\NamedKey($_io__raw_data, $this, $this->_root);
                break;
            case "sk":
                $this->_m__raw_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Regf\HiveBinCell\SubKeyListSk($_io__raw_data, $this, $this->_root);
                break;
            default:
                $this->_m_data = $this->_io->readBytes((($this->cellSize() - 2) - 4));
                break;
        }
    }
    protected $_m_cellSize;
    public function cellSize() {
        if ($this->_m_cellSize !== null)
            return $this->_m_cellSize;
        $this->_m_cellSize = (($this->cellSizeRaw() < 0 ? -1 : 1) * $this->cellSizeRaw());
        return $this->_m_cellSize;
    }
    protected $_m_isAllocated;
    public function isAllocated() {
        if ($this->_m_isAllocated !== null)
            return $this->_m_isAllocated;
        $this->_m_isAllocated = $this->cellSizeRaw() < 0;
        return $this->_m_isAllocated;
    }
    protected $_m_cellSizeRaw;
    protected $_m_identifier;
    protected $_m_data;
    protected $_m__raw_data;
    public function cellSizeRaw() { return $this->_m_cellSizeRaw; }
    public function identifier() { return $this->_m_identifier; }
    public function data() { return $this->_m_data; }
    public function _raw_data() { return $this->_m__raw_data; }
}

namespace \Regf\HiveBinCell;

class SubKeyListVk extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_valueNameSize = $this->_io->readU2le();
        $this->_m_dataSize = $this->_io->readU4le();
        $this->_m_dataOffset = $this->_io->readU4le();
        $this->_m_dataType = $this->_io->readU4le();
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_padding = $this->_io->readU2le();
        if ($this->flags() == \Regf\HiveBinCell\SubKeyListVk\VkFlags::VALUE_COMP_NAME) {
            $this->_m_valueName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->valueNameSize()), "ascii");
        }
    }
    protected $_m_valueNameSize;
    protected $_m_dataSize;
    protected $_m_dataOffset;
    protected $_m_dataType;
    protected $_m_flags;
    protected $_m_padding;
    protected $_m_valueName;
    public function valueNameSize() { return $this->_m_valueNameSize; }
    public function dataSize() { return $this->_m_dataSize; }
    public function dataOffset() { return $this->_m_dataOffset; }
    public function dataType() { return $this->_m_dataType; }
    public function flags() { return $this->_m_flags; }
    public function padding() { return $this->_m_padding; }
    public function valueName() { return $this->_m_valueName; }
}

namespace \Regf\HiveBinCell\SubKeyListVk;

class DataTypeEnum {
    const REG_NONE = 0;
    const REG_SZ = 1;
    const REG_EXPAND_SZ = 2;
    const REG_BINARY = 3;
    const REG_DWORD = 4;
    const REG_DWORD_BIG_ENDIAN = 5;
    const REG_LINK = 6;
    const REG_MULTI_SZ = 7;
    const REG_RESOURCE_LIST = 8;
    const REG_FULL_RESOURCE_DESCRIPTOR = 9;
    const REG_RESOURCE_REQUIREMENTS_LIST = 10;
    const REG_QWORD = 11;
}

namespace \Regf\HiveBinCell\SubKeyListVk;

class VkFlags {
    const VALUE_COMP_NAME = 1;
}

namespace \Regf\HiveBinCell;

class SubKeyListLhLf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_count = $this->_io->readU2le();
        $this->_m_items = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_items[] = new \Regf\HiveBinCell\SubKeyListLhLf\Item($this->_io, $this, $this->_root);
        }
    }
    protected $_m_count;
    protected $_m_items;
    public function count() { return $this->_m_count; }
    public function items() { return $this->_m_items; }
}

namespace \Regf\HiveBinCell\SubKeyListLhLf;

class Item extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell\SubKeyListLhLf $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_namedKeyOffset = $this->_io->readU4le();
        $this->_m_hashValue = $this->_io->readU4le();
    }
    protected $_m_namedKeyOffset;
    protected $_m_hashValue;
    public function namedKeyOffset() { return $this->_m_namedKeyOffset; }
    public function hashValue() { return $this->_m_hashValue; }
}

namespace \Regf\HiveBinCell;

class SubKeyListSk extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_unknown1 = $this->_io->readU2le();
        $this->_m_previousSecurityKeyOffset = $this->_io->readU4le();
        $this->_m_nextSecurityKeyOffset = $this->_io->readU4le();
        $this->_m_referenceCount = $this->_io->readU4le();
    }
    protected $_m_unknown1;
    protected $_m_previousSecurityKeyOffset;
    protected $_m_nextSecurityKeyOffset;
    protected $_m_referenceCount;
    public function unknown1() { return $this->_m_unknown1; }
    public function previousSecurityKeyOffset() { return $this->_m_previousSecurityKeyOffset; }
    public function nextSecurityKeyOffset() { return $this->_m_nextSecurityKeyOffset; }
    public function referenceCount() { return $this->_m_referenceCount; }
}

namespace \Regf\HiveBinCell;

class SubKeyListLi extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_count = $this->_io->readU2le();
        $this->_m_items = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_items[] = new \Regf\HiveBinCell\SubKeyListLi\Item($this->_io, $this, $this->_root);
        }
    }
    protected $_m_count;
    protected $_m_items;
    public function count() { return $this->_m_count; }
    public function items() { return $this->_m_items; }
}

namespace \Regf\HiveBinCell\SubKeyListLi;

class Item extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell\SubKeyListLi $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_namedKeyOffset = $this->_io->readU4le();
    }
    protected $_m_namedKeyOffset;
    public function namedKeyOffset() { return $this->_m_namedKeyOffset; }
}

namespace \Regf\HiveBinCell;

class NamedKey extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = $this->_io->readU2le();
        $this->_m_lastKeyWrittenDateAndTime = new \Regf\Filetime($this->_io, $this, $this->_root);
        $this->_m_unknown1 = $this->_io->readU4le();
        $this->_m_parentKeyOffset = $this->_io->readU4le();
        $this->_m_numberOfSubKeys = $this->_io->readU4le();
        $this->_m_numberOfVolatileSubKeys = $this->_io->readU4le();
        $this->_m_subKeysListOffset = $this->_io->readU4le();
        $this->_m_numberOfValues = $this->_io->readU4le();
        $this->_m_valuesListOffset = $this->_io->readU4le();
        $this->_m_securityKeyOffset = $this->_io->readU4le();
        $this->_m_classNameOffset = $this->_io->readU4le();
        $this->_m_largestSubKeyNameSize = $this->_io->readU4le();
        $this->_m_largestSubKeyClassNameSize = $this->_io->readU4le();
        $this->_m_largestValueNameSize = $this->_io->readU4le();
        $this->_m_largestValueDataSize = $this->_io->readU4le();
        $this->_m_unknown2 = $this->_io->readU4le();
        $this->_m_keyNameSize = $this->_io->readU2le();
        $this->_m_classNameSize = $this->_io->readU2le();
        $this->_m_unknownStringSize = $this->_io->readU4le();
        $this->_m_unknownString = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->unknownStringSize()), "ascii");
    }
    protected $_m_flags;
    protected $_m_lastKeyWrittenDateAndTime;
    protected $_m_unknown1;
    protected $_m_parentKeyOffset;
    protected $_m_numberOfSubKeys;
    protected $_m_numberOfVolatileSubKeys;
    protected $_m_subKeysListOffset;
    protected $_m_numberOfValues;
    protected $_m_valuesListOffset;
    protected $_m_securityKeyOffset;
    protected $_m_classNameOffset;
    protected $_m_largestSubKeyNameSize;
    protected $_m_largestSubKeyClassNameSize;
    protected $_m_largestValueNameSize;
    protected $_m_largestValueDataSize;
    protected $_m_unknown2;
    protected $_m_keyNameSize;
    protected $_m_classNameSize;
    protected $_m_unknownStringSize;
    protected $_m_unknownString;
    public function flags() { return $this->_m_flags; }
    public function lastKeyWrittenDateAndTime() { return $this->_m_lastKeyWrittenDateAndTime; }
    public function unknown1() { return $this->_m_unknown1; }
    public function parentKeyOffset() { return $this->_m_parentKeyOffset; }
    public function numberOfSubKeys() { return $this->_m_numberOfSubKeys; }
    public function numberOfVolatileSubKeys() { return $this->_m_numberOfVolatileSubKeys; }
    public function subKeysListOffset() { return $this->_m_subKeysListOffset; }
    public function numberOfValues() { return $this->_m_numberOfValues; }
    public function valuesListOffset() { return $this->_m_valuesListOffset; }
    public function securityKeyOffset() { return $this->_m_securityKeyOffset; }
    public function classNameOffset() { return $this->_m_classNameOffset; }
    public function largestSubKeyNameSize() { return $this->_m_largestSubKeyNameSize; }
    public function largestSubKeyClassNameSize() { return $this->_m_largestSubKeyClassNameSize; }
    public function largestValueNameSize() { return $this->_m_largestValueNameSize; }
    public function largestValueDataSize() { return $this->_m_largestValueDataSize; }
    public function unknown2() { return $this->_m_unknown2; }
    public function keyNameSize() { return $this->_m_keyNameSize; }
    public function classNameSize() { return $this->_m_classNameSize; }
    public function unknownStringSize() { return $this->_m_unknownStringSize; }
    public function unknownString() { return $this->_m_unknownString; }
}

namespace \Regf\HiveBinCell\NamedKey;

class NkFlags {
    const KEY_IS_VOLATILE = 1;
    const KEY_HIVE_EXIT = 2;
    const KEY_HIVE_ENTRY = 4;
    const KEY_NO_DELETE = 8;
    const KEY_SYM_LINK = 16;
    const KEY_COMP_NAME = 32;
    const KEY_PREFEF_HANDLE = 64;
    const KEY_VIRT_MIRRORED = 128;
    const KEY_VIRT_TARGET = 256;
    const KEY_VIRTUAL_STORE = 512;
    const UNKNOWN1 = 4096;
    const UNKNOWN2 = 16384;
}

namespace \Regf\HiveBinCell;

class SubKeyListRi extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_count = $this->_io->readU2le();
        $this->_m_items = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_items[] = new \Regf\HiveBinCell\SubKeyListRi\Item($this->_io, $this, $this->_root);
        }
    }
    protected $_m_count;
    protected $_m_items;
    public function count() { return $this->_m_count; }
    public function items() { return $this->_m_items; }
}

namespace \Regf\HiveBinCell\SubKeyListRi;

class Item extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf\HiveBinCell\SubKeyListRi $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_subKeyListOffset = $this->_io->readU4le();
    }
    protected $_m_subKeyListOffset;
    public function subKeyListOffset() { return $this->_m_subKeyListOffset; }
}

namespace \Regf;

class FileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Regf $_parent = null, \Regf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\x72\x65\x67\x66");
        $this->_m_primarySequenceNumber = $this->_io->readU4le();
        $this->_m_secondarySequenceNumber = $this->_io->readU4le();
        $this->_m_lastModificationDateAndTime = new \Regf\Filetime($this->_io, $this, $this->_root);
        $this->_m_majorVersion = $this->_io->readU4le();
        $this->_m_minorVersion = $this->_io->readU4le();
        $this->_m_type = $this->_io->readU4le();
        $this->_m_format = $this->_io->readU4le();
        $this->_m_rootKeyOffset = $this->_io->readU4le();
        $this->_m_hiveBinsDataSize = $this->_io->readU4le();
        $this->_m_clusteringFactor = $this->_io->readU4le();
        $this->_m_unknown1 = $this->_io->readBytes(64);
        $this->_m_unknown2 = $this->_io->readBytes(396);
        $this->_m_checksum = $this->_io->readU4le();
        $this->_m_reserved = $this->_io->readBytes(3576);
        $this->_m_bootType = $this->_io->readU4le();
        $this->_m_bootRecover = $this->_io->readU4le();
    }
    protected $_m_signature;
    protected $_m_primarySequenceNumber;
    protected $_m_secondarySequenceNumber;
    protected $_m_lastModificationDateAndTime;
    protected $_m_majorVersion;
    protected $_m_minorVersion;
    protected $_m_type;
    protected $_m_format;
    protected $_m_rootKeyOffset;
    protected $_m_hiveBinsDataSize;
    protected $_m_clusteringFactor;
    protected $_m_unknown1;
    protected $_m_unknown2;
    protected $_m_checksum;
    protected $_m_reserved;
    protected $_m_bootType;
    protected $_m_bootRecover;
    public function signature() { return $this->_m_signature; }
    public function primarySequenceNumber() { return $this->_m_primarySequenceNumber; }
    public function secondarySequenceNumber() { return $this->_m_secondarySequenceNumber; }
    public function lastModificationDateAndTime() { return $this->_m_lastModificationDateAndTime; }
    public function majorVersion() { return $this->_m_majorVersion; }
    public function minorVersion() { return $this->_m_minorVersion; }
    public function type() { return $this->_m_type; }
    public function format() { return $this->_m_format; }
    public function rootKeyOffset() { return $this->_m_rootKeyOffset; }
    public function hiveBinsDataSize() { return $this->_m_hiveBinsDataSize; }
    public function clusteringFactor() { return $this->_m_clusteringFactor; }
    public function unknown1() { return $this->_m_unknown1; }
    public function unknown2() { return $this->_m_unknown2; }
    public function checksum() { return $this->_m_checksum; }
    public function reserved() { return $this->_m_reserved; }
    public function bootType() { return $this->_m_bootType; }
    public function bootRecover() { return $this->_m_bootRecover; }
}

namespace \Regf\FileHeader;

class FileType {
    const NORMAL = 0;
    const TRANSACTION_LOG = 1;
}

namespace \Regf\FileHeader;

class FileFormat {
    const DIRECT_MEMORY_LOAD = 1;
}
