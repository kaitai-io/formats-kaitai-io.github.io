<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The Portable Image Format (PIF) is a basic, bitmap-like image format with the
 * focus on ease of use (implementation) and small size for embedded
 * applications.
 * 
 * See <https://github.com/gfcwfzkm/PIF-Image-Format> for more info.
 */

namespace {
    class Pif extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Pif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileHeader = new \Pif\PifHeader($this->_io, $this, $this->_root);
            $this->_m_infoHeader = new \Pif\InformationHeader($this->_io, $this, $this->_root);
            if ($this->infoHeader()->usesIndexedMode()) {
                $this->_m__raw_colorTable = $this->_io->readBytes($this->infoHeader()->lenColorTable());
                $_io__raw_colorTable = new \Kaitai\Struct\Stream($this->_m__raw_colorTable);
                $this->_m_colorTable = new \Pif\ColorTableData($_io__raw_colorTable, $this, $this->_root);
            }
        }
        protected $_m_imageData;
        public function imageData() {
            if ($this->_m_imageData !== null)
                return $this->_m_imageData;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->fileHeader()->ofsImageData());
            $this->_m_imageData = $this->_io->readBytes($this->infoHeader()->lenImageData());
            $this->_io->seek($_pos);
            return $this->_m_imageData;
        }
        protected $_m_fileHeader;
        protected $_m_infoHeader;
        protected $_m_colorTable;
        protected $_m__raw_colorTable;
        public function fileHeader() { return $this->_m_fileHeader; }
        public function infoHeader() { return $this->_m_infoHeader; }
        public function colorTable() { return $this->_m_colorTable; }
        public function _raw_colorTable() { return $this->_m__raw_colorTable; }
    }
}

namespace Pif {
    class PifHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Pif $_parent = null, \Pif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\x50\x49\x46\x00")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x50\x49\x46\x00", $this->magic(), $this->_io(), "/types/pif_header/seq/0");
            }
            $this->_m_lenFile = $this->_io->readU4le();
            if (!($this->lenFile() >= $this->ofsImageDataMin())) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError($this->ofsImageDataMin(), $this->lenFile(), $this->_io(), "/types/pif_header/seq/1");
            }
            $this->_m_ofsImageData = $this->_io->readU4le();
            if (!($this->ofsImageData() >= $this->ofsImageDataMin())) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError($this->ofsImageDataMin(), $this->ofsImageData(), $this->_io(), "/types/pif_header/seq/2");
            }
            if (!($this->ofsImageData() <= $this->lenFile())) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError($this->lenFile(), $this->ofsImageData(), $this->_io(), "/types/pif_header/seq/2");
            }
        }
        protected $_m_ofsImageDataMin;
        public function ofsImageDataMin() {
            if ($this->_m_ofsImageDataMin !== null)
                return $this->_m_ofsImageDataMin;
            $this->_m_ofsImageDataMin = (12 + 16);
            return $this->_m_ofsImageDataMin;
        }
        protected $_m_magic;
        protected $_m_lenFile;
        protected $_m_ofsImageData;
        public function magic() { return $this->_m_magic; }
        public function lenFile() { return $this->_m_lenFile; }
        public function ofsImageData() { return $this->_m_ofsImageData; }
    }
}

