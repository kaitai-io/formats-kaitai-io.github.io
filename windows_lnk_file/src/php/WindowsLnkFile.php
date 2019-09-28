<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Windows .lnk files (AKA "shell link" file) are most frequently used
 * in Windows shell to create "shortcuts" to another files, usually for
 * purposes of running a program from some other directory, sometimes
 * with certain preconfigured arguments and some other options.
 */

class WindowsLnkFile extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \WindowsLnkFile\FileHeader($this->_io, $this, $this->_root);
        if ($this->header()->flags()->hasLinkTargetIdList()) {
            $this->_m_targetIdList = new \WindowsLnkFile\LinkTargetIdList($this->_io, $this, $this->_root);
        }
        if ($this->header()->flags()->hasLinkInfo()) {
            $this->_m_info = new \WindowsLnkFile\LinkInfo($this->_io, $this, $this->_root);
        }
        if ($this->header()->flags()->hasName()) {
            $this->_m_name = new \WindowsLnkFile\StringData($this->_io, $this, $this->_root);
        }
        if ($this->header()->flags()->hasRelPath()) {
            $this->_m_relPath = new \WindowsLnkFile\StringData($this->_io, $this, $this->_root);
        }
        if ($this->header()->flags()->hasWorkDir()) {
            $this->_m_workDir = new \WindowsLnkFile\StringData($this->_io, $this, $this->_root);
        }
        if ($this->header()->flags()->hasArguments()) {
            $this->_m_arguments = new \WindowsLnkFile\StringData($this->_io, $this, $this->_root);
        }
        if ($this->header()->flags()->hasIconLocation()) {
            $this->_m_iconLocation = new \WindowsLnkFile\StringData($this->_io, $this, $this->_root);
        }
    }
    protected $_m_header;
    protected $_m_targetIdList;
    protected $_m_info;
    protected $_m_name;
    protected $_m_relPath;
    protected $_m_workDir;
    protected $_m_arguments;
    protected $_m_iconLocation;
    public function header() { return $this->_m_header; }
    public function targetIdList() { return $this->_m_targetIdList; }
    public function info() { return $this->_m_info; }
    public function name() { return $this->_m_name; }
    public function relPath() { return $this->_m_relPath; }
    public function workDir() { return $this->_m_workDir; }
    public function arguments() { return $this->_m_arguments; }
    public function iconLocation() { return $this->_m_iconLocation; }
}

namespace \WindowsLnkFile;

class LinkTargetIdList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenIdList = $this->_io->readU2le();
        $this->_m__raw_idList = $this->_io->readBytes($this->lenIdList());
        $_io__raw_idList = new \Kaitai\Struct\Stream($this->_m__raw_idList);
        $this->_m_idList = new \WindowsShellItems($_io__raw_idList);
    }
    protected $_m_lenIdList;
    protected $_m_idList;
    protected $_m__raw_idList;
    public function lenIdList() { return $this->_m_lenIdList; }
    public function idList() { return $this->_m_idList; }
    public function _raw_idList() { return $this->_m__raw_idList; }
}

namespace \WindowsLnkFile;

class StringData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_charsStr = $this->_io->readU2le();
        $this->_m_str = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(($this->charsStr() * 2)), "UTF-16LE");
    }
    protected $_m_charsStr;
    protected $_m_str;
    public function charsStr() { return $this->_m_charsStr; }
    public function str() { return $this->_m_str; }
}

namespace \WindowsLnkFile;

class LinkInfo extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenAll = $this->_io->readU4le();
        $this->_m__raw_all = $this->_io->readBytes(($this->lenAll() - 4));
        $_io__raw_all = new \Kaitai\Struct\Stream($this->_m__raw_all);
        $this->_m_all = new \WindowsLnkFile\LinkInfo\All($_io__raw_all, $this, $this->_root);
    }
    protected $_m_lenAll;
    protected $_m_all;
    protected $_m__raw_all;
    public function lenAll() { return $this->_m_lenAll; }
    public function all() { return $this->_m_all; }
    public function _raw_all() { return $this->_m__raw_all; }
}

