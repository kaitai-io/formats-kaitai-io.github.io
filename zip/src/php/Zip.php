<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * ZIP is a popular archive file format, introduced in 1989 by Phil Katz
 * and originally implemented in PKZIP utility by PKWARE.
 * 
 * Thanks to solid support of it in most desktop environments and
 * operating systems, and algorithms / specs availability in public
 * domain, it quickly became tool of choice for implementing file
 * containers.
 * 
 * For example, Java .jar files, OpenDocument, Office Open XML, EPUB files
 * are actually ZIP archives.
 */

namespace {
    class Zip extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sections = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_sections[] = new \Zip\PkSection($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_sections;
        public function sections() { return $this->_m_sections; }
    }
}

namespace Zip {
    class LocalFile extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\PkSection $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Zip\LocalFileHeader($this->_io, $this, $this->_root);
            $this->_m_body = $this->_io->readBytes($this->header()->lenBodyCompressed());
        }
        protected $_m_header;
        protected $_m_body;
        public function header() { return $this->_m_header; }
        public function body() { return $this->_m_body; }
    }
}

namespace Zip {
    class DataDescriptor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\PkSection $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_crc32 = $this->_io->readU4le();
            $this->_m_lenBodyCompressed = $this->_io->readU4le();
            $this->_m_lenBodyUncompressed = $this->_io->readU4le();
        }
        protected $_m_crc32;
        protected $_m_lenBodyCompressed;
        protected $_m_lenBodyUncompressed;
        public function crc32() { return $this->_m_crc32; }
        public function lenBodyCompressed() { return $this->_m_lenBodyCompressed; }
        public function lenBodyUncompressed() { return $this->_m_lenBodyUncompressed; }
    }
}

namespace Zip {
    class ExtraField extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\Extras $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_code = $this->_io->readU2le();
            $this->_m_lenBody = $this->_io->readU2le();
            switch ($this->code()) {
                case \Zip\ExtraCodes::NTFS:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Zip\ExtraField\Ntfs($_io__raw_body, $this, $this->_root);
                    break;
                case \Zip\ExtraCodes::EXTENDED_TIMESTAMP:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Zip\ExtraField\ExtendedTimestamp($_io__raw_body, $this, $this->_root);
                    break;
                case \Zip\ExtraCodes::INFOZIP_UNIX_VAR_SIZE:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Zip\ExtraField\InfozipUnixVarSize($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->lenBody());
                    break;
            }
        }
        protected $_m_code;
        protected $_m_lenBody;
        protected $_m_body;
        protected $_m__raw_body;
        public function code() { return $this->_m_code; }
        public function lenBody() { return $this->_m_lenBody; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Zip\ExtraField {
    class Ntfs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\ExtraField $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readU4le();
            $this->_m_attributes = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_attributes[] = new \Zip\ExtraField\Ntfs\Attribute($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_reserved;
        protected $_m_attributes;
        public function reserved() { return $this->_m_reserved; }
        public function attributes() { return $this->_m_attributes; }
    }
}

namespace Zip\ExtraField\Ntfs {
    class Attribute extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\ExtraField\Ntfs $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tag = $this->_io->readU2le();
            $this->_m_lenBody = $this->_io->readU2le();
            switch ($this->tag()) {
                case 1:
                    $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                    $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
                    $this->_m_body = new \Zip\ExtraField\Ntfs\Attribute1($_io__raw_body, $this, $this->_root);
                    break;
                default:
                    $this->_m_body = $this->_io->readBytes($this->lenBody());
                    break;
            }
        }
        protected $_m_tag;
        protected $_m_lenBody;
        protected $_m_body;
        protected $_m__raw_body;
        public function tag() { return $this->_m_tag; }
        public function lenBody() { return $this->_m_lenBody; }
        public function body() { return $this->_m_body; }
        public function _raw_body() { return $this->_m__raw_body; }
    }
}

namespace Zip\ExtraField\Ntfs {
    class Attribute1 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\ExtraField\Ntfs\Attribute $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lastModTime = $this->_io->readU8le();
            $this->_m_lastAccessTime = $this->_io->readU8le();
            $this->_m_creationTime = $this->_io->readU8le();
        }
        protected $_m_lastModTime;
        protected $_m_lastAccessTime;
        protected $_m_creationTime;
        public function lastModTime() { return $this->_m_lastModTime; }
        public function lastAccessTime() { return $this->_m_lastAccessTime; }
        public function creationTime() { return $this->_m_creationTime; }
    }
}

