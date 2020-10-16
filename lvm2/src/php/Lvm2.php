<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * ### Building a test file
 * 
 * ```
 * dd if=/dev/zero of=image.img bs=512 count=$(( 4 * 1024 * 2 ))
 * sudo losetup /dev/loop1 image.img
 * sudo pvcreate /dev/loop1
 * sudo vgcreate vg_test /dev/loop1
 * sudo lvcreate --name lv_test1 vg_test
 * sudo losetup -d /dev/loop1
 * ```
 */

namespace {
    class Lvm2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_pv = new \Lvm2\PhysicalVolume($this->_io, $this, $this->_root);
        }
        protected $_m_sectorSize;
        public function sectorSize() {
            if ($this->_m_sectorSize !== null)
                return $this->_m_sectorSize;
            $this->_m_sectorSize = 512;
            return $this->_m_sectorSize;
        }
        protected $_m_pv;

        /**
         * Physical volume
         */
        public function pv() { return $this->_m_pv; }
    }
}

namespace Lvm2 {
    class PhysicalVolume extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2 $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_emptySector = $this->_io->readBytes($this->_root()->sectorSize());
            $this->_m_label = new \Lvm2\PhysicalVolume\Label($this->_io, $this, $this->_root);
        }
        protected $_m_emptySector;
        protected $_m_label;
        public function emptySector() { return $this->_m_emptySector; }
        public function label() { return $this->_m_label; }
    }
}

namespace Lvm2\PhysicalVolume {
    class Label extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_labelHeader = new \Lvm2\PhysicalVolume\Label\LabelHeader($this->_io, $this, $this->_root);
            $this->_m_volumeHeader = new \Lvm2\PhysicalVolume\Label\VolumeHeader($this->_io, $this, $this->_root);
        }
        protected $_m_labelHeader;
        protected $_m_volumeHeader;
        public function labelHeader() { return $this->_m_labelHeader; }
        public function volumeHeader() { return $this->_m_volumeHeader; }
    }
}

namespace Lvm2\PhysicalVolume\Label {
    class LabelHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume\Label $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_signature = $this->_io->readBytes(8);
            if (!($this->signature() == "\x4C\x41\x42\x45\x4C\x4F\x4E\x45")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4C\x41\x42\x45\x4C\x4F\x4E\x45", $this->signature(), $this->_io(), "/types/physical_volume/types/label/types/label_header/seq/0");
            }
            $this->_m_sectorNumber = $this->_io->readU8le();
            $this->_m_checksum = $this->_io->readU4le();
            $this->_m_labelHeader = new \Lvm2\PhysicalVolume\Label\LabelHeader\LabelHeader($this->_io, $this, $this->_root);
        }
        protected $_m_signature;
        protected $_m_sectorNumber;
        protected $_m_checksum;
        protected $_m_labelHeader;
        public function signature() { return $this->_m_signature; }

        /**
         * The sector number of the physical volume label header
         */
        public function sectorNumber() { return $this->_m_sectorNumber; }

        /**
         * CRC-32 for offset 20 to end of the physical volume label sector
         */
        public function checksum() { return $this->_m_checksum; }
        public function labelHeader() { return $this->_m_labelHeader; }
    }
}

namespace Lvm2\PhysicalVolume\Label\LabelHeader {
    class LabelHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume\Label\LabelHeader $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_dataOffset = $this->_io->readU4le();
            $this->_m_typeIndicator = $this->_io->readBytes(8);
            if (!($this->typeIndicator() == "\x4C\x56\x4D\x32\x20\x30\x30\x31")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4C\x56\x4D\x32\x20\x30\x30\x31", $this->typeIndicator(), $this->_io(), "/types/physical_volume/types/label/types/label_header/types/label_header_/seq/1");
            }
        }
        protected $_m_dataOffset;
        protected $_m_typeIndicator;

        /**
         * The offset, in bytes, relative from the start of the physical volume label header where data is stored
         */
        public function dataOffset() { return $this->_m_dataOffset; }
        public function typeIndicator() { return $this->_m_typeIndicator; }
    }
}

namespace Lvm2\PhysicalVolume\Label {
    class VolumeHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume\Label $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_id = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(32), "ascii");
            $this->_m_size = $this->_io->readU8le();
            $this->_m_dataAreaDescriptors = [];
            $i = 0;
            do {
                $_ = new \Lvm2\PhysicalVolume\Label\VolumeHeader\DataAreaDescriptor($this->_io, $this, $this->_root);
                $this->_m_dataAreaDescriptors[] = $_;
                $i++;
            } while (!( (($_->size() != 0) && ($_->offset() != 0)) ));
            $this->_m_metadataAreaDescriptors = [];
            $i = 0;
            do {
                $_ = new \Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataAreaDescriptor($this->_io, $this, $this->_root);
                $this->_m_metadataAreaDescriptors[] = $_;
                $i++;
            } while (!( (($_->size() != 0) && ($_->offset() != 0)) ));
        }
        protected $_m_id;
        protected $_m_size;
        protected $_m_dataAreaDescriptors;
        protected $_m_metadataAreaDescriptors;

        /**
         * Contains a UUID stored as an ASCII string. The physical volume identifier can be used to uniquely identify a physical volume. The physical volume identifier is stored as: 9LBcEB7PQTGIlLI0KxrtzrynjuSL983W but is equivalent to its formatted variant: 9LBcEB-7PQT-GIlL-I0Kx-rtzr-ynju-SL983W, which is used in the metadata.
         */
        public function id() { return $this->_m_id; }

        /**
         * Physical Volume size. Value in bytes
         */
        public function size() { return $this->_m_size; }

        /**
         * The last descriptor in the list is terminator and consists of 0-byte values.
         */
        public function dataAreaDescriptors() { return $this->_m_dataAreaDescriptors; }
        public function metadataAreaDescriptors() { return $this->_m_metadataAreaDescriptors; }
    }
}