namespace \WindowsLnkFile\LinkInfo;

class VolumeIdBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile\LinkInfo\VolumeIdSpec $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_driveType = $this->_io->readU4le();
        $this->_m_driveSerialNumber = $this->_io->readU4le();
        $this->_m_ofsVolumeLabel = $this->_io->readU4le();
        if ($this->isUnicode()) {
            $this->_m_ofsVolumeLabelUnicode = $this->_io->readU4le();
        }
    }
    protected $_m_isUnicode;
    public function isUnicode() {
        if ($this->_m_isUnicode !== null)
            return $this->_m_isUnicode;
        $this->_m_isUnicode = $this->ofsVolumeLabel() == 20;
        return $this->_m_isUnicode;
    }
    protected $_m_volumeLabelAnsi;
    public function volumeLabelAnsi() {
        if ($this->_m_volumeLabelAnsi !== null)
            return $this->_m_volumeLabelAnsi;
        if (!($this->isUnicode())) {
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->ofsVolumeLabel() - 4));
            $this->_m_volumeLabelAnsi = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "cp437");
            $this->_io->seek($_pos);
        }
        return $this->_m_volumeLabelAnsi;
    }
    protected $_m_driveType;
    protected $_m_driveSerialNumber;
    protected $_m_ofsVolumeLabel;
    protected $_m_ofsVolumeLabelUnicode;
    public function driveType() { return $this->_m_driveType; }
    public function driveSerialNumber() { return $this->_m_driveSerialNumber; }
    public function ofsVolumeLabel() { return $this->_m_ofsVolumeLabel; }
    public function ofsVolumeLabelUnicode() { return $this->_m_ofsVolumeLabelUnicode; }
}

namespace \WindowsLnkFile\LinkInfo;

class All extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile\LinkInfo $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenHeader = $this->_io->readU4le();
        $this->_m__raw_header = $this->_io->readBytes(($this->lenHeader() - 8));
        $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
        $this->_m_header = new \WindowsLnkFile\LinkInfo\Header($_io__raw_header, $this, $this->_root);
    }
    protected $_m_volumeId;
    public function volumeId() {
        if ($this->_m_volumeId !== null)
            return $this->_m_volumeId;
        if ($this->header()->flags()->hasVolumeIdAndLocalBasePath()) {
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->header()->ofsVolumeId() - 4));
            $this->_m_volumeId = new \WindowsLnkFile\LinkInfo\VolumeIdSpec($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
        }
        return $this->_m_volumeId;
    }
    protected $_m_localBasePath;
    public function localBasePath() {
        if ($this->_m_localBasePath !== null)
            return $this->_m_localBasePath;
        if ($this->header()->flags()->hasVolumeIdAndLocalBasePath()) {
            $_pos = $this->_io->pos();
            $this->_io->seek(($this->header()->ofsLocalBasePath() - 4));
            $this->_m_localBasePath = $this->_io->readBytesTerm(0, false, true, true);
            $this->_io->seek($_pos);
        }
        return $this->_m_localBasePath;
    }
    protected $_m_lenHeader;
    protected $_m_header;
    protected $_m__raw_header;
    public function lenHeader() { return $this->_m_lenHeader; }
    public function header() { return $this->_m_header; }
    public function _raw_header() { return $this->_m__raw_header; }
}

namespace \WindowsLnkFile\LinkInfo;

