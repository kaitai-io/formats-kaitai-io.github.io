<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
 * storing imagery, e.g. from satellites.
 * 
 * According to the [foreword of the specification](https://gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
 * > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
 * > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
 * > defined by the Executive Order 12333, and other United States Government departments and agencies."
 * 
 * This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
 * It was implemented by [River Loop Security](https://riverloopsecurity.com).
 */

namespace {
    class Nitf extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \Nitf\Header($this->_io, $this, $this->_root);
            $this->_m_imageSegments = [];
            $n = intval($this->header()->numImageSegments(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_imageSegments[] = new \Nitf\ImageSegment($i, $this->_io, $this, $this->_root);
            }
            $this->_m_graphicsSegments = [];
            $n = intval($this->header()->numGraphicsSegments(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_graphicsSegments[] = new \Nitf\GraphicsSegment($i, $this->_io, $this, $this->_root);
            }
            $this->_m_textSegments = [];
            $n = intval($this->header()->numTextFiles(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_textSegments[] = new \Nitf\TextSegment($i, $this->_io, $this, $this->_root);
            }
            $this->_m_dataExtensionSegments = [];
            $n = intval($this->header()->numDataExtension(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_dataExtensionSegments[] = new \Nitf\DataExtensionSegment($i, $this->_io, $this, $this->_root);
            }
            $this->_m_reservedExtensionSegments = [];
            $n = intval($this->header()->numReservedExtension(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_reservedExtensionSegments[] = new \Nitf\ReservedExtensionSegment($i, $this->_io, $this, $this->_root);
            }
        }
        protected $_m_header;
        protected $_m_imageSegments;
        protected $_m_graphicsSegments;
        protected $_m_textSegments;
        protected $_m_dataExtensionSegments;
        protected $_m_reservedExtensionSegments;
        public function header() { return $this->_m_header; }
        public function imageSegments() { return $this->_m_imageSegments; }
        public function graphicsSegments() { return $this->_m_graphicsSegments; }
        public function textSegments() { return $this->_m_textSegments; }
        public function dataExtensionSegments() { return $this->_m_dataExtensionSegments; }
        public function reservedExtensionSegments() { return $this->_m_reservedExtensionSegments; }
    }
}

namespace Nitf {
    class ReservedExtensionSegment extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, \Nitf $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_reservedSubHeader = $this->_io->readBytes(intval($this->_parent()->header()->lrnfo()[$this->idx()]->lengthReservedExtensionSubheader(), 10));
            $_io__raw_reservedSubHeader = new \Kaitai\Struct\Stream($this->_m__raw_reservedSubHeader);
            $this->_m_reservedSubHeader = new \Nitf\ReservedSubHeader($_io__raw_reservedSubHeader, $this, $this->_root);
            $this->_m_reservedDataField = $this->_io->readBytes(intval($this->_parent()->header()->lrnfo()[$this->idx()]->lengthReservedExtensionSegment(), 10));
        }
        protected $_m_reservedSubHeader;
        protected $_m_reservedDataField;
        protected $_m_idx;
        protected $_m__raw_reservedSubHeader;
        public function reservedSubHeader() { return $this->_m_reservedSubHeader; }
        public function reservedDataField() { return $this->_m_reservedDataField; }
        public function idx() { return $this->_m_idx; }
        public function _raw_reservedSubHeader() { return $this->_m__raw_reservedSubHeader; }
    }
}

namespace Nitf {
    class ImageComment extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\ImageSubHeader $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__unnamed0 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(80), "UTF-8");
        }
        protected $_m__unnamed0;
        public function _unnamed0() { return $this->_m__unnamed0; }
    }
}

namespace Nitf {
    class LengthReservedInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\Header $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lengthReservedExtensionSubheader = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_lengthReservedExtensionSegment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(7), "UTF-8");
        }
        protected $_m_lengthReservedExtensionSubheader;
        protected $_m_lengthReservedExtensionSegment;
        public function lengthReservedExtensionSubheader() { return $this->_m_lengthReservedExtensionSubheader; }
        public function lengthReservedExtensionSegment() { return $this->_m_lengthReservedExtensionSegment; }
    }
}

namespace Nitf {
    class Tre extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_extensionTypeId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "UTF-8");
            $this->_m_edataLength = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
            $this->_m_edata = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(intval($this->edataLength(), 10)), "UTF-8");
        }
        protected $_m_extensionTypeId;
        protected $_m_edataLength;
        protected $_m_edata;

        /**
         * RETAG or CETAG
         */
        public function extensionTypeId() { return $this->_m_extensionTypeId; }

        /**
         * REL or CEL
         */
        public function edataLength() { return $this->_m_edataLength; }

        /**
         * REDATA or CEDATA
         */
        public function edata() { return $this->_m_edata; }
    }
}

namespace Nitf {
    class BandInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\ImageSubHeader $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_representation = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_subcategory = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "UTF-8");
            $this->_m_imgFilterCondition = $this->_io->readBytes(1);
            if (!($this->imgFilterCondition() == "\x4E")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4E", $this->imgFilterCondition(), $this->_io(), "/types/band_info/seq/2");
            }
            $this->_m_imgFilterCode = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_numLuts = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            if (intval($this->numLuts(), 10) != 0) {
                $this->_m_numLutEntries = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
            }
            $this->_m_luts = [];
            $n = intval($this->numLuts(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_luts[] = $this->_io->readBytes(intval($this->numLutEntries(), 10));
            }
        }
        protected $_m_representation;
        protected $_m_subcategory;
        protected $_m_imgFilterCondition;
        protected $_m_imgFilterCode;
        protected $_m_numLuts;
        protected $_m_numLutEntries;
        protected $_m_luts;

        /**
         * Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
         */
        public function representation() { return $this->_m_representation; }
        public function subcategory() { return $this->_m_subcategory; }
        public function imgFilterCondition() { return $this->_m_imgFilterCondition; }

        /**
         * Reserved
         */
        public function imgFilterCode() { return $this->_m_imgFilterCode; }
        public function numLuts() { return $this->_m_numLuts; }

        /**
         * Number of entries in each of the LUTs for the nth image band
         */
        public function numLutEntries() { return $this->_m_numLutEntries; }
        public function luts() { return $this->_m_luts; }
    }
}

