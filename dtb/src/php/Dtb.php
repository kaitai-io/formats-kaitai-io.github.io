<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Also referred to as Devicetree Blob (DTB). It is a flat binary encoding
 * of data (primarily devicetree data, although other data is possible as well).
 * The data is internally stored as a tree of named nodes and properties. Nodes
 * contain properties and child nodes, while properties are name-value pairs.
 * 
 * The Devicetree Blobs (`.dtb` files) are compiled from the Devicetree Source
 * files (`.dts`) through the Devicetree compiler (DTC).
 * 
 * On Linux systems that support this, the blobs can be accessed in
 * `/sys/firmware/fdt`:
 * 
 * * <https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-firmware-ofw>
 * 
 * The encoding of strings used in the `strings_block` and `structure_block` is
 * actually a subset of ASCII:
 * 
 * <https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names>
 * 
 * Example files:
 * 
 * * <https://github.com/qemu/qemu/tree/master/pc-bios>
 */

namespace {
    class Dtb extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\xD0\x0D\xFE\xED")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xD0\x0D\xFE\xED", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_totalSize = $this->_io->readU4be();
            $this->_m_ofsStructureBlock = $this->_io->readU4be();
            $this->_m_ofsStringsBlock = $this->_io->readU4be();
            $this->_m_ofsMemoryReservationBlock = $this->_io->readU4be();
            $this->_m_version = $this->_io->readU4be();
            $this->_m_minCompatibleVersion = $this->_io->readU4be();
            if (!($this->_m_minCompatibleVersion <= $this->version())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->version(), $this->_m_minCompatibleVersion, $this->_io, "/seq/6");
            }
            $this->_m_bootCpuidPhys = $this->_io->readU4be();
            $this->_m_lenStringsBlock = $this->_io->readU4be();
            $this->_m_lenStructureBlock = $this->_io->readU4be();
        }
        protected $_m_memoryReservationBlock;
        public function memoryReservationBlock() {
            if ($this->_m_memoryReservationBlock !== null)
                return $this->_m_memoryReservationBlock;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsMemoryReservationBlock());
            $this->_m__raw_memoryReservationBlock = $this->_io->readBytes($this->ofsStructureBlock() - $this->ofsMemoryReservationBlock());
            $_io__raw_memoryReservationBlock = new \Kaitai\Struct\Stream($this->_m__raw_memoryReservationBlock);
            $this->_m_memoryReservationBlock = new \Dtb\MemoryBlock($_io__raw_memoryReservationBlock, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_memoryReservationBlock;
        }
        protected $_m_stringsBlock;
        public function stringsBlock() {
            if ($this->_m_stringsBlock !== null)
                return $this->_m_stringsBlock;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsStringsBlock());
            $this->_m__raw_stringsBlock = $this->_io->readBytes($this->lenStringsBlock());
            $_io__raw_stringsBlock = new \Kaitai\Struct\Stream($this->_m__raw_stringsBlock);
            $this->_m_stringsBlock = new \Dtb\Strings($_io__raw_stringsBlock, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_stringsBlock;
        }
        protected $_m_structureBlock;
        public function structureBlock() {
            if ($this->_m_structureBlock !== null)
                return $this->_m_structureBlock;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsStructureBlock());
            $this->_m__raw_structureBlock = $this->_io->readBytes($this->lenStructureBlock());
            $_io__raw_structureBlock = new \Kaitai\Struct\Stream($this->_m__raw_structureBlock);
            $this->_m_structureBlock = new \Dtb\FdtBlock($_io__raw_structureBlock, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_structureBlock;
        }
        protected $_m_magic;
        protected $_m_totalSize;
        protected $_m_ofsStructureBlock;
        protected $_m_ofsStringsBlock;
        protected $_m_ofsMemoryReservationBlock;
        protected $_m_version;
        protected $_m_minCompatibleVersion;
        protected $_m_bootCpuidPhys;
        protected $_m_lenStringsBlock;
        protected $_m_lenStructureBlock;
        protected $_m__raw_memoryReservationBlock;
        protected $_m__raw_stringsBlock;
        protected $_m__raw_structureBlock;
        public function magic() { return $this->_m_magic; }
        public function totalSize() { return $this->_m_totalSize; }
        public function ofsStructureBlock() { return $this->_m_ofsStructureBlock; }
        public function ofsStringsBlock() { return $this->_m_ofsStringsBlock; }
        public function ofsMemoryReservationBlock() { return $this->_m_ofsMemoryReservationBlock; }
        public function version() { return $this->_m_version; }
        public function minCompatibleVersion() { return $this->_m_minCompatibleVersion; }
        public function bootCpuidPhys() { return $this->_m_bootCpuidPhys; }
        public function lenStringsBlock() { return $this->_m_lenStringsBlock; }
        public function lenStructureBlock() { return $this->_m_lenStructureBlock; }
        public function _raw_memoryReservationBlock() { return $this->_m__raw_memoryReservationBlock; }
        public function _raw_stringsBlock() { return $this->_m__raw_stringsBlock; }
        public function _raw_structureBlock() { return $this->_m__raw_structureBlock; }
    }
}