namespace Lvm2\PhysicalVolume\Label\VolumeHeader {
    class DataAreaDescriptor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume\Label\VolumeHeader $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readU8le();
            $this->_m_size = $this->_io->readU8le();
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            if ($this->size() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->offset());
                $this->_m_data = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->size()), "ascii");
                $this->_io->seek($_pos);
            }
            return $this->_m_data;
        }
        protected $_m_offset;
        protected $_m_size;

        /**
         * The offset, in bytes, relative from the start of the physical volume
         */
        public function offset() { return $this->_m_offset; }

        /**
         * Value in bytes. Can be 0. [yellow-background]*Does this represent all remaining available space?*
         */
        public function size() { return $this->_m_size; }
    }
}

namespace Lvm2\PhysicalVolume\Label\VolumeHeader {
    class MetadataAreaDescriptor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume\Label\VolumeHeader $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readU8le();
            $this->_m_size = $this->_io->readU8le();
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            if ($this->size() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->offset());
                $this->_m__raw_data = $this->_io->readBytes($this->size());
                $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                $this->_m_data = new \Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea($_io__raw_data, $this, $this->_root);
                $this->_io->seek($_pos);
            }
            return $this->_m_data;
        }
        protected $_m_offset;
        protected $_m_size;
        protected $_m__raw_data;

        /**
         * The offset, in bytes, relative from the start of the physical volume
         */
        public function offset() { return $this->_m_offset; }

        /**
         * Value in bytes
         */
        public function size() { return $this->_m_size; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

/**
 * According to `[REDHAT]` the metadata area is a circular buffer. New metadata is appended to the old metadata and then the pointer to the start of it is updated. The metadata area, therefore, can contain copies of older versions of the metadata.
 */

namespace Lvm2\PhysicalVolume\Label\VolumeHeader {
    class MetadataArea extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataAreaDescriptor $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea\MetadataAreaHeader($this->_io, $this, $this->_root);
        }
        protected $_m_header;
        public function header() { return $this->_m_header; }
    }
}

namespace Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea {
    class MetadataAreaHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_checksum = new \Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea\MetadataAreaHeader($this->_io, $this, $this->_root);
            $this->_m_signature = $this->_io->readBytes(16);
            if (!($this->signature() == "\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x20\x4C\x56\x4D\x32\x20\x78\x5B\x35\x41\x25\x72\x30\x4E\x2A\x3E", $this->signature(), $this->_io(), "/types/physical_volume/types/label/types/volume_header/types/metadata_area/types/metadata_area_header/seq/1");
            }
            $this->_m_version = $this->_io->readU4le();
            $this->_m_metadataAreaOffset = $this->_io->readU8le();
            $this->_m_metadataAreaSize = $this->_io->readU8le();
            $this->_m_rawLocationDescriptors = [];
            $i = 0;
            do {
                $_ = new \Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea\MetadataAreaHeader\RawLocationDescriptor($this->_io, $this, $this->_root);
                $this->_m_rawLocationDescriptors[] = $_;
                $i++;
            } while (!( (($_->offset() != 0) && ($_->size() != 0) && ($_->checksum() != 0)) ));
        }
        protected $_m_metadata;
        public function metadata() {
            if ($this->_m_metadata !== null)
                return $this->_m_metadata;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->metadataAreaOffset());
            $this->_m_metadata = $this->_io->readBytes($this->metadataAreaSize());
            $this->_io->seek($_pos);
            return $this->_m_metadata;
        }
        protected $_m_checksum;
        protected $_m_signature;
        protected $_m_version;
        protected $_m_metadataAreaOffset;
        protected $_m_metadataAreaSize;
        protected $_m_rawLocationDescriptors;

        /**
         * CRC-32 for offset 4 to end of the metadata area header
         */
        public function checksum() { return $this->_m_checksum; }
        public function signature() { return $this->_m_signature; }
        public function version() { return $this->_m_version; }

        /**
         * The offset, in bytes, of the metadata area relative from the start of the physical volume
         */
        public function metadataAreaOffset() { return $this->_m_metadataAreaOffset; }
        public function metadataAreaSize() { return $this->_m_metadataAreaSize; }

        /**
         * The last descriptor in the list is terminator and consists of 0-byte values.
         */
        public function rawLocationDescriptors() { return $this->_m_rawLocationDescriptors; }
    }
}

/**
 * The data area size can be 0. It is assumed it represents the remaining  available data.
 */

namespace Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea\MetadataAreaHeader {
    class RawLocationDescriptor extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea\MetadataAreaHeader $_parent = null, \Lvm2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_offset = $this->_io->readU8le();
            $this->_m_size = $this->_io->readU8le();
            $this->_m_checksum = $this->_io->readU4le();
            $this->_m_flags = $this->_io->readU4le();
        }
        protected $_m_offset;
        protected $_m_size;
        protected $_m_checksum;
        protected $_m_flags;

        /**
         * The data area offset, in bytes, relative from the start of the metadata area
         */
        public function offset() { return $this->_m_offset; }

        /**
         * data area size in bytes
         */
        public function size() { return $this->_m_size; }

        /**
         * CRC-32 of *TODO (metadata?)*
         */
        public function checksum() { return $this->_m_checksum; }
        public function flags() { return $this->_m_flags; }
    }
}

namespace Lvm2\PhysicalVolume\Label\VolumeHeader\MetadataArea\MetadataAreaHeader\RawLocationDescriptor {
    class RawLocationDescriptorFlags {
        const RAW_LOCATION_IGNORED = 1;
    }
}