namespace Nitf {
    class ImageSegment extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, \Nitf $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m_imageSubHeader = new \Nitf\ImageSubHeader($this->_io, $this, $this->_root);
            if ($this->hasMask()) {
                $this->_m_imageDataMask = new \Nitf\ImageDataMask($this->_io, $this, $this->_root);
            }
            if ($this->hasMask()) {
                $this->_m_imageDataField = $this->_io->readBytes((intval($this->_parent()->header()->linfo()[$this->idx()]->lengthImageSegment(), 10) - $this->imageDataMask()->totalSize()));
            }
        }
        protected $_m_hasMask;
        public function hasMask() {
            if ($this->_m_hasMask !== null)
                return $this->_m_hasMask;
            $this->_m_hasMask = \Kaitai\Struct\Stream::substring($this->imageSubHeader()->imgCompression(), 0, 2) == "MM";
            return $this->_m_hasMask;
        }
        protected $_m_imageSubHeader;
        protected $_m_imageDataMask;
        protected $_m_imageDataField;
        protected $_m_idx;
        public function imageSubHeader() { return $this->_m_imageSubHeader; }
        public function imageDataMask() { return $this->_m_imageDataMask; }
        public function imageDataField() { return $this->_m_imageDataField; }
        public function idx() { return $this->_m_idx; }
    }
}

namespace Nitf {
    class TextSegment extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, \Nitf $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m_textSubHeader = $this->_io->readBytes(1);
            $this->_m_textDataField = $this->_io->readBytes(intval($this->_parent()->header()->ltnfo()[$this->idx()]->lengthTextSegment(), 10));
        }
        protected $_m_textSubHeader;
        protected $_m_textDataField;
        protected $_m_idx;
        public function textSubHeader() { return $this->_m_textSubHeader; }
        public function textDataField() { return $this->_m_textDataField; }
        public function idx() { return $this->_m_idx; }
    }
}

namespace Nitf {
    class GraphicSubHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\GraphicsSegment $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_filePartTypeSy = $this->_io->readBytes(2);
            if (!($this->filePartTypeSy() == "\x53\x59")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x53\x59", $this->filePartTypeSy(), $this->_io(), "/types/graphic_sub_header/seq/0");
            }
            $this->_m_graphicId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
            $this->_m_graphicName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(20), "UTF-8");
            $this->_m_graphicClassification = new \Nitf\Clasnfo($this->_io, $this, $this->_root);
            $this->_m_encryption = new \Nitf\Encrypt($this->_io, $this, $this->_root);
            $this->_m_graphicType = $this->_io->readBytes(1);
            if (!($this->graphicType() == "\x43")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x43", $this->graphicType(), $this->_io(), "/types/graphic_sub_header/seq/5");
            }
            $this->_m_reserved1 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(13), "UTF-8");
            $this->_m_graphicDisplayLevel = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_graphicAttachmentLevel = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_graphicLocation = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
            $this->_m_firstGraphicBoundLoc = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
            $this->_m_graphicColor = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_secondGraphicBoundLoc = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
            $this->_m_reserved2 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_graphicsExtendedSubHeader = new \Nitf\TreHeader($this->_io, $this, $this->_root);
        }
        protected $_m_filePartTypeSy;
        protected $_m_graphicId;
        protected $_m_graphicName;
        protected $_m_graphicClassification;
        protected $_m_encryption;
        protected $_m_graphicType;
        protected $_m_reserved1;
        protected $_m_graphicDisplayLevel;
        protected $_m_graphicAttachmentLevel;
        protected $_m_graphicLocation;
        protected $_m_firstGraphicBoundLoc;
        protected $_m_graphicColor;
        protected $_m_secondGraphicBoundLoc;
        protected $_m_reserved2;
        protected $_m_graphicsExtendedSubHeader;
        public function filePartTypeSy() { return $this->_m_filePartTypeSy; }
        public function graphicId() { return $this->_m_graphicId; }
        public function graphicName() { return $this->_m_graphicName; }
        public function graphicClassification() { return $this->_m_graphicClassification; }
        public function encryption() { return $this->_m_encryption; }
        public function graphicType() { return $this->_m_graphicType; }

        /**
         * Reserved
         */
        public function reserved1() { return $this->_m_reserved1; }
        public function graphicDisplayLevel() { return $this->_m_graphicDisplayLevel; }
        public function graphicAttachmentLevel() { return $this->_m_graphicAttachmentLevel; }
        public function graphicLocation() { return $this->_m_graphicLocation; }
        public function firstGraphicBoundLoc() { return $this->_m_firstGraphicBoundLoc; }
        public function graphicColor() { return $this->_m_graphicColor; }
        public function secondGraphicBoundLoc() { return $this->_m_secondGraphicBoundLoc; }

        /**
         * Reserved
         */
        public function reserved2() { return $this->_m_reserved2; }
        public function graphicsExtendedSubHeader() { return $this->_m_graphicsExtendedSubHeader; }
    }
}