namespace Pif {
    class InformationHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Pif $_parent = null, \Pif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_imageType = $this->_io->readU2le();
            if (!( (($this->imageType() == \Pif\ImageType::RGB888) || ($this->imageType() == \Pif\ImageType::RGB565) || ($this->imageType() == \Pif\ImageType::RGB332) || ($this->imageType() == \Pif\ImageType::RGB16C) || ($this->imageType() == \Pif\ImageType::BLACK_WHITE) || ($this->imageType() == \Pif\ImageType::INDEXED_RGB888) || ($this->imageType() == \Pif\ImageType::INDEXED_RGB565) || ($this->imageType() == \Pif\ImageType::INDEXED_RGB332)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->imageType(), $this->_io(), "/types/information_header/seq/0");
            }
            $this->_m_bitsPerPixel = $this->_io->readU2le();
            $_ = $this->bitsPerPixel();
            if (!(($this->imageType() == \Pif\ImageType::RGB888 ? $_ == 24 : ($this->imageType() == \Pif\ImageType::RGB565 ? $_ == 16 : ($this->imageType() == \Pif\ImageType::RGB332 ? $_ == 8 : ($this->imageType() == \Pif\ImageType::RGB16C ? $_ == 4 : ($this->imageType() == \Pif\ImageType::BLACK_WHITE ? $_ == 1 : ($this->usesIndexedMode() ? $_ <= 8 : true)))))))) {
                throw new \Kaitai\Struct\Error\ValidationExprError($this->bitsPerPixel(), $this->_io(), "/types/information_header/seq/1");
            }
            $this->_m_width = $this->_io->readU2le();
            $this->_m_height = $this->_io->readU2le();
            $this->_m_lenImageData = $this->_io->readU4le();
            if (!($this->lenImageData() <= ($this->_root()->fileHeader()->lenFile() - $this->_root()->fileHeader()->ofsImageData()))) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(($this->_root()->fileHeader()->lenFile() - $this->_root()->fileHeader()->ofsImageData()), $this->lenImageData(), $this->_io(), "/types/information_header/seq/4");
            }
            $this->_m_lenColorTable = $this->_io->readU2le();
            if (!($this->lenColorTable() >= ($this->usesIndexedMode() ? ($this->lenColorTableEntry() * 1) : 0))) {
                throw new \Kaitai\Struct\Error\ValidationLessThanError(($this->usesIndexedMode() ? ($this->lenColorTableEntry() * 1) : 0), $this->lenColorTable(), $this->_io(), "/types/information_header/seq/5");
            }
            if (!($this->lenColorTable() <= ($this->usesIndexedMode() ? ($this->lenColorTableMax() < $this->lenColorTableFull() ? $this->lenColorTableMax() : $this->lenColorTableFull()) : 0))) {
                throw new \Kaitai\Struct\Error\ValidationGreaterThanError(($this->usesIndexedMode() ? ($this->lenColorTableMax() < $this->lenColorTableFull() ? $this->lenColorTableMax() : $this->lenColorTableFull()) : 0), $this->lenColorTable(), $this->_io(), "/types/information_header/seq/5");
            }
            $this->_m_compression = $this->_io->readU2le();
            if (!( (($this->compression() == \Pif\CompressionType::NONE) || ($this->compression() == \Pif\CompressionType::RLE)) )) {
                throw new \Kaitai\Struct\Error\ValidationNotAnyOfError($this->compression(), $this->_io(), "/types/information_header/seq/6");
            }
        }
        protected $_m_lenColorTableFull;
        public function lenColorTableFull() {
            if ($this->_m_lenColorTableFull !== null)
                return $this->_m_lenColorTableFull;
            $this->_m_lenColorTableFull = ($this->lenColorTableEntry() * (1 << $this->bitsPerPixel()));
            return $this->_m_lenColorTableFull;
        }
        protected $_m_lenColorTableMax;
        public function lenColorTableMax() {
            if ($this->_m_lenColorTableMax !== null)
                return $this->_m_lenColorTableMax;
            $this->_m_lenColorTableMax = ($this->_root()->fileHeader()->ofsImageData() - $this->_root()->fileHeader()->ofsImageDataMin());
            return $this->_m_lenColorTableMax;
        }
        protected $_m_numColorTableEntries;
        public function numColorTableEntries() {
            if ($this->_m_numColorTableEntries !== null)
                return $this->_m_numColorTableEntries;
            if ($this->usesIndexedMode()) {
                $this->_m_numColorTableEntries = intval($this->lenColorTable() / $this->lenColorTableEntry());
            }
            return $this->_m_numColorTableEntries;
        }
        protected $_m_lenColorTableEntry;
        public function lenColorTableEntry() {
            if ($this->_m_lenColorTableEntry !== null)
                return $this->_m_lenColorTableEntry;
            $this->_m_lenColorTableEntry = ($this->imageType() == \Pif\ImageType::INDEXED_RGB888 ? 3 : ($this->imageType() == \Pif\ImageType::INDEXED_RGB565 ? 2 : ($this->imageType() == \Pif\ImageType::INDEXED_RGB332 ? 1 : 0)));
            return $this->_m_lenColorTableEntry;
        }
        protected $_m_usesIndexedMode;
        public function usesIndexedMode() {
            if ($this->_m_usesIndexedMode !== null)
                return $this->_m_usesIndexedMode;
            $this->_m_usesIndexedMode = $this->lenColorTableEntry() != 0;
            return $this->_m_usesIndexedMode;
        }
        protected $_m_imageType;
        protected $_m_bitsPerPixel;
        protected $_m_width;
        protected $_m_height;
        protected $_m_lenImageData;
        protected $_m_lenColorTable;
        protected $_m_compression;
        public function imageType() { return $this->_m_imageType; }

        /**
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/cc256d5/Specification/PIF%20Format%20Specification.pdf>:
         * 
         * > Bits per Pixel: Bit size that each Pixel occupies. Bit size for an
         * > Indexed Image cannot go beyond 8 bits.
         */
        public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
        public function width() { return $this->_m_width; }
        public function height() { return $this->_m_height; }
        public function lenImageData() { return $this->_m_lenImageData; }

        /**
         * See <https://github.com/gfcwfzkm/PIF-Image-Format/blob/cc256d5/Specification/PIF%20Format%20Specification.pdf>:
         * 
         * > Color Table Size: (...), only used in Indexed mode, otherwise zero.
         * ---
         * > **Note**: The presence of the Color Table is mandatory when Bits per
         * > Pixel <= 8, unless Image Type states RGB332, RGB16C or B/W
         * ---
         * > **Color Table** (semi-optional)
         * >
         * > (...) The amount of Colors has to be same or less than [Bits per
         * > Pixel] allow, otherwise the image is invalid.
         */
        public function lenColorTable() { return $this->_m_lenColorTable; }
        public function compression() { return $this->_m_compression; }
    }
}