namespace Zip\ExtraField {
    class ExtendedTimestamp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\ExtraField $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_flags = $this->_io->readBytes(1);
            $_io__raw_flags = new \Kaitai\Struct\Stream($this->_m__raw_flags);
            $this->_m_flags = new \Zip\ExtraField\ExtendedTimestamp\InfoFlags($_io__raw_flags, $this, $this->_root);
            if ($this->flags()->hasModTime()) {
                $this->_m_modTime = $this->_io->readU4le();
            }
            if ($this->flags()->hasAccessTime()) {
                $this->_m_accessTime = $this->_io->readU4le();
            }
            if ($this->flags()->hasCreateTime()) {
                $this->_m_createTime = $this->_io->readU4le();
            }
        }
        protected $_m_flags;
        protected $_m_modTime;
        protected $_m_accessTime;
        protected $_m_createTime;
        protected $_m__raw_flags;
        public function flags() { return $this->_m_flags; }

        /**
         * Unix timestamp
         */
        public function modTime() { return $this->_m_modTime; }

        /**
         * Unix timestamp
         */
        public function accessTime() { return $this->_m_accessTime; }

        /**
         * Unix timestamp
         */
        public function createTime() { return $this->_m_createTime; }
        public function _raw_flags() { return $this->_m__raw_flags; }
    }
}

namespace Zip\ExtraField\ExtendedTimestamp {
    class InfoFlags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\ExtraField\ExtendedTimestamp $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_hasModTime = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_hasAccessTime = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_hasCreateTime = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_reserved = $this->_io->readBitsIntLe(5);
        }
        protected $_m_hasModTime;
        protected $_m_hasAccessTime;
        protected $_m_hasCreateTime;
        protected $_m_reserved;
        public function hasModTime() { return $this->_m_hasModTime; }
        public function hasAccessTime() { return $this->_m_hasAccessTime; }
        public function hasCreateTime() { return $this->_m_hasCreateTime; }
        public function reserved() { return $this->_m_reserved; }
    }
}

namespace Zip\ExtraField {
    class InfozipUnixVarSize extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\ExtraField $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU1();
            $this->_m_lenUid = $this->_io->readU1();
            $this->_m_uid = $this->_io->readBytes($this->lenUid());
            $this->_m_lenGid = $this->_io->readU1();
            $this->_m_gid = $this->_io->readBytes($this->lenGid());
        }
        protected $_m_version;
        protected $_m_lenUid;
        protected $_m_uid;
        protected $_m_lenGid;
        protected $_m_gid;

        /**
         * Version of this extra field, currently 1
         */
        public function version() { return $this->_m_version; }

        /**
         * Size of UID field
         */
        public function lenUid() { return $this->_m_lenUid; }

        /**
         * UID (User ID) for a file
         */
        public function uid() { return $this->_m_uid; }

        /**
         * Size of GID field
         */
        public function lenGid() { return $this->_m_lenGid; }

        /**
         * GID (Group ID) for a file
         */
        public function gid() { return $this->_m_gid; }
    }
}