namespace Nitf {
    class Clasnfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_securityClass = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_securitySystem = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_codewords = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(11), "UTF-8");
            $this->_m_controlAndHandling = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_releaseability = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(20), "UTF-8");
            $this->_m_declassType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_declassDate = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "UTF-8");
            $this->_m_declassExemption = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_downgrade = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_downgradeDate = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "UTF-8");
            $this->_m_classText = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(43), "UTF-8");
            $this->_m_classAuthorityType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_classAuthority = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(40), "UTF-8");
            $this->_m_classReason = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_sourceDate = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "UTF-8");
            $this->_m_controlNumber = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(15), "UTF-8");
        }
        protected $_m_securityClass;
        protected $_m_securitySystem;
        protected $_m_codewords;
        protected $_m_controlAndHandling;
        protected $_m_releaseability;
        protected $_m_declassType;
        protected $_m_declassDate;
        protected $_m_declassExemption;
        protected $_m_downgrade;
        protected $_m_downgradeDate;
        protected $_m_classText;
        protected $_m_classAuthorityType;
        protected $_m_classAuthority;
        protected $_m_classReason;
        protected $_m_sourceDate;
        protected $_m_controlNumber;
        public function securityClass() { return $this->_m_securityClass; }
        public function securitySystem() { return $this->_m_securitySystem; }
        public function codewords() { return $this->_m_codewords; }
        public function controlAndHandling() { return $this->_m_controlAndHandling; }
        public function releaseability() { return $this->_m_releaseability; }
        public function declassType() { return $this->_m_declassType; }
        public function declassDate() { return $this->_m_declassDate; }
        public function declassExemption() { return $this->_m_declassExemption; }
        public function downgrade() { return $this->_m_downgrade; }
        public function downgradeDate() { return $this->_m_downgradeDate; }
        public function classText() { return $this->_m_classText; }
        public function classAuthorityType() { return $this->_m_classAuthorityType; }
        public function classAuthority() { return $this->_m_classAuthority; }
        public function classReason() { return $this->_m_classReason; }
        public function sourceDate() { return $this->_m_sourceDate; }
        public function controlNumber() { return $this->_m_controlNumber; }
    }
}

namespace Nitf {
    class LengthGraphicInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\Header $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lengthGraphicSubheader = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_lengthGraphicSegment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "UTF-8");
        }
        protected $_m_lengthGraphicSubheader;
        protected $_m_lengthGraphicSegment;
        public function lengthGraphicSubheader() { return $this->_m_lengthGraphicSubheader; }
        public function lengthGraphicSegment() { return $this->_m_lengthGraphicSegment; }
    }
}

namespace Nitf {
    class Encrypt extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__unnamed0 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
        }
        protected $_m__unnamed0;
        public function _unnamed0() { return $this->_m__unnamed0; }
    }
}

namespace Nitf {
    class ImageDataMask extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\ImageSegment $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_blockedImgDataOffset = $this->_io->readU4be();
            $this->_m_bmrlnth = $this->_io->readU2be();
            $this->_m_tmrlnth = $this->_io->readU2be();
            $this->_m_tpxcdlnth = $this->_io->readU2be();
            $this->_m_tpxcd = $this->_io->readBytes($this->tpxcdSize());
            if ($this->hasBmr()) {
                $this->_m_bmrbnd = [];
                $n = $this->bmrtmrCount();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_bmrbnd[] = $this->_io->readU4be();
                }
            }
            if ($this->hasTmr()) {
                $this->_m_tmrbnd = [];
                $n = $this->bmrtmrCount();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_tmrbnd[] = $this->_io->readU4be();
                }
            }
        }
        protected $_m_hasBmr;
        public function hasBmr() {
            if ($this->_m_hasBmr !== null)
                return $this->_m_hasBmr;
            $this->_m_hasBmr = $this->bmrlnth() != 0;
            return $this->_m_hasBmr;
        }
        protected $_m_hasTmr;
        public function hasTmr() {
            if ($this->_m_hasTmr !== null)
                return $this->_m_hasTmr;
            $this->_m_hasTmr = $this->tmrlnth() != 0;
            return $this->_m_hasTmr;
        }
        protected $_m_tmrbndSize;
        public function tmrbndSize() {
            if ($this->_m_tmrbndSize !== null)
                return $this->_m_tmrbndSize;
            $this->_m_tmrbndSize = ($this->hasTmr() ? ($this->bmrtmrCount() * 4) : 0);
            return $this->_m_tmrbndSize;
        }
        protected $_m_tpxcdSize;
        public function tpxcdSize() {
            if ($this->_m_tpxcdSize !== null)
                return $this->_m_tpxcdSize;
            $this->_m_tpxcdSize = intval((\Kaitai\Struct\Stream::mod($this->tpxcdlnth(), 8) == 0 ? $this->tpxcdlnth() : ($this->tpxcdlnth() + (8 - \Kaitai\Struct\Stream::mod($this->tpxcdlnth(), 8)))) / 8);
            return $this->_m_tpxcdSize;
        }
        protected $_m_totalSize;
        public function totalSize() {
            if ($this->_m_totalSize !== null)
                return $this->_m_totalSize;
            $this->_m_totalSize = ((((((4 + 2) + 2) + 2) + $this->tpxcdSize()) + $this->bmrbndSize()) + $this->tmrbndSize());
            return $this->_m_totalSize;
        }
        protected $_m_bmrbndSize;
        public function bmrbndSize() {
            if ($this->_m_bmrbndSize !== null)
                return $this->_m_bmrbndSize;
            $this->_m_bmrbndSize = ($this->hasBmr() ? ($this->bmrtmrCount() * 4) : 0);
            return $this->_m_bmrbndSize;
        }
        protected $_m_bmrtmrCount;
        public function bmrtmrCount() {
            if ($this->_m_bmrtmrCount !== null)
                return $this->_m_bmrtmrCount;
            $this->_m_bmrtmrCount = ((intval($this->_parent()->imageSubHeader()->numBlocksPerRow(), 10) * intval($this->_parent()->imageSubHeader()->numBlocksPerCol(), 10)) * ($this->_parent()->imageSubHeader()->imgMode() != "S" ? 1 : (intval($this->_parent()->imageSubHeader()->numBands(), 10) != 0 ? intval($this->_parent()->imageSubHeader()->numBands(), 10) : intval($this->_parent()->imageSubHeader()->numMultispectralBands(), 10))));
            return $this->_m_bmrtmrCount;
        }
        protected $_m_blockedImgDataOffset;
        protected $_m_bmrlnth;
        protected $_m_tmrlnth;
        protected $_m_tpxcdlnth;
        protected $_m_tpxcd;
        protected $_m_bmrbnd;
        protected $_m_tmrbnd;
        public function blockedImgDataOffset() { return $this->_m_blockedImgDataOffset; }

        /**
         * Block Mask Record Length
         */
        public function bmrlnth() { return $this->_m_bmrlnth; }

        /**
         * Pad Pixel Mask Record Length
         */
        public function tmrlnth() { return $this->_m_tmrlnth; }

        /**
         * Pad Output Pixel Code Length
         */
        public function tpxcdlnth() { return $this->_m_tpxcdlnth; }

        /**
         * Pad Output Pixel Code
         */
        public function tpxcd() { return $this->_m_tpxcd; }

        /**
         * Block n, Band m Offset
         */
        public function bmrbnd() { return $this->_m_bmrbnd; }

        /**
         * Pad Pixel n, Band m
         */
        public function tmrbnd() { return $this->_m_tmrbnd; }
    }
}