class VolumeIdSpec extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile\LinkInfo\All $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenAll = $this->_io->readU4le();
        $this->_m__raw_body = $this->_io->readBytes(($this->lenAll() - 4));
        $_io__raw_body = new \Kaitai\Struct\Stream($this->_m__raw_body);
        $this->_m_body = new \WindowsLnkFile\LinkInfo\VolumeIdBody($_io__raw_body, $this, $this->_root);
    }
    protected $_m_lenAll;
    protected $_m_body;
    protected $_m__raw_body;
    public function lenAll() { return $this->_m_lenAll; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \WindowsLnkFile\LinkInfo;

class LinkInfoFlags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile\LinkInfo\Header $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved1 = $this->_io->readBitsInt(6);
        $this->_m_hasCommonNetRelLink = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasVolumeIdAndLocalBasePath = $this->_io->readBitsInt(1) != 0;
        $this->_m_reserved2 = $this->_io->readBitsInt(24);
    }
    protected $_m_reserved1;
    protected $_m_hasCommonNetRelLink;
    protected $_m_hasVolumeIdAndLocalBasePath;
    protected $_m_reserved2;
    public function reserved1() { return $this->_m_reserved1; }
    public function hasCommonNetRelLink() { return $this->_m_hasCommonNetRelLink; }
    public function hasVolumeIdAndLocalBasePath() { return $this->_m_hasVolumeIdAndLocalBasePath; }
    public function reserved2() { return $this->_m_reserved2; }
}

namespace \WindowsLnkFile\LinkInfo;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile\LinkInfo\All $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = new \WindowsLnkFile\LinkInfo\LinkInfoFlags($this->_io, $this, $this->_root);
        $this->_m_ofsVolumeId = $this->_io->readU4le();
        $this->_m_ofsLocalBasePath = $this->_io->readU4le();
        $this->_m_ofsCommonNetRelLink = $this->_io->readU4le();
        $this->_m_ofsCommonPathSuffix = $this->_io->readU4le();
        if (!($this->_io()->isEof())) {
            $this->_m_ofsLocalBasePathUnicode = $this->_io->readU4le();
        }
        if (!($this->_io()->isEof())) {
            $this->_m_ofsCommonPathSuffixUnicode = $this->_io->readU4le();
        }
    }
    protected $_m_flags;
    protected $_m_ofsVolumeId;
    protected $_m_ofsLocalBasePath;
    protected $_m_ofsCommonNetRelLink;
    protected $_m_ofsCommonPathSuffix;
    protected $_m_ofsLocalBasePathUnicode;
    protected $_m_ofsCommonPathSuffixUnicode;
    public function flags() { return $this->_m_flags; }
    public function ofsVolumeId() { return $this->_m_ofsVolumeId; }
    public function ofsLocalBasePath() { return $this->_m_ofsLocalBasePath; }
    public function ofsCommonNetRelLink() { return $this->_m_ofsCommonNetRelLink; }
    public function ofsCommonPathSuffix() { return $this->_m_ofsCommonPathSuffix; }
    public function ofsLocalBasePathUnicode() { return $this->_m_ofsLocalBasePathUnicode; }
    public function ofsCommonPathSuffixUnicode() { return $this->_m_ofsCommonPathSuffixUnicode; }
}

namespace \WindowsLnkFile;

class LinkFlags extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile\FileHeader $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_isUnicode = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasIconLocation = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasArguments = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasWorkDir = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasRelPath = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasName = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasLinkInfo = $this->_io->readBitsInt(1) != 0;
        $this->_m_hasLinkTargetIdList = $this->_io->readBitsInt(1) != 0;
        $this->_m__unnamed8 = $this->_io->readBitsInt(16);
        $this->_m_reserved = $this->_io->readBitsInt(5);
        $this->_m_keepLocalIdListForUncTarget = $this->_io->readBitsInt(1) != 0;
        $this->_m__unnamed11 = $this->_io->readBitsInt(2);
    }
    protected $_m_isUnicode;
    protected $_m_hasIconLocation;
    protected $_m_hasArguments;
    protected $_m_hasWorkDir;
    protected $_m_hasRelPath;
    protected $_m_hasName;
    protected $_m_hasLinkInfo;
    protected $_m_hasLinkTargetIdList;
    protected $_m__unnamed8;
    protected $_m_reserved;
    protected $_m_keepLocalIdListForUncTarget;
    protected $_m__unnamed11;
    public function isUnicode() { return $this->_m_isUnicode; }
    public function hasIconLocation() { return $this->_m_hasIconLocation; }
    public function hasArguments() { return $this->_m_hasArguments; }
    public function hasWorkDir() { return $this->_m_hasWorkDir; }
    public function hasRelPath() { return $this->_m_hasRelPath; }
    public function hasName() { return $this->_m_hasName; }
    public function hasLinkInfo() { return $this->_m_hasLinkInfo; }
    public function hasLinkTargetIdList() { return $this->_m_hasLinkTargetIdList; }
    public function _unnamed8() { return $this->_m__unnamed8; }
    public function reserved() { return $this->_m_reserved; }
    public function keepLocalIdListForUncTarget() { return $this->_m_keepLocalIdListForUncTarget; }
    public function _unnamed11() { return $this->_m__unnamed11; }
}