namespace Zip {
    class CentralDirEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\PkSection $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_versionMadeBy = $this->_io->readU2le();
            $this->_m_versionNeededToExtract = $this->_io->readU2le();
            $this->_m_flags = $this->_io->readU2le();
            $this->_m_compressionMethod = $this->_io->readU2le();
            $this->_m__raw_fileModTime = $this->_io->readBytes(4);
            $_io__raw_fileModTime = new \Kaitai\Struct\Stream($this->_m__raw_fileModTime);
            $this->_m_fileModTime = new \DosDatetime($_io__raw_fileModTime);
            $this->_m_crc32 = $this->_io->readU4le();
            $this->_m_lenBodyCompressed = $this->_io->readU4le();
            $this->_m_lenBodyUncompressed = $this->_io->readU4le();
            $this->_m_lenFileName = $this->_io->readU2le();
            $this->_m_lenExtra = $this->_io->readU2le();
            $this->_m_lenComment = $this->_io->readU2le();
            $this->_m_diskNumberStart = $this->_io->readU2le();
            $this->_m_intFileAttr = $this->_io->readU2le();
            $this->_m_extFileAttr = $this->_io->readU4le();
            $this->_m_ofsLocalHeader = $this->_io->readS4le();
            $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenFileName()), "UTF-8");
            $this->_m__raw_extra = $this->_io->readBytes($this->lenExtra());
            $_io__raw_extra = new \Kaitai\Struct\Stream($this->_m__raw_extra);
            $this->_m_extra = new \Zip\Extras($_io__raw_extra, $this, $this->_root);
            $this->_m_comment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenComment()), "UTF-8");
        }
        protected $_m_localHeader;
        public function localHeader() {
            if ($this->_m_localHeader !== null)
                return $this->_m_localHeader;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsLocalHeader());
            $this->_m_localHeader = new \Zip\PkSection($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_localHeader;
        }
        protected $_m_versionMadeBy;
        protected $_m_versionNeededToExtract;
        protected $_m_flags;
        protected $_m_compressionMethod;
        protected $_m_fileModTime;
        protected $_m_crc32;
        protected $_m_lenBodyCompressed;
        protected $_m_lenBodyUncompressed;
        protected $_m_lenFileName;
        protected $_m_lenExtra;
        protected $_m_lenComment;
        protected $_m_diskNumberStart;
        protected $_m_intFileAttr;
        protected $_m_extFileAttr;
        protected $_m_ofsLocalHeader;
        protected $_m_fileName;
        protected $_m_extra;
        protected $_m_comment;
        protected $_m__raw_fileModTime;
        protected $_m__raw_extra;
        public function versionMadeBy() { return $this->_m_versionMadeBy; }
        public function versionNeededToExtract() { return $this->_m_versionNeededToExtract; }
        public function flags() { return $this->_m_flags; }
        public function compressionMethod() { return $this->_m_compressionMethod; }
        public function fileModTime() { return $this->_m_fileModTime; }
        public function crc32() { return $this->_m_crc32; }
        public function lenBodyCompressed() { return $this->_m_lenBodyCompressed; }
        public function lenBodyUncompressed() { return $this->_m_lenBodyUncompressed; }
        public function lenFileName() { return $this->_m_lenFileName; }
        public function lenExtra() { return $this->_m_lenExtra; }
        public function lenComment() { return $this->_m_lenComment; }
        public function diskNumberStart() { return $this->_m_diskNumberStart; }
        public function intFileAttr() { return $this->_m_intFileAttr; }
        public function extFileAttr() { return $this->_m_extFileAttr; }
        public function ofsLocalHeader() { return $this->_m_ofsLocalHeader; }
        public function fileName() { return $this->_m_fileName; }
        public function extra() { return $this->_m_extra; }
        public function comment() { return $this->_m_comment; }
        public function _raw_fileModTime() { return $this->_m__raw_fileModTime; }
        public function _raw_extra() { return $this->_m__raw_extra; }
    }
}

namespace Zip {
    class PkSection extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(2);
            if (!($this->magic() == "\x50\x4B")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x50\x4B", $this->magic(), $this->_io(), "/types/pk_section/seq/0");
            }
            $this->_m_sectionType = $this->_io->readU2le();
            switch ($this->sectionType()) {
                case 513:
                    $this->_m_body = new \Zip\CentralDirEntry($this->_io, $this, $this->_root);
                    break;
                case 1027:
                    $this->_m_body = new \Zip\LocalFile($this->_io, $this, $this->_root);
                    break;
                case 1541:
                    $this->_m_body = new \Zip\EndOfCentralDir($this->_io, $this, $this->_root);
                    break;
                case 2055:
                    $this->_m_body = new \Zip\DataDescriptor($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_magic;
        protected $_m_sectionType;
        protected $_m_body;
        public function magic() { return $this->_m_magic; }
        public function sectionType() { return $this->_m_sectionType; }
        public function body() { return $this->_m_body; }
    }
}

namespace Zip {
    class Extras extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Zip\ExtraField($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Zip {
    class LocalFileHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\LocalFile $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_version = $this->_io->readU2le();
            $this->_m__raw_flags = $this->_io->readBytes(2);
            $_io__raw_flags = new \Kaitai\Struct\Stream($this->_m__raw_flags);
            $this->_m_flags = new \Zip\LocalFileHeader\GpFlags($_io__raw_flags, $this, $this->_root);
            $this->_m_compressionMethod = $this->_io->readU2le();
            $this->_m__raw_fileModTime = $this->_io->readBytes(4);
            $_io__raw_fileModTime = new \Kaitai\Struct\Stream($this->_m__raw_fileModTime);
            $this->_m_fileModTime = new \DosDatetime($_io__raw_fileModTime);
            $this->_m_crc32 = $this->_io->readU4le();
            $this->_m_lenBodyCompressed = $this->_io->readU4le();
            $this->_m_lenBodyUncompressed = $this->_io->readU4le();
            $this->_m_lenFileName = $this->_io->readU2le();
            $this->_m_lenExtra = $this->_io->readU2le();
            $this->_m_fileName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenFileName()), "UTF-8");
            $this->_m__raw_extra = $this->_io->readBytes($this->lenExtra());
            $_io__raw_extra = new \Kaitai\Struct\Stream($this->_m__raw_extra);
            $this->_m_extra = new \Zip\Extras($_io__raw_extra, $this, $this->_root);
        }
        protected $_m_version;
        protected $_m_flags;
        protected $_m_compressionMethod;
        protected $_m_fileModTime;
        protected $_m_crc32;
        protected $_m_lenBodyCompressed;
        protected $_m_lenBodyUncompressed;
        protected $_m_lenFileName;
        protected $_m_lenExtra;
        protected $_m_fileName;
        protected $_m_extra;
        protected $_m__raw_flags;
        protected $_m__raw_fileModTime;
        protected $_m__raw_extra;
        public function version() { return $this->_m_version; }
        public function flags() { return $this->_m_flags; }
        public function compressionMethod() { return $this->_m_compressionMethod; }
        public function fileModTime() { return $this->_m_fileModTime; }
        public function crc32() { return $this->_m_crc32; }
        public function lenBodyCompressed() { return $this->_m_lenBodyCompressed; }
        public function lenBodyUncompressed() { return $this->_m_lenBodyUncompressed; }
        public function lenFileName() { return $this->_m_lenFileName; }
        public function lenExtra() { return $this->_m_lenExtra; }
        public function fileName() { return $this->_m_fileName; }
        public function extra() { return $this->_m_extra; }
        public function _raw_flags() { return $this->_m__raw_flags; }
        public function _raw_fileModTime() { return $this->_m__raw_fileModTime; }
        public function _raw_extra() { return $this->_m__raw_extra; }
    }
}