namespace Nitf {
    class GraphicsSegment extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, \Nitf $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m_graphicSubHeader = new \Nitf\GraphicSubHeader($this->_io, $this, $this->_root);
            $this->_m_graphicDataField = $this->_io->readBytes(intval($this->_parent()->header()->lnnfo()[$this->idx()]->lengthGraphicSegment(), 10));
        }
        protected $_m_graphicSubHeader;
        protected $_m_graphicDataField;
        protected $_m_idx;
        public function graphicSubHeader() { return $this->_m_graphicSubHeader; }
        public function graphicDataField() { return $this->_m_graphicDataField; }
        public function idx() { return $this->_m_idx; }
    }
}

namespace Nitf {
    class DataSubHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\DataExtensionSegment $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_desBase = new \Nitf\DataSubHeaderBase($this->_io, $this, $this->_root);
            if ($this->treOfl()) {
                $this->_m_overflowedHeaderType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "UTF-8");
            }
            if ($this->treOfl()) {
                $this->_m_dataItemOverflowed = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            }
            $this->_m_desDefinedSubheaderFieldsLen = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_desshf = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(intval($this->desDefinedSubheaderFieldsLen(), 10)), "UTF-8");
            $this->_m_desDefinedDataField = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_treOfl;
        public function treOfl() {
            if ($this->_m_treOfl !== null)
                return $this->_m_treOfl;
            $this->_m_treOfl = $this->desBase()->desid() == "TRE_OVERFLOW";
            return $this->_m_treOfl;
        }
        protected $_m_desBase;
        protected $_m_overflowedHeaderType;
        protected $_m_dataItemOverflowed;
        protected $_m_desDefinedSubheaderFieldsLen;
        protected $_m_desshf;
        protected $_m_desDefinedDataField;
        public function desBase() { return $this->_m_desBase; }
        public function overflowedHeaderType() { return $this->_m_overflowedHeaderType; }
        public function dataItemOverflowed() { return $this->_m_dataItemOverflowed; }
        public function desDefinedSubheaderFieldsLen() { return $this->_m_desDefinedSubheaderFieldsLen; }
        public function desshf() { return $this->_m_desshf; }
        public function desDefinedDataField() { return $this->_m_desDefinedDataField; }
    }
}

namespace Nitf {
    class DataExtensionSegment extends \Kaitai\Struct\Struct {
        public function __construct(int $idx, \Kaitai\Struct\Stream $_io, \Nitf $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_idx = $idx;
            $this->_read();
        }

        private function _read() {
            $this->_m__raw_dataSubHeader = $this->_io->readBytes(intval($this->_parent()->header()->ldnfo()[$this->idx()]->lengthDataExtensionSubheader(), 10));
            $_io__raw_dataSubHeader = new \Kaitai\Struct\Stream($this->_m__raw_dataSubHeader);
            $this->_m_dataSubHeader = new \Nitf\DataSubHeader($_io__raw_dataSubHeader, $this, $this->_root);
            $this->_m_dataDataField = $this->_io->readBytes(intval($this->_parent()->header()->ldnfo()[$this->idx()]->lengthDataExtensionSegment(), 10));
        }
        protected $_m_dataSubHeader;
        protected $_m_dataDataField;
        protected $_m_idx;
        protected $_m__raw_dataSubHeader;
        public function dataSubHeader() { return $this->_m_dataSubHeader; }
        public function dataDataField() { return $this->_m_dataDataField; }
        public function idx() { return $this->_m_idx; }
        public function _raw_dataSubHeader() { return $this->_m__raw_dataSubHeader; }
    }
}

