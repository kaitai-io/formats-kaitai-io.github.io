<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Windows Shell Items (AKA "shellbags") is an undocumented set of
 * structures used internally within Windows to identify paths in
 * Windows Folder Hierarchy. It is widely used in Windows Shell (and
 * most visible in File Explorer), both as in-memory and in-file
 * structures. Some formats embed them, namely:
 * 
 * * Windows Shell link files (.lnk) Windows registry
 * * Windows registry "ShellBags" keys
 * 
 * The format is mostly undocumented, and is known to vary between
 * various Windows versions.
 */

class WindowsShellItems extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \WindowsShellItems $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_items = [];
        $i = 0;
        do {
            $_ = new \WindowsShellItems\ShellItem($this->_io, $this, $this->_root);
            $this->_m_items[] = $_;
            $i++;
        } while (!($_->lenData() == 0));
    }
    protected $_m_items;
    public function items() { return $this->_m_items; }
}

namespace \WindowsShellItems;

class ShellItemData extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsShellItems\ShellItem $_parent = null, \WindowsShellItems $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = $this->_io->readU1();
        switch ($this->code()) {
            case 31:
                $this->_m_body1 = new \WindowsShellItems\RootFolderBody($this->_io, $this, $this->_root);
                break;
        }
        switch (($this->code() & 112)) {
            case 32:
                $this->_m_body2 = new \WindowsShellItems\VolumeBody($this->_io, $this, $this->_root);
                break;
            case 48:
                $this->_m_body2 = new \WindowsShellItems\FileEntryBody($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_code;
    protected $_m_body1;
    protected $_m_body2;
    public function code() { return $this->_m_code; }
    public function body1() { return $this->_m_body1; }
    public function body2() { return $this->_m_body2; }
}

namespace \WindowsShellItems;

class ShellItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsShellItems $_parent = null, \WindowsShellItems $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_lenData = $this->_io->readU2le();
        if ($this->lenData() >= 2) {
            $this->_m__raw_data = $this->_io->readBytes(($this->lenData() - 2));
            $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
            $this->_m_data = new \WindowsShellItems\ShellItemData($_io__raw_data, $this, $this->_root);
        }
    }
    protected $_m_lenData;
    protected $_m_data;
    protected $_m__raw_data;
    public function lenData() { return $this->_m_lenData; }
    public function data() { return $this->_m_data; }
    public function _raw_data() { return $this->_m__raw_data; }
}

namespace \WindowsShellItems;

class RootFolderBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsShellItems\ShellItemData $_parent = null, \WindowsShellItems $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sortIndex = $this->_io->readU1();
        $this->_m_shellFolderId = $this->_io->readBytes(16);
    }
    protected $_m_sortIndex;
    protected $_m_shellFolderId;
    public function sortIndex() { return $this->_m_sortIndex; }
    public function shellFolderId() { return $this->_m_shellFolderId; }
}

namespace \WindowsShellItems;

class VolumeBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsShellItems\ShellItemData $_parent = null, \WindowsShellItems $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_flags = $this->_io->readU1();
    }
    protected $_m_flags;
    public function flags() { return $this->_m_flags; }
}

namespace \WindowsShellItems;

class FileEntryBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \WindowsShellItems\ShellItemData $_parent = null, \WindowsShellItems $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m__unnamed0 = $this->_io->readU1();
        $this->_m_fileSize = $this->_io->readU4le();
        $this->_m_lastModTime = $this->_io->readU4le();
        $this->_m_fileAttrs = $this->_io->readU2le();
    }
    protected $_m_isDir;
    public function isDir() {
        if ($this->_m_isDir !== null)
            return $this->_m_isDir;
        $this->_m_isDir = ($this->_parent()->code() & 1) != 0;
        return $this->_m_isDir;
    }
    protected $_m_isFile;
    public function isFile() {
        if ($this->_m_isFile !== null)
            return $this->_m_isFile;
        $this->_m_isFile = ($this->_parent()->code() & 2) != 0;
        return $this->_m_isFile;
    }
    protected $_m__unnamed0;
    protected $_m_fileSize;
    protected $_m_lastModTime;
    protected $_m_fileAttrs;
    public function _unnamed0() { return $this->_m__unnamed0; }
    public function fileSize() { return $this->_m_fileSize; }
    public function lastModTime() { return $this->_m_lastModTime; }
    public function fileAttrs() { return $this->_m_fileAttrs; }
}