namespace Zip\LocalFileHeader {
    class GpFlags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\LocalFileHeader $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileEncrypted = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_compOptionsRaw = $this->_io->readBitsIntLe(2);
            $this->_m_hasDataDescriptor = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_reserved1 = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_compPatchedData = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_strongEncrypt = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_reserved2 = $this->_io->readBitsIntLe(4);
            $this->_m_langEncoding = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_reserved3 = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_maskHeaderValues = $this->_io->readBitsIntLe(1) != 0;
            $this->_m_reserved4 = $this->_io->readBitsIntLe(2);
        }
        protected $_m_deflatedMode;
        public function deflatedMode() {
            if ($this->_m_deflatedMode !== null)
                return $this->_m_deflatedMode;
            if ( (($this->_parent()->compressionMethod() == \Zip\Compression::DEFLATED) || ($this->_parent()->compressionMethod() == \Zip\Compression::ENHANCED_DEFLATED)) ) {
                $this->_m_deflatedMode = $this->compOptionsRaw();
            }
            return $this->_m_deflatedMode;
        }
        protected $_m_implodedDictByteSize;

        /**
         * 8KiB or 4KiB in bytes
         */
        public function implodedDictByteSize() {
            if ($this->_m_implodedDictByteSize !== null)
                return $this->_m_implodedDictByteSize;
            if ($this->_parent()->compressionMethod() == \Zip\Compression::IMPLODED) {
                $this->_m_implodedDictByteSize = ((($this->compOptionsRaw() & 1) != 0 ? 8 : 4) * 1024);
            }
            return $this->_m_implodedDictByteSize;
        }
        protected $_m_implodedNumSfTrees;
        public function implodedNumSfTrees() {
            if ($this->_m_implodedNumSfTrees !== null)
                return $this->_m_implodedNumSfTrees;
            if ($this->_parent()->compressionMethod() == \Zip\Compression::IMPLODED) {
                $this->_m_implodedNumSfTrees = (($this->compOptionsRaw() & 2) != 0 ? 3 : 2);
            }
            return $this->_m_implodedNumSfTrees;
        }
        protected $_m_lzmaHasEosMarker;
        public function lzmaHasEosMarker() {
            if ($this->_m_lzmaHasEosMarker !== null)
                return $this->_m_lzmaHasEosMarker;
            if ($this->_parent()->compressionMethod() == \Zip\Compression::LZMA) {
                $this->_m_lzmaHasEosMarker = ($this->compOptionsRaw() & 1) != 0;
            }
            return $this->_m_lzmaHasEosMarker;
        }
        protected $_m_fileEncrypted;
        protected $_m_compOptionsRaw;
        protected $_m_hasDataDescriptor;
        protected $_m_reserved1;
        protected $_m_compPatchedData;
        protected $_m_strongEncrypt;
        protected $_m_reserved2;
        protected $_m_langEncoding;
        protected $_m_reserved3;
        protected $_m_maskHeaderValues;
        protected $_m_reserved4;
        public function fileEncrypted() { return $this->_m_fileEncrypted; }

        /**
         * internal; access derived value instances instead
         */
        public function compOptionsRaw() { return $this->_m_compOptionsRaw; }
        public function hasDataDescriptor() { return $this->_m_hasDataDescriptor; }
        public function reserved1() { return $this->_m_reserved1; }
        public function compPatchedData() { return $this->_m_compPatchedData; }
        public function strongEncrypt() { return $this->_m_strongEncrypt; }
        public function reserved2() { return $this->_m_reserved2; }
        public function langEncoding() { return $this->_m_langEncoding; }
        public function reserved3() { return $this->_m_reserved3; }
        public function maskHeaderValues() { return $this->_m_maskHeaderValues; }
        public function reserved4() { return $this->_m_reserved4; }
    }
}