namespace Nitf {
    class DataSubHeaderTre extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_desBase = new \Nitf\DataSubHeaderBase($this->_io, $this, $this->_root);
            if ($this->desBase()->desid() == "TRE_OVERFLOW") {
                $this->_m_overflowedHeaderType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "UTF-8");
            }
            if ($this->desBase()->desid() == "TRE_OVERFLOW") {
                $this->_m_dataItemOverflowed = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            }
            $this->_m_desDefinedSubheaderFieldsLen = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_desDefinedDataField = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(intval($this->desDefinedSubheaderFieldsLen(), 10)), "UTF-8");
        }
        protected $_m_desBase;
        protected $_m_overflowedHeaderType;
        protected $_m_dataItemOverflowed;
        protected $_m_desDefinedSubheaderFieldsLen;
        protected $_m_desDefinedDataField;
        public function desBase() { return $this->_m_desBase; }
        public function overflowedHeaderType() { return $this->_m_overflowedHeaderType; }
        public function dataItemOverflowed() { return $this->_m_dataItemOverflowed; }
        public function desDefinedSubheaderFieldsLen() { return $this->_m_desDefinedSubheaderFieldsLen; }
        public function desDefinedDataField() { return $this->_m_desDefinedDataField; }
    }
}

namespace Nitf {
    class ImageSubHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\ImageSegment $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_filePartType = $this->_io->readBytes(2);
            if (!($this->filePartType() == "\x49\x4D")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x49\x4D", $this->filePartType(), $this->_io(), "/types/image_sub_header/seq/0");
            }
            $this->_m_imageId1 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
            $this->_m_imageDateTime = new \Nitf\DateTime($this->_io, $this, $this->_root);
            $this->_m_targetId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(17), "UTF-8");
            $this->_m_imageId2 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(80), "UTF-8");
            $this->_m_imageSecurityClassification = new \Nitf\Clasnfo($this->_io, $this, $this->_root);
            $this->_m_encryption = new \Nitf\Encrypt($this->_io, $this, $this->_root);
            $this->_m_imageSource = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(42), "UTF-8");
            $this->_m_numSigRows = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "UTF-8");
            $this->_m_numSigCols = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "UTF-8");
            $this->_m_pixelValueType = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_imageRepresentation = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "UTF-8");
            $this->_m_imageCategory = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(8), "UTF-8");
            $this->_m_actualBitsPerPixelPerBand = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_pixelJustification = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_imageCoordinateRep = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_imageGeoLoc = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(60), "UTF-8");
            $this->_m_numImgComments = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_imgComments = [];
            $n = intval($this->numImgComments(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_imgComments[] = new \Nitf\ImageComment($this->_io, $this, $this->_root);
            }
            $this->_m_imgCompression = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_compressionRateCode = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_numBands = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            if (intval($this->numBands(), 10) == 0) {
                $this->_m_numMultispectralBands = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
            }
            $this->_m_bands = [];
            $n = (intval($this->numBands(), 10) != 0 ? intval($this->numBands(), 10) : intval($this->numMultispectralBands(), 10));
            for ($i = 0; $i < $n; $i++) {
                $this->_m_bands[] = new \Nitf\BandInfo($this->_io, $this, $this->_root);
            }
            $this->_m_imgSyncCode = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_imgMode = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(1), "UTF-8");
            $this->_m_numBlocksPerRow = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_numBlocksPerCol = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_numPixelsPerBlockHorz = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_numPixelsPerBlockVert = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_numPixelsPerBand = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_imgDisplayLevel = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_attachmentLevel = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_imgLocation = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
            $this->_m_imgMagnification = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_userDefImgDataLen = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
            if (intval($this->userDefImgDataLen(), 10) != 0) {
                $this->_m_userDefOverflow = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            }
            if (intval($this->userDefImgDataLen(), 10) > 2) {
                $this->_m_userDefImgData = [];
                $n = (intval($this->userDefImgDataLen(), 10) - 3);
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_userDefImgData[] = $this->_io->readU1();
                }
            }
            $this->_m_imageExtendedSubHeader = new \Nitf\TreHeader($this->_io, $this, $this->_root);
        }
        protected $_m_filePartType;
        protected $_m_imageId1;
        protected $_m_imageDateTime;
        protected $_m_targetId;
        protected $_m_imageId2;
        protected $_m_imageSecurityClassification;
        protected $_m_encryption;
        protected $_m_imageSource;
        protected $_m_numSigRows;
        protected $_m_numSigCols;
        protected $_m_pixelValueType;
        protected $_m_imageRepresentation;
        protected $_m_imageCategory;
        protected $_m_actualBitsPerPixelPerBand;
        protected $_m_pixelJustification;
        protected $_m_imageCoordinateRep;
        protected $_m_imageGeoLoc;
        protected $_m_numImgComments;
        protected $_m_imgComments;
        protected $_m_imgCompression;
        protected $_m_compressionRateCode;
        protected $_m_numBands;
        protected $_m_numMultispectralBands;
        protected $_m_bands;
        protected $_m_imgSyncCode;
        protected $_m_imgMode;
        protected $_m_numBlocksPerRow;
        protected $_m_numBlocksPerCol;
        protected $_m_numPixelsPerBlockHorz;
        protected $_m_numPixelsPerBlockVert;
        protected $_m_numPixelsPerBand;
        protected $_m_imgDisplayLevel;
        protected $_m_attachmentLevel;
        protected $_m_imgLocation;
        protected $_m_imgMagnification;
        protected $_m_userDefImgDataLen;
        protected $_m_userDefOverflow;
        protected $_m_userDefImgData;
        protected $_m_imageExtendedSubHeader;
        public function filePartType() { return $this->_m_filePartType; }
        public function imageId1() { return $this->_m_imageId1; }
        public function imageDateTime() { return $this->_m_imageDateTime; }
        public function targetId() { return $this->_m_targetId; }
        public function imageId2() { return $this->_m_imageId2; }
        public function imageSecurityClassification() { return $this->_m_imageSecurityClassification; }
        public function encryption() { return $this->_m_encryption; }
        public function imageSource() { return $this->_m_imageSource; }

        /**
         * Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
         */
        public function numSigRows() { return $this->_m_numSigRows; }
        public function numSigCols() { return $this->_m_numSigCols; }
        public function pixelValueType() { return $this->_m_pixelValueType; }

        /**
         * MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
         */
        public function imageRepresentation() { return $this->_m_imageRepresentation; }

        /**
         * VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
         */
        public function imageCategory() { return $this->_m_imageCategory; }
        public function actualBitsPerPixelPerBand() { return $this->_m_actualBitsPerPixelPerBand; }
        public function pixelJustification() { return $this->_m_pixelJustification; }
        public function imageCoordinateRep() { return $this->_m_imageCoordinateRep; }
        public function imageGeoLoc() { return $this->_m_imageGeoLoc; }
        public function numImgComments() { return $this->_m_numImgComments; }
        public function imgComments() { return $this->_m_imgComments; }
        public function imgCompression() { return $this->_m_imgCompression; }
        public function compressionRateCode() { return $this->_m_compressionRateCode; }
        public function numBands() { return $this->_m_numBands; }
        public function numMultispectralBands() { return $this->_m_numMultispectralBands; }
        public function bands() { return $this->_m_bands; }

        /**
         * Reserved for future use.
         */
        public function imgSyncCode() { return $this->_m_imgSyncCode; }

        /**
         * B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
         */
        public function imgMode() { return $this->_m_imgMode; }
        public function numBlocksPerRow() { return $this->_m_numBlocksPerRow; }
        public function numBlocksPerCol() { return $this->_m_numBlocksPerCol; }
        public function numPixelsPerBlockHorz() { return $this->_m_numPixelsPerBlockHorz; }
        public function numPixelsPerBlockVert() { return $this->_m_numPixelsPerBlockVert; }
        public function numPixelsPerBand() { return $this->_m_numPixelsPerBand; }
        public function imgDisplayLevel() { return $this->_m_imgDisplayLevel; }
        public function attachmentLevel() { return $this->_m_attachmentLevel; }
        public function imgLocation() { return $this->_m_imgLocation; }
        public function imgMagnification() { return $this->_m_imgMagnification; }
        public function userDefImgDataLen() { return $this->_m_userDefImgDataLen; }
        public function userDefOverflow() { return $this->_m_userDefOverflow; }
        public function userDefImgData() { return $this->_m_userDefImgData; }
        public function imageExtendedSubHeader() { return $this->_m_imageExtendedSubHeader; }
    }
}

