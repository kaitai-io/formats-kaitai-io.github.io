<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Btrfs is a copy on write file system based on B-trees focusing on fault tolerance, repair and easy
 * administration. Btrfs is intended to address the lack of pooling, snapshots, checksums, and
 * integral multi-device spanning in Linux file systems.
 * Given any pair of subvolumes (or snapshots), Btrfs can generate a binary diff between them by
 * using the `btrfs send` command that can be replayed later by using `btrfs receive`, possibly on a
 * different Btrfs file system. The `btrfs send` command creates a set of data modifications required
 * for converting one subvolume into another.
 * This spec can be used to disassemble the binary diff created by the `btrfs send` command.
 * If you want a text representation you may want to checkout `btrfs receive --dump` instead.
 */

namespace {
    class BtrfsStream extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \BtrfsStream\SendStreamHeader($this->_io, $this, $this->_root);
            $this->_m_commands = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_commands[] = new \BtrfsStream\SendCommand($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_header;
        protected $_m_commands;
        public function header() { return $this->_m_header; }
        public function commands() { return $this->_m_commands; }
    }
}

namespace BtrfsStream {
    class SendCommand extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\BtrfsStream $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenData = $this->_io->readU4le();
            $this->_m_type = $this->_io->readU2le();
            $this->_m_checksum = $this->_io->readBytes(4);
            $this->_m__raw_data = $this->_io->readBytes($this->lenData());
            $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
            $this->_m_data = new \BtrfsStream\SendCommand\Tlvs($_io__raw_data, $this, $this->_root);
        }
        protected $_m_lenData;
        protected $_m_type;
        protected $_m_checksum;
        protected $_m_data;
        protected $_m__raw_data;
        public function lenData() { return $this->_m_lenData; }
        public function type() { return $this->_m_type; }

        /**
         * CRC32 checksum of a whole send command, including the header, with this attribute set to 0.
         */
        public function checksum() { return $this->_m_checksum; }
        public function data() { return $this->_m_data; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

namespace BtrfsStream\SendCommand {
    class String extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\BtrfsStream\SendCommand\Tlv $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_string = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_string;
        public function string() { return $this->_m_string; }
    }
}

namespace BtrfsStream\SendCommand {
    class Timespec extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\BtrfsStream\SendCommand\Tlv $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tsSec = $this->_io->readS8le();
            $this->_m_tsNsec = $this->_io->readS4le();
        }
        protected $_m_tsSec;
        protected $_m_tsNsec;
        public function tsSec() { return $this->_m_tsSec; }
        public function tsNsec() { return $this->_m_tsNsec; }
    }
}

namespace BtrfsStream\SendCommand {
    class Tlv extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\BtrfsStream\SendCommand\Tlvs $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU2le();
            $this->_m_length = $this->_io->readU2le();
            switch ($this->type()) {
                case \BtrfsStream\Attribute::ATIME:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\Timespec($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::CLONE_CTRANSID:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::CLONE_LEN:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::CLONE_OFFSET:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::CLONE_PATH:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\String($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::CLONE_UUID:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\Uuid($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::CTIME:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\Timespec($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::CTRANSID:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::FILE_OFFSET:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::GID:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::MODE:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::MTIME:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\Timespec($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::OTIME:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\Timespec($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::PATH:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\String($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::PATH_LINK:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\String($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::PATH_TO:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\String($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::RDEV:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::SIZE:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::UID:
                    $this->_m_value = $this->_io->readU8le();
                    break;
                case \BtrfsStream\Attribute::UUID:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\Uuid($_io__raw_value, $this, $this->_root);
                    break;
                case \BtrfsStream\Attribute::XATTR_NAME:
                    $this->_m__raw_value = $this->_io->readBytes($this->length());
                    $_io__raw_value = new \Kaitai\Struct\Stream($this->_m__raw_value);
                    $this->_m_value = new \BtrfsStream\SendCommand\String($_io__raw_value, $this, $this->_root);
                    break;
                default:
                    $this->_m_value = $this->_io->readBytes($this->length());
                    break;
            }
        }
        protected $_m_type;
        protected $_m_length;
        protected $_m_value;
        protected $_m__raw_value;
        public function type() { return $this->_m_type; }
        public function length() { return $this->_m_length; }
        public function value() { return $this->_m_value; }
        public function _raw_value() { return $this->_m__raw_value; }
    }
}

namespace BtrfsStream\SendCommand {
    class Tlvs extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\BtrfsStream\SendCommand $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tlv = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_tlv[] = new \BtrfsStream\SendCommand\Tlv($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_tlv;
        public function tlv() { return $this->_m_tlv; }
    }
}

namespace BtrfsStream\SendCommand {
    class Uuid extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\BtrfsStream\SendCommand\Tlv $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_uuid = $this->_io->readBytes(16);
        }
        protected $_m_uuid;
        public function uuid() { return $this->_m_uuid; }
    }
}

namespace BtrfsStream {
    class SendStreamHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\BtrfsStream $_parent = null, ?\BtrfsStream $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(13);
            if (!($this->_m_magic == "\x62\x74\x72\x66\x73\x2D\x73\x74\x72\x65\x61\x6D\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x62\x74\x72\x66\x73\x2D\x73\x74\x72\x65\x61\x6D\x00", $this->_m_magic, $this->_io, "/types/send_stream_header/seq/0");
            }
            $this->_m_version = $this->_io->readU4le();
        }
        protected $_m_magic;
        protected $_m_version;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
    }
}

namespace BtrfsStream {
    class Attribute {
        const UNSPEC = 0;
        const UUID = 1;
        const CTRANSID = 2;
        const INO = 3;
        const SIZE = 4;
        const MODE = 5;
        const UID = 6;
        const GID = 7;
        const RDEV = 8;
        const CTIME = 9;
        const MTIME = 10;
        const ATIME = 11;
        const OTIME = 12;
        const XATTR_NAME = 13;
        const XATTR_DATA = 14;
        const PATH = 15;
        const PATH_TO = 16;
        const PATH_LINK = 17;
        const FILE_OFFSET = 18;
        const DATA = 19;
        const CLONE_UUID = 20;
        const CLONE_CTRANSID = 21;
        const CLONE_PATH = 22;
        const CLONE_OFFSET = 23;
        const CLONE_LEN = 24;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace BtrfsStream {
    class Command {
        const UNSPEC = 0;
        const SUBVOL = 1;
        const SNAPSHOT = 2;
        const MKFILE = 3;
        const MKDIR = 4;
        const MKNOD = 5;
        const MKFIFO = 6;
        const MKSOCK = 7;
        const SYMLINK = 8;
        const RENAME = 9;
        const LINK = 10;
        const UNLINK = 11;
        const RMDIR = 12;
        const SET_XATTR = 13;
        const REMOVE_XATTR = 14;
        const WRITE = 15;
        const CLONE = 16;
        const TRUNCATE = 17;
        const CHMOD = 18;
        const CHOWN = 19;
        const UTIMES = 20;
        const END = 21;
        const UPDATE_EXTENT = 22;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