namespace Zip\LocalFileHeader\GpFlags {
    class DeflateMode {
        const NORMAL = 0;
        const MAXIMUM = 1;
        const FAST = 2;
        const SUPER_FAST = 3;
    }
}

namespace Zip {
    class EndOfCentralDir extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Zip\PkSection $_parent = null, \Zip $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_diskOfEndOfCentralDir = $this->_io->readU2le();
            $this->_m_diskOfCentralDir = $this->_io->readU2le();
            $this->_m_numCentralDirEntriesOnDisk = $this->_io->readU2le();
            $this->_m_numCentralDirEntriesTotal = $this->_io->readU2le();
            $this->_m_lenCentralDir = $this->_io->readU4le();
            $this->_m_ofsCentralDir = $this->_io->readU4le();
            $this->_m_lenComment = $this->_io->readU2le();
            $this->_m_comment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->lenComment()), "UTF-8");
        }
        protected $_m_diskOfEndOfCentralDir;
        protected $_m_diskOfCentralDir;
        protected $_m_numCentralDirEntriesOnDisk;
        protected $_m_numCentralDirEntriesTotal;
        protected $_m_lenCentralDir;
        protected $_m_ofsCentralDir;
        protected $_m_lenComment;
        protected $_m_comment;
        public function diskOfEndOfCentralDir() { return $this->_m_diskOfEndOfCentralDir; }
        public function diskOfCentralDir() { return $this->_m_diskOfCentralDir; }
        public function numCentralDirEntriesOnDisk() { return $this->_m_numCentralDirEntriesOnDisk; }
        public function numCentralDirEntriesTotal() { return $this->_m_numCentralDirEntriesTotal; }
        public function lenCentralDir() { return $this->_m_lenCentralDir; }
        public function ofsCentralDir() { return $this->_m_ofsCentralDir; }
        public function lenComment() { return $this->_m_lenComment; }
        public function comment() { return $this->_m_comment; }
    }
}

namespace Zip {
    class Compression {
        const NONE = 0;
        const SHRUNK = 1;
        const REDUCED_1 = 2;
        const REDUCED_2 = 3;
        const REDUCED_3 = 4;
        const REDUCED_4 = 5;
        const IMPLODED = 6;
        const DEFLATED = 8;
        const ENHANCED_DEFLATED = 9;
        const PKWARE_DCL_IMPLODED = 10;
        const BZIP2 = 12;
        const LZMA = 14;
        const IBM_TERSE = 18;
        const IBM_LZ77_Z = 19;
        const PPMD = 98;
    }
}

namespace Zip {
    class ExtraCodes {
        const ZIP64 = 1;
        const AV_INFO = 7;
        const OS2 = 9;
        const NTFS = 10;
        const OPENVMS = 12;
        const PKWARE_UNIX = 13;
        const FILE_STREAM_AND_FORK_DESCRIPTORS = 14;
        const PATCH_DESCRIPTOR = 15;
        const PKCS7 = 20;
        const X509_CERT_ID_AND_SIGNATURE_FOR_FILE = 21;
        const X509_CERT_ID_FOR_CENTRAL_DIR = 22;
        const STRONG_ENCRYPTION_HEADER = 23;
        const RECORD_MANAGEMENT_CONTROLS = 24;
        const PKCS7_ENC_RECIP_CERT_LIST = 25;
        const IBM_S390_UNCOMP = 101;
        const IBM_S390_COMP = 102;
        const POSZIP_4690 = 18064;
        const EXTENDED_TIMESTAMP = 21589;
        const INFOZIP_UNIX = 30805;
        const INFOZIP_UNIX_VAR_SIZE = 30837;
    }
}