namespace Nitf {
    class ReservedSubHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\ReservedExtensionSegment $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_filePartTypeRe = $this->_io->readBytes(2);
            if (!($this->filePartTypeRe() == "\x52\x45")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x52\x45", $this->filePartTypeRe(), $this->_io(), "/types/reserved_sub_header/seq/0");
            }
            $this->_m_resTypeId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(25), "UTF-8");
            $this->_m_resVersion = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_reclasnfo = new \Nitf\Clasnfo($this->_io, $this, $this->_root);
            $this->_m_resUserDefinedSubheaderLength = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_resUserDefinedSubheaderFields = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(intval($this->resUserDefinedSubheaderLength(), 10)), "UTF-8");
            $this->_m_resUserDefinedData = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesFull(), "UTF-8");
        }
        protected $_m_filePartTypeRe;
        protected $_m_resTypeId;
        protected $_m_resVersion;
        protected $_m_reclasnfo;
        protected $_m_resUserDefinedSubheaderLength;
        protected $_m_resUserDefinedSubheaderFields;
        protected $_m_resUserDefinedData;
        public function filePartTypeRe() { return $this->_m_filePartTypeRe; }
        public function resTypeId() { return $this->_m_resTypeId; }
        public function resVersion() { return $this->_m_resVersion; }
        public function reclasnfo() { return $this->_m_reclasnfo; }
        public function resUserDefinedSubheaderLength() { return $this->_m_resUserDefinedSubheaderLength; }
        public function resUserDefinedSubheaderFields() { return $this->_m_resUserDefinedSubheaderFields; }
        public function resUserDefinedData() { return $this->_m_resUserDefinedData; }
    }
}

namespace Nitf {
    class DataSubHeaderBase extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\DataSubHeader $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_filePartTypeDe = $this->_io->readBytes(2);
            if (!($this->filePartTypeDe() == "\x44\x45")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x44\x45", $this->filePartTypeDe(), $this->_io(), "/types/data_sub_header_base/seq/0");
            }
            $this->_m_desid = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(25), "UTF-8");
            $this->_m_dataDefinitionVersion = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(2), "UTF-8");
            $this->_m_declasnfo = new \Nitf\Clasnfo($this->_io, $this, $this->_root);
        }
        protected $_m_filePartTypeDe;
        protected $_m_desid;
        protected $_m_dataDefinitionVersion;
        protected $_m_declasnfo;

        /**
         * File Part Type desigantor for Data Extension
         */
        public function filePartTypeDe() { return $this->_m_filePartTypeDe; }
        public function desid() { return $this->_m_desid; }
        public function dataDefinitionVersion() { return $this->_m_dataDefinitionVersion; }
        public function declasnfo() { return $this->_m_declasnfo; }
    }
}