namespace Pif {
    class ColorTableData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Pif $_parent = null, \Pif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_entries = [];
            $n = $this->_root()->infoHeader()->numColorTableEntries();
            for ($i = 0; $i < $n; $i++) {
                switch ($this->_root()->infoHeader()->imageType()) {
                    case \Pif\ImageType::INDEXED_RGB888:
                        $this->_m_entries[] = $this->_io->readBitsIntLe(24);
                        break;
                    case \Pif\ImageType::INDEXED_RGB565:
                        $this->_m_entries[] = $this->_io->readBitsIntLe(16);
                        break;
                    case \Pif\ImageType::INDEXED_RGB332:
                        $this->_m_entries[] = $this->_io->readBitsIntLe(8);
                        break;
                }
            }
        }
        protected $_m_entries;
        public function entries() { return $this->_m_entries; }
    }
}

namespace Pif {
    class ImageType {
        const RGB332 = 7763;
        const RGB888 = 17212;
        const INDEXED_RGB332 = 18754;
        const INDEXED_RGB565 = 18759;
        const INDEXED_RGB888 = 18770;

        /**
         * 0: black, 1: white
         */
        const BLACK_WHITE = 32170;

        /**
         * Formula to convert the 4-bit color value in RGB16C mode to RGB values
         * (each in the range from 0 to 255):
         * 
         * ```
         * red   = 170 * ((color_value & 0b0100) >> 2) + 85 * ((color_value & 0b1000) >> 3)
         * green = 170 * ((color_value & 0b0010) >> 1) + 85 * ((color_value & 0b1000) >> 3)
         * blue  = 170 * ((color_value & 0b0001) >> 0) + 85 * ((color_value & 0b1000) >> 3)
         * ```
         * 
         * See also <https://en.wikipedia.org/wiki/Color_Graphics_Adapter#Color_palette>
         */
        const RGB16C = 47253;
        const RGB565 = 58821;
    }
}

namespace Pif {
    class CompressionType {
        const NONE = 0;
        const RLE = 32222;
    }
}