namespace Dtb {
    class FdtBeginNode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Dtb\FdtNode $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
            $this->_m_padding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->_io()->pos()), 4));
        }
        protected $_m_name;
        protected $_m_padding;
        public function name() { return $this->_m_name; }
        public function padding() { return $this->_m_padding; }
    }
}

namespace Dtb {
    class FdtBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Dtb $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_nodes = [];
            $i = 0;
            do {
                $_ = new \Dtb\FdtNode($this->_io, $this, $this->_root);
                $this->_m_nodes[] = $_;
                $i++;
            } while (!($_->type() == \Dtb\Fdt::END));
        }
        protected $_m_nodes;
        public function nodes() { return $this->_m_nodes; }
    }
}

namespace Dtb {
    class FdtNode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Dtb\FdtBlock $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_type = $this->_io->readU4be();
            switch ($this->type()) {
                case \Dtb\Fdt::BEGIN_NODE:
                    $this->_m_body = new \Dtb\FdtBeginNode($this->_io, $this, $this->_root);
                    break;
                case \Dtb\Fdt::PROP:
                    $this->_m_body = new \Dtb\FdtProp($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_type;
        protected $_m_body;
        public function type() { return $this->_m_type; }
        public function body() { return $this->_m_body; }
    }
}

namespace Dtb {
    class FdtProp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Dtb\FdtNode $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenProperty = $this->_io->readU4be();
            $this->_m_ofsName = $this->_io->readU4be();
            $this->_m_property = $this->_io->readBytes($this->lenProperty());
            $this->_m_padding = $this->_io->readBytes(\Kaitai\Struct\Stream::mod(-($this->_io()->pos()), 4));
        }
        protected $_m_name;
        public function name() {
            if ($this->_m_name !== null)
                return $this->_m_name;
            $io = $this->_root()->stringsBlock()->_io();
            $_pos = $io->pos();
            $io->seek($this->ofsName());
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
            $io->seek($_pos);
            return $this->_m_name;
        }
        protected $_m_lenProperty;
        protected $_m_ofsName;
        protected $_m_property;
        protected $_m_padding;
        public function lenProperty() { return $this->_m_lenProperty; }
        public function ofsName() { return $this->_m_ofsName; }
        public function property() { return $this->_m_property; }
        public function padding() { return $this->_m_padding; }
    }
}

namespace Dtb {
    class MemoryBlock extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Dtb $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \Dtb\MemoryBlockEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Dtb {
    class MemoryBlockEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Dtb\MemoryBlock $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_address = $this->_io->readU8be();
            $this->_m_size = $this->_io->readU8be();
        }
        protected $_m_address;
        protected $_m_size;

        /**
         * physical address of a reserved memory region
         */
        public function address() { return $this->_m_address; }

        /**
         * size of a reserved memory region
         */
        public function size() { return $this->_m_size; }
    }
}

namespace Dtb {
    class Strings extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Dtb $_parent = null, ?\Dtb $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_strings = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_strings[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
                $i++;
            }
        }
        protected $_m_strings;
        public function strings() { return $this->_m_strings; }
    }
}

namespace Dtb {
    class Fdt {
        const BEGIN_NODE = 1;
        const END_NODE = 2;
        const PROP = 3;
        const NOP = 4;
        const END = 9;

        private const _VALUES = [1 => true, 2 => true, 3 => true, 4 => true, 9 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