namespace Nitf {
    class TextSubHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_textDateTime = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(14), "UTF-8");
            $this->_m_textTitle = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(80), "UTF-8");
            $this->_m_textSecurityClass = new \Nitf\Clasnfo($this->_io, $this, $this->_root);
            $this->_m_encryp = new \Nitf\Encrypt($this->_io, $this, $this->_root);
            $this->_m_textFormat = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_textExtendedSubHeader = new \Nitf\TreHeader($this->_io, $this, $this->_root);
        }
        protected $_m_textDateTime;
        protected $_m_textTitle;
        protected $_m_textSecurityClass;
        protected $_m_encryp;
        protected $_m_textFormat;
        protected $_m_textExtendedSubHeader;
        public function textDateTime() { return $this->_m_textDateTime; }
        public function textTitle() { return $this->_m_textTitle; }
        public function textSecurityClass() { return $this->_m_textSecurityClass; }
        public function encryp() { return $this->_m_encryp; }

        /**
         * MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
         */
        public function textFormat() { return $this->_m_textFormat; }
        public function textExtendedSubHeader() { return $this->_m_textExtendedSubHeader; }
    }
}

namespace Nitf {
    class DateTime extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m__unnamed0 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(14), "UTF-8");
        }
        protected $_m__unnamed0;

        /**
         * UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
         */
        public function _unnamed0() { return $this->_m__unnamed0; }
    }
}

namespace Nitf {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileProfileName = $this->_io->readBytes(4);
            if (!($this->fileProfileName() == "\x4E\x49\x54\x46")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x4E\x49\x54\x46", $this->fileProfileName(), $this->_io(), "/types/header/seq/0");
            }
            $this->_m_fileVersion = $this->_io->readBytes(5);
            if (!($this->fileVersion() == "\x30\x32\x2E\x31\x30")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x30\x32\x2E\x31\x30", $this->fileVersion(), $this->_io(), "/types/header/seq/1");
            }
            $this->_m_complexityLevel = $this->_io->readBytes(2);
            $this->_m_standardType = $this->_io->readBytes(4);
            if (!($this->standardType() == "\x42\x46\x30\x31")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x42\x46\x30\x31", $this->standardType(), $this->_io(), "/types/header/seq/3");
            }
            $this->_m_originatingStationId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
            $this->_m_fileDateTime = new \Nitf\DateTime($this->_io, $this, $this->_root);
            $this->_m_fileTitle = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(80), "UTF-8");
            $this->_m_fileSecurity = new \Nitf\Clasnfo($this->_io, $this, $this->_root);
            $this->_m_fileCopyNumber = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
            $this->_m_fileNumOfCopys = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
            $this->_m_encryption = new \Nitf\Encrypt($this->_io, $this, $this->_root);
            $this->_m_fileBgColor = $this->_io->readBytes(3);
            $this->_m_originatorName = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(24), "UTF-8");
            $this->_m_originatorPhone = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(18), "UTF-8");
            $this->_m_fileLength = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(12), "UTF-8");
            $this->_m_fileHeaderLength = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "UTF-8");
            $this->_m_numImageSegments = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_linfo = [];
            $n = intval($this->numImageSegments(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_linfo[] = new \Nitf\LengthImageInfo($this->_io, $this, $this->_root);
            }
            $this->_m_numGraphicsSegments = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_lnnfo = [];
            $n = intval($this->numGraphicsSegments(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_lnnfo[] = new \Nitf\LengthGraphicInfo($this->_io, $this, $this->_root);
            }
            $this->_m_reservedNumx = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_numTextFiles = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_ltnfo = [];
            $n = intval($this->numTextFiles(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_ltnfo[] = new \Nitf\LengthTextInfo($this->_io, $this, $this->_root);
            }
            $this->_m_numDataExtension = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_ldnfo = [];
            $n = intval($this->numDataExtension(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_ldnfo[] = new \Nitf\LengthDataInfo($this->_io, $this, $this->_root);
            }
            $this->_m_numReservedExtension = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            $this->_m_lrnfo = [];
            $n = intval($this->numReservedExtension(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_lrnfo[] = new \Nitf\LengthReservedInfo($this->_io, $this, $this->_root);
            }
            $this->_m_userDefinedHeader = new \Nitf\TreHeader($this->_io, $this, $this->_root);
            $this->_m_extendedHeader = new \Nitf\TreHeader($this->_io, $this, $this->_root);
        }
        protected $_m_fileProfileName;
        protected $_m_fileVersion;
        protected $_m_complexityLevel;
        protected $_m_standardType;
        protected $_m_originatingStationId;
        protected $_m_fileDateTime;
        protected $_m_fileTitle;
        protected $_m_fileSecurity;
        protected $_m_fileCopyNumber;
        protected $_m_fileNumOfCopys;
        protected $_m_encryption;
        protected $_m_fileBgColor;
        protected $_m_originatorName;
        protected $_m_originatorPhone;
        protected $_m_fileLength;
        protected $_m_fileHeaderLength;
        protected $_m_numImageSegments;
        protected $_m_linfo;
        protected $_m_numGraphicsSegments;
        protected $_m_lnnfo;
        protected $_m_reservedNumx;
        protected $_m_numTextFiles;
        protected $_m_ltnfo;
        protected $_m_numDataExtension;
        protected $_m_ldnfo;
        protected $_m_numReservedExtension;
        protected $_m_lrnfo;
        protected $_m_userDefinedHeader;
        protected $_m_extendedHeader;
        public function fileProfileName() { return $this->_m_fileProfileName; }
        public function fileVersion() { return $this->_m_fileVersion; }
        public function complexityLevel() { return $this->_m_complexityLevel; }

        /**
         * Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
         */
        public function standardType() { return $this->_m_standardType; }
        public function originatingStationId() { return $this->_m_originatingStationId; }
        public function fileDateTime() { return $this->_m_fileDateTime; }
        public function fileTitle() { return $this->_m_fileTitle; }
        public function fileSecurity() { return $this->_m_fileSecurity; }
        public function fileCopyNumber() { return $this->_m_fileCopyNumber; }
        public function fileNumOfCopys() { return $this->_m_fileNumOfCopys; }
        public function encryption() { return $this->_m_encryption; }
        public function fileBgColor() { return $this->_m_fileBgColor; }
        public function originatorName() { return $this->_m_originatorName; }
        public function originatorPhone() { return $this->_m_originatorPhone; }
        public function fileLength() { return $this->_m_fileLength; }
        public function fileHeaderLength() { return $this->_m_fileHeaderLength; }
        public function numImageSegments() { return $this->_m_numImageSegments; }
        public function linfo() { return $this->_m_linfo; }
        public function numGraphicsSegments() { return $this->_m_numGraphicsSegments; }
        public function lnnfo() { return $this->_m_lnnfo; }
        public function reservedNumx() { return $this->_m_reservedNumx; }
        public function numTextFiles() { return $this->_m_numTextFiles; }
        public function ltnfo() { return $this->_m_ltnfo; }
        public function numDataExtension() { return $this->_m_numDataExtension; }
        public function ldnfo() { return $this->_m_ldnfo; }
        public function numReservedExtension() { return $this->_m_numReservedExtension; }
        public function lrnfo() { return $this->_m_lrnfo; }
        public function userDefinedHeader() { return $this->_m_userDefinedHeader; }
        public function extendedHeader() { return $this->_m_extendedHeader; }
    }
}

/**
 * Streaming file Header Data Extension Segment Subheader
 */

namespace Nitf {
    class DataSubHeaderStreaming extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_desBase = new \Nitf\DataSubHeaderBase($this->_io, $this, $this->_root);
            $this->_m_desDefinedSubheaderFieldsLen = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_sfhL1 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(7), "UTF-8");
            $this->_m_sfhDelim1 = $this->_io->readU4be();
            $this->_m_sfhDr = [];
            $n = intval($this->sfhL1(), 10);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_sfhDr[] = $this->_io->readU1();
            }
            $this->_m_sfhDelim2 = $this->_io->readU4be();
            $this->_m_sfhL2 = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(7), "UTF-8");
        }
        protected $_m_desBase;
        protected $_m_desDefinedSubheaderFieldsLen;
        protected $_m_sfhL1;
        protected $_m_sfhDelim1;
        protected $_m_sfhDr;
        protected $_m_sfhDelim2;
        protected $_m_sfhL2;
        public function desBase() { return $this->_m_desBase; }
        public function desDefinedSubheaderFieldsLen() { return $this->_m_desDefinedSubheaderFieldsLen; }

        /**
         * SFH Length 1: number of bytes in sfh_dr field
         */
        public function sfhL1() { return $this->_m_sfhL1; }

        /**
         * Shall contain the value 0x0A6E1D97.
         */
        public function sfhDelim1() { return $this->_m_sfhDelim1; }
        public function sfhDr() { return $this->_m_sfhDr; }

        /**
         * Shall contain the value 0x0ECA14BF.
         */
        public function sfhDelim2() { return $this->_m_sfhDelim2; }

        /**
         * A repeat of sfh_l1.
         */
        public function sfhL2() { return $this->_m_sfhL2; }
    }
}

