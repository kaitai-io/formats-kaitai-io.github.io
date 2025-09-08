<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
 * 
 * * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
 *   [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
 * 
 * [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
 * [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
 * 
 * All image versions can be found in factory images at
 * <https://developers.google.com/android/images> for the specific device. To
 * avoid having to download an entire ZIP archive when you only need one file
 * from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
 * use its [command line
 * tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
 * members in the archive and then to download only the file you want.
 */

namespace {
    class AndroidBootldrHuawei extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\AndroidBootldrHuawei $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_metaHeader = new \AndroidBootldrHuawei\MetaHdr($this->_io, $this, $this->_root);
            $this->_m_headerExt = $this->_io->readBytes($this->metaHeader()->lenMetaHeader() - 76);
            $this->_m__raw_imageHeader = $this->_io->readBytes($this->metaHeader()->lenImageHeader());
            $_io__raw_imageHeader = new \Kaitai\Struct\Stream($this->_m__raw_imageHeader);
            $this->_m_imageHeader = new \AndroidBootldrHuawei\ImageHdr($_io__raw_imageHeader, $this, $this->_root);
        }
        protected $_m_metaHeader;
        protected $_m_headerExt;
        protected $_m_imageHeader;
        protected $_m__raw_imageHeader;
        public function metaHeader() { return $this->_m_metaHeader; }
        public function headerExt() { return $this->_m_headerExt; }
        public function imageHeader() { return $this->_m_imageHeader; }
        public function _raw_imageHeader() { return $this->_m__raw_imageHeader; }
    }
}

namespace AndroidBootldrHuawei {
    class ImageHdr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidBootldrHuawei $_parent = null, ?\AndroidBootldrHuawei $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_entries[] = new \AndroidBootldrHuawei\ImageHdrEntry($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_entries;

        /**
         * The C generator program defines `img_header` as a [fixed size
         * array](https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n42)
         * of `img_header_entry_t` structs with length `MAX_IMAGES` (which is
         * defined as `16`).
         * 
         * This means that technically there will always be 16 `image_hdr`
         * entries, the first *n* entries being used (filled with real values)
         * and the rest left unused with all bytes zero.
         * 
         * To check if an entry is used, use the `is_used` attribute.
         */
        public function entries() { return $this->_m_entries; }
    }
}

namespace AndroidBootldrHuawei {
    class ImageHdrEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidBootldrHuawei\ImageHdr $_parent = null, ?\AndroidBootldrHuawei $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(72), 0, false), "ASCII");
            $this->_m_ofsBody = $this->_io->readU4le();
            $this->_m_lenBody = $this->_io->readU4le();
        }
        protected $_m_body;
        public function body() {
            if ($this->_m_body !== null)
                return $this->_m_body;
            if ($this->isUsed()) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek($this->ofsBody());
                $this->_m_body = $io->readBytes($this->lenBody());
                $io->seek($_pos);
            }
            return $this->_m_body;
        }
        protected $_m_isUsed;
        public function isUsed() {
            if ($this->_m_isUsed !== null)
                return $this->_m_isUsed;
            $this->_m_isUsed =  (($this->ofsBody() != 0) && ($this->lenBody() != 0)) ;
            return $this->_m_isUsed;
        }
        protected $_m_name;
        protected $_m_ofsBody;
        protected $_m_lenBody;

        /**
         * partition name
         */
        public function name() { return $this->_m_name; }
        public function ofsBody() { return $this->_m_ofsBody; }
        public function lenBody() { return $this->_m_lenBody; }
    }
}

namespace AndroidBootldrHuawei {
    class MetaHdr extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidBootldrHuawei $_parent = null, ?\AndroidBootldrHuawei $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x3C\xD6\x1A\xCE")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x3C\xD6\x1A\xCE", $this->_m_magic, $this->_io, "/types/meta_hdr/seq/0");
            }
            $this->_m_version = new \AndroidBootldrHuawei\Version($this->_io, $this, $this->_root);
            $this->_m_imageVersion = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(64), 0, false), "ASCII");
            $this->_m_lenMetaHeader = $this->_io->readU2le();
            $this->_m_lenImageHeader = $this->_io->readU2le();
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_imageVersion;
        protected $_m_lenMetaHeader;
        protected $_m_lenImageHeader;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
        public function imageVersion() { return $this->_m_imageVersion; }
        public function lenMetaHeader() { return $this->_m_lenMetaHeader; }
        public function lenImageHeader() { return $this->_m_lenImageHeader; }
    }
}

namespace AndroidBootldrHuawei {
    class Version extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\AndroidBootldrHuawei\MetaHdr $_parent = null, ?\AndroidBootldrHuawei $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_major = $this->_io->readU2le();
            $this->_m_minor = $this->_io->readU2le();
        }
        protected $_m_major;
        protected $_m_minor;
        public function major() { return $this->_m_major; }
        public function minor() { return $this->_m_minor; }
    }
}