namespace \WindowsLnkFile;

class FileHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsLnkFile $_parent = null, \WindowsLnkFile $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenHeader = $this->_io->ensureFixedContents("\x4C\x00\x00\x00");
        $this->_m_linkClsid = $this->_io->ensureFixedContents("\x01\x14\x02\x00\x00\x00\x00\x00\xC0\x00\x00\x00\x00\x00\x00\x46");
        $this->_m__raw_flags = $this->_io->readBytes(4);
        $_io__raw_flags = new \Kaitai\Struct\Stream($this->_m__raw_flags);
        $this->_m_flags = new \WindowsLnkFile\LinkFlags($_io__raw_flags, $this, $this->_root);
        $this->_m_fileAttrs = $this->_io->readU4le();
        $this->_m_timeCreation = $this->_io->readU8le();
        $this->_m_timeAccess = $this->_io->readU8le();
        $this->_m_timeWrite = $this->_io->readU8le();
        $this->_m_targetFileSize = $this->_io->readU4le();
        $this->_m_iconIndex = $this->_io->readS4le();
        $this->_m_showCommand = $this->_io->readU4le();
        $this->_m_hotkey = $this->_io->readU2le();
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00");
    }
    protected $_m_lenHeader;
    protected $_m_linkClsid;
    protected $_m_flags;
    protected $_m_fileAttrs;
    protected $_m_timeCreation;
    protected $_m_timeAccess;
    protected $_m_timeWrite;
    protected $_m_targetFileSize;
    protected $_m_iconIndex;
    protected $_m_showCommand;
    protected $_m_hotkey;
    protected $_m_reserved;
    protected $_m__raw_flags;

    /**
     * Technically, a size of the header, but in reality, it's
     * fixed by standard.
     */
    public function lenHeader() { return $this->_m_lenHeader; }

    /**
     * 16-byte class identified (CLSID), reserved for Windows shell
     * link files.
     */
    public function linkClsid() { return $this->_m_linkClsid; }
    public function flags() { return $this->_m_flags; }
    public function fileAttrs() { return $this->_m_fileAttrs; }
    public function timeCreation() { return $this->_m_timeCreation; }
    public function timeAccess() { return $this->_m_timeAccess; }
    public function timeWrite() { return $this->_m_timeWrite; }

    /**
     * Lower 32 bits of the size of the file that this link targets
     */
    public function targetFileSize() { return $this->_m_targetFileSize; }

    /**
     * Index of an icon to use from target file
     */
    public function iconIndex() { return $this->_m_iconIndex; }

    /**
     * Window state to set after the launch of target executable
     */
    public function showCommand() { return $this->_m_showCommand; }
    public function hotkey() { return $this->_m_hotkey; }
    public function reserved() { return $this->_m_reserved; }
    public function _raw_flags() { return $this->_m__raw_flags; }
}

namespace \WindowsLnkFile;

class WindowState {
    const NORMAL = 1;
    const MAXIMIZED = 3;
    const MIN_NO_ACTIVE = 7;
}

namespace \WindowsLnkFile;

class DriveTypes {
    const UNKNOWN = 0;
    const NO_ROOT_DIR = 1;
    const REMOVABLE = 2;
    const FIXED = 3;
    const REMOTE = 4;
    const CDROM = 5;
    const RAMDISK = 6;
}