namespace Nitf {
    class TreHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_headerDataLength = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
            if (intval($this->headerDataLength(), 10) != 0) {
                $this->_m_headerOverflow = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "UTF-8");
            }
            if (intval($this->headerDataLength(), 10) > 2) {
                $this->_m_headerData = [];
                $n = (intval($this->headerDataLength(), 10) - 3);
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_headerData[] = $this->_io->readU1();
                }
            }
        }
        protected $_m_headerDataLength;
        protected $_m_headerOverflow;
        protected $_m_headerData;
        public function headerDataLength() { return $this->_m_headerDataLength; }
        public function headerOverflow() { return $this->_m_headerOverflow; }
        public function headerData() { return $this->_m_headerData; }
    }
}

namespace Nitf {
    class LengthImageInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\Header $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lengthImageSubheader = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(6), "UTF-8");
            $this->_m_lengthImageSegment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(10), "UTF-8");
        }
        protected $_m_lengthImageSubheader;
        protected $_m_lengthImageSegment;
        public function lengthImageSubheader() { return $this->_m_lengthImageSubheader; }
        public function lengthImageSegment() { return $this->_m_lengthImageSegment; }
    }
}

namespace Nitf {
    class LengthDataInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\Header $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lengthDataExtensionSubheader = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_lengthDataExtensionSegment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(9), "UTF-8");
        }
        protected $_m_lengthDataExtensionSubheader;
        protected $_m_lengthDataExtensionSegment;
        public function lengthDataExtensionSubheader() { return $this->_m_lengthDataExtensionSubheader; }
        public function lengthDataExtensionSegment() { return $this->_m_lengthDataExtensionSegment; }
    }
}

namespace Nitf {
    class LengthTextInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Nitf\Header $_parent = null, \Nitf $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lengthTextSubheader = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "UTF-8");
            $this->_m_lengthTextSegment = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(5), "UTF-8");
        }
        protected $_m_lengthTextSubheader;
        protected $_m_lengthTextSegment;
        public function lengthTextSubheader() { return $this->_m_lengthTextSubheader; }
        public function lengthTextSegment() { return $this->_m_lengthTextSegment; }
    }
}
