<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * The **BMP file format**, also known as **bitmap image file** or **device independent
 * bitmap (DIB) file format** or simply a **bitmap**, is a raster graphics image file
 * format used to store bitmap digital images, independently of the display
 * device (such as a graphics adapter), especially on Microsoft Windows
 * and OS/2 operating systems.
 * 
 * ## Samples
 * 
 * Great collection of various BMP sample files:
 * [**BMP Suite Image List**](
 *   http://entropymine.com/jason/bmpsuite/bmpsuite/html/bmpsuite.html
 * ) (by Jason Summers)
 * 
 * If only there was such a comprehensive sample suite for every file format! It's like
 * a dream for every developer of any binary file format parser. It contains a lot of
 * different types and variations of BMP files, even the tricky ones, where it's not clear
 * from the specification how to deal with them (marked there as "**q**uestionable").
 * 
 * If you make a program which will be able to read all the "**g**ood" and "**q**uestionable"
 * BMP files and won't crash on the "**b**ad" ones, it will definitely have one of the most
 * extensive support of BMP files in the universe!
 * 
 * ## BITMAPV2INFOHEADER and BITMAPV3INFOHEADER
 * 
 * A beneficial discussion on Adobe forum (archived):
 * [**Invalid BMP Format with Alpha channel**](
 *   https://web.archive.org/web/20150127132443/https://forums.adobe.com/message/3272950
 * )
 * 
 * In 2010, someone noticed that Photoshop generated BMP with an odd type of header. There wasn't
 * any documentation available for this header at the time (and still isn't).
 * However, Chris Cox (former Adobe employee) claimed that they hadn't invented any type
 * of proprietary header and everything they were writing was taken directly
 * from the Microsoft documentation.
 * 
 * It showed up that the unknown header was called BITMAPV3INFOHEADER.
 * Although Microsoft has apparently requested and verified the use of the header,
 * the documentation on MSDN has probably got lost and they have probably
 * forgotten about this type of header.
 * 
 * This is the only source I could find about these structures, so we could't rely
 * on it so much, but I think supporting them as a read-only format won't harm anything.
 * Due to the fact that it isn't documented anywhere else, most applications don't support it.
 * 
 * All Windows headers at once (including mentioned BITMAPV2INFOHEADER and BITMAPV3INFOHEADER):
 * 
 * ![Bitmap headers overview](
 *   https://web.archive.org/web/20190527043845/https://forums.adobe.com/servlet/JiveServlet/showImage/2-3273299-47801/BMP_Headers.png
 * )
 * 
 * ## Specs
 *  * [Bitmap Storage (Windows Dev Center)](
 *      https://learn.microsoft.com/en-us/windows/win32/gdi/bitmap-storage
 *    )
 *     * BITMAPFILEHEADER
 *     * BITMAPINFOHEADER
 *     * BITMAPV4HEADER
 *     * BITMAPV5HEADER
 *  * [OS/2 Bitmap File Format](
 *       https://www.fileformat.info/format/os2bmp/egff.htm
 *    )
 *     * BITMAPFILEHEADER (OS2BMPFILEHEADER)
 *     * BITMAPCOREHEADER (OS21XBITMAPHEADER)
 *     * OS22XBITMAPHEADER
 *  * [Microsoft Windows Bitmap](
 *       http://netghost.narod.ru/gff/graphics/summary/micbmp.htm
 *    )
 *     * BITMAPFILEHEADER (WINBMPFILEHEADER)
 *     * BITMAPCOREHEADER (WIN2XBITMAPHEADER)
 *     * BITMAPINFOHEADER (WINNTBITMAPHEADER)
 *     * BITMAPV4HEADER (WIN4XBITMAPHEADER)
 */

namespace {
    class Bmp extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileHdr = new \Bmp\FileHeader($this->_io, $this, $this->_root);
            $this->_m__raw_dibInfo = $this->_io->readBytes(($this->fileHdr()->ofsBitmap() - 14));
            $_io__raw_dibInfo = new \Kaitai\Struct\Stream($this->_m__raw_dibInfo);
            $this->_m_dibInfo = new \Bmp\BitmapInfo($_io__raw_dibInfo, $this, $this->_root);
            $this->_m__raw_bitmap = $this->_io->readBytesFull();
            $_io__raw_bitmap = new \Kaitai\Struct\Stream($this->_m__raw_bitmap);
            $this->_m_bitmap = new \Bmp\Bitmap($_io__raw_bitmap, $this, $this->_root);
        }
        protected $_m_fileHdr;
        protected $_m_dibInfo;
        protected $_m_bitmap;
        protected $_m__raw_dibInfo;
        protected $_m__raw_bitmap;
        public function fileHdr() { return $this->_m_fileHdr; }
        public function dibInfo() { return $this->_m_dibInfo; }
        public function bitmap() { return $this->_m_bitmap; }
        public function _raw_dibInfo() { return $this->_m__raw_dibInfo; }
        public function _raw_bitmap() { return $this->_m__raw_bitmap; }
    }
}

namespace Bmp {
    class CieXyz extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp\BitmapV4Extension $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = new \Bmp\FixedPoint2Dot30($this->_io, $this, $this->_root);
            $this->_m_y = new \Bmp\FixedPoint2Dot30($this->_io, $this, $this->_root);
            $this->_m_z = new \Bmp\FixedPoint2Dot30($this->_io, $this, $this->_root);
        }
        protected $_m_x;
        protected $_m_y;
        protected $_m_z;
        public function x() { return $this->_m_x; }
        public function y() { return $this->_m_y; }
        public function z() { return $this->_m_z; }
    }
}

namespace Bmp {
    class RgbRecord extends \Kaitai\Struct\Struct {
        public function __construct(bool $hasReservedField, \Kaitai\Struct\Stream $_io, \Bmp\ColorTable $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_hasReservedField = $hasReservedField;
            $this->_read();
        }

        private function _read() {
            $this->_m_blue = $this->_io->readU1();
            $this->_m_green = $this->_io->readU1();
            $this->_m_red = $this->_io->readU1();
            if ($this->hasReservedField()) {
                $this->_m_reserved = $this->_io->readU1();
            }
        }
        protected $_m_blue;
        protected $_m_green;
        protected $_m_red;
        protected $_m_reserved;
        protected $_m_hasReservedField;
        public function blue() { return $this->_m_blue; }
        public function green() { return $this->_m_green; }
        public function red() { return $this->_m_red; }
        public function reserved() { return $this->_m_reserved; }
        public function hasReservedField() { return $this->_m_hasReservedField; }
    }
}

namespace Bmp {
    class BitmapV5Extension extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp\BitmapHeader $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_intent = $this->_io->readU4le();
            $this->_m_ofsProfile = $this->_io->readU4le();
            $this->_m_lenProfile = $this->_io->readU4le();
            $this->_m_reserved = $this->_io->readU4le();
        }
        protected $_m_hasProfile;
        public function hasProfile() {
            if ($this->_m_hasProfile !== null)
                return $this->_m_hasProfile;
            $this->_m_hasProfile =  (($this->_parent()->bitmapV4Ext()->colorSpaceType() == \Bmp\ColorSpace::PROFILE_LINKED) || ($this->_parent()->bitmapV4Ext()->colorSpaceType() == \Bmp\ColorSpace::PROFILE_EMBEDDED)) ;
            return $this->_m_hasProfile;
        }
        protected $_m_profileData;
        public function profileData() {
            if ($this->_m_profileData !== null)
                return $this->_m_profileData;
            if ($this->hasProfile()) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek((14 + $this->ofsProfile()));
                switch ($this->_parent()->bitmapV4Ext()->colorSpaceType() == \Bmp\ColorSpace::PROFILE_LINKED) {
                    case true:
                        $this->_m_profileData = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($io->readBytes($this->lenProfile()), 0, false), "windows-1252");
                        break;
                    default:
                        $this->_m_profileData = $io->readBytes($this->lenProfile());
                        break;
                }
                $io->seek($_pos);
            }
            return $this->_m_profileData;
        }
        protected $_m_intent;
        protected $_m_ofsProfile;
        protected $_m_lenProfile;
        protected $_m_reserved;
        public function intent() { return $this->_m_intent; }

        /**
         * The offset, in bytes, from the beginning of the BITMAPV5HEADER structure to the start of the profile data.
         */
        public function ofsProfile() { return $this->_m_ofsProfile; }
        public function lenProfile() { return $this->_m_lenProfile; }
        public function reserved() { return $this->_m_reserved; }
    }
}

namespace Bmp {
    class ColorMask extends \Kaitai\Struct\Struct {
        public function __construct(bool $hasAlphaMask, \Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_hasAlphaMask = $hasAlphaMask;
            $this->_read();
        }

        private function _read() {
            $this->_m_redMask = $this->_io->readU4le();
            $this->_m_greenMask = $this->_io->readU4le();
            $this->_m_blueMask = $this->_io->readU4le();
            if ($this->hasAlphaMask()) {
                $this->_m_alphaMask = $this->_io->readU4le();
            }
        }
        protected $_m_redMask;
        protected $_m_greenMask;
        protected $_m_blueMask;
        protected $_m_alphaMask;
        protected $_m_hasAlphaMask;
        public function redMask() { return $this->_m_redMask; }
        public function greenMask() { return $this->_m_greenMask; }
        public function blueMask() { return $this->_m_blueMask; }
        public function alphaMask() { return $this->_m_alphaMask; }
        public function hasAlphaMask() { return $this->_m_hasAlphaMask; }
    }
}

namespace Bmp {
    class BitmapV4Extension extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp\BitmapHeader $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_colorSpaceType = $this->_io->readU4le();
            $this->_m_endpointRed = new \Bmp\CieXyz($this->_io, $this, $this->_root);
            $this->_m_endpointGreen = new \Bmp\CieXyz($this->_io, $this, $this->_root);
            $this->_m_endpointBlue = new \Bmp\CieXyz($this->_io, $this, $this->_root);
            $this->_m_gammaRed = new \Bmp\FixedPoint16Dot16($this->_io, $this, $this->_root);
            $this->_m_gammaBlue = new \Bmp\FixedPoint16Dot16($this->_io, $this, $this->_root);
            $this->_m_gammaGreen = new \Bmp\FixedPoint16Dot16($this->_io, $this, $this->_root);
        }
        protected $_m_colorSpaceType;
        protected $_m_endpointRed;
        protected $_m_endpointGreen;
        protected $_m_endpointBlue;
        protected $_m_gammaRed;
        protected $_m_gammaBlue;
        protected $_m_gammaGreen;
        public function colorSpaceType() { return $this->_m_colorSpaceType; }
        public function endpointRed() { return $this->_m_endpointRed; }
        public function endpointGreen() { return $this->_m_endpointGreen; }
        public function endpointBlue() { return $this->_m_endpointBlue; }
        public function gammaRed() { return $this->_m_gammaRed; }
        public function gammaBlue() { return $this->_m_gammaBlue; }
        public function gammaGreen() { return $this->_m_gammaGreen; }
    }
}

namespace Bmp {
    class BitmapInfoExtension extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp\BitmapHeader $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if (!($this->_parent()->extendsOs22xBitmap())) {
                $this->_m_compression = $this->_io->readU4le();
            }
            if ($this->_parent()->extendsOs22xBitmap()) {
                $this->_m_os2Compression = $this->_io->readU4le();
            }
            $this->_m_lenImage = $this->_io->readU4le();
            $this->_m_xResolution = $this->_io->readU4le();
            $this->_m_yResolution = $this->_io->readU4le();
            $this->_m_numColorsUsed = $this->_io->readU4le();
            $this->_m_numColorsImportant = $this->_io->readU4le();
        }
        protected $_m_compression;
        protected $_m_os2Compression;
        protected $_m_lenImage;
        protected $_m_xResolution;
        protected $_m_yResolution;
        protected $_m_numColorsUsed;
        protected $_m_numColorsImportant;
        public function compression() { return $this->_m_compression; }
        public function os2Compression() { return $this->_m_os2Compression; }

        /**
         * If biCompression is BI_JPEG or BI_PNG, indicates the size of the JPEG or PNG image buffer.
         * This may be set to zero for BI_RGB bitmaps.
         */
        public function lenImage() { return $this->_m_lenImage; }
        public function xResolution() { return $this->_m_xResolution; }
        public function yResolution() { return $this->_m_yResolution; }
        public function numColorsUsed() { return $this->_m_numColorsUsed; }
        public function numColorsImportant() { return $this->_m_numColorsImportant; }
    }
}

namespace Bmp {
    class FixedPoint2Dot30 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp\CieXyz $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_raw = $this->_io->readU4le();
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = (($this->raw() + 0.0) / (1 << 30));
            return $this->_m_value;
        }
        protected $_m_raw;
        public function raw() { return $this->_m_raw; }
    }
}

/**
 * Replace with an opaque type if you care about the pixels.
 * You can look at an example of a JavaScript implementation: https://github.com/generalmimon/bmptool/blob/master/src/Bitmap.js
 * 
 * There is a proposal for adding bitmap data type to Kaitai Struct: https://github.com/kaitai-io/kaitai_struct/issues/188
 */

namespace Bmp {
    class Bitmap extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
        }
    }
}

namespace Bmp {
    class BitmapHeader extends \Kaitai\Struct\Struct {
        public function __construct(int $lenHeader, \Kaitai\Struct\Stream $_io, \Bmp\BitmapInfo $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_lenHeader = $lenHeader;
            $this->_read();
        }

        private function _read() {
            switch ($this->isCoreHeader()) {
                case true:
                    $this->_m_imageWidth = $this->_io->readU2le();
                    break;
                case false:
                    $this->_m_imageWidth = $this->_io->readU4le();
                    break;
            }
            switch ($this->isCoreHeader()) {
                case true:
                    $this->_m_imageHeightRaw = $this->_io->readS2le();
                    break;
                case false:
                    $this->_m_imageHeightRaw = $this->_io->readS4le();
                    break;
            }
            $this->_m_numPlanes = $this->_io->readU2le();
            $this->_m_bitsPerPixel = $this->_io->readU2le();
            if ($this->extendsBitmapInfo()) {
                $this->_m_bitmapInfoExt = new \Bmp\BitmapInfoExtension($this->_io, $this, $this->_root);
            }
            if ($this->isColorMaskHere()) {
                $this->_m_colorMask = new \Bmp\ColorMask($this->lenHeader() != \Bmp\HeaderType::BITMAP_V2_INFO_HEADER, $this->_io, $this, $this->_root);
            }
            if ($this->extendsOs22xBitmap()) {
                $this->_m_os22xBitmapExt = new \Bmp\Os22xBitmapExtension($this->_io, $this, $this->_root);
            }
            if ($this->extendsBitmapV4()) {
                $this->_m_bitmapV4Ext = new \Bmp\BitmapV4Extension($this->_io, $this, $this->_root);
            }
            if ($this->extendsBitmapV5()) {
                $this->_m_bitmapV5Ext = new \Bmp\BitmapV5Extension($this->_io, $this, $this->_root);
            }
        }
        protected $_m_extendsBitmapV4;
        public function extendsBitmapV4() {
            if ($this->_m_extendsBitmapV4 !== null)
                return $this->_m_extendsBitmapV4;
            $this->_m_extendsBitmapV4 = $this->lenHeader() >= \Bmp\HeaderType::BITMAP_V4_HEADER;
            return $this->_m_extendsBitmapV4;
        }
        protected $_m_extendsOs22xBitmap;
        public function extendsOs22xBitmap() {
            if ($this->_m_extendsOs22xBitmap !== null)
                return $this->_m_extendsOs22xBitmap;
            $this->_m_extendsOs22xBitmap = $this->lenHeader() == \Bmp\HeaderType::OS2_2X_BITMAP_HEADER;
            return $this->_m_extendsOs22xBitmap;
        }
        protected $_m_usesFixedPalette;
        public function usesFixedPalette() {
            if ($this->_m_usesFixedPalette !== null)
                return $this->_m_usesFixedPalette;
            $this->_m_usesFixedPalette =  ((!( (($this->bitsPerPixel() == 16) || ($this->bitsPerPixel() == 24) || ($this->bitsPerPixel() == 32)) )) && (!( (($this->extendsBitmapInfo()) && (!($this->extendsOs22xBitmap())) && ( (($this->bitmapInfoExt()->compression() == \Bmp\Compressions::JPEG) || ($this->bitmapInfoExt()->compression() == \Bmp\Compressions::PNG)) )) ))) ;
            return $this->_m_usesFixedPalette;
        }
        protected $_m_extendsBitmapInfo;
        public function extendsBitmapInfo() {
            if ($this->_m_extendsBitmapInfo !== null)
                return $this->_m_extendsBitmapInfo;
            $this->_m_extendsBitmapInfo = $this->lenHeader() >= \Bmp\HeaderType::BITMAP_INFO_HEADER;
            return $this->_m_extendsBitmapInfo;
        }
        protected $_m_imageHeight;
        public function imageHeight() {
            if ($this->_m_imageHeight !== null)
                return $this->_m_imageHeight;
            $this->_m_imageHeight = ($this->imageHeightRaw() < 0 ? -($this->imageHeightRaw()) : $this->imageHeightRaw());
            return $this->_m_imageHeight;
        }
        protected $_m_isCoreHeader;
        public function isCoreHeader() {
            if ($this->_m_isCoreHeader !== null)
                return $this->_m_isCoreHeader;
            $this->_m_isCoreHeader = $this->lenHeader() == \Bmp\HeaderType::BITMAP_CORE_HEADER;
            return $this->_m_isCoreHeader;
        }
        protected $_m_extendsBitmapV5;
        public function extendsBitmapV5() {
            if ($this->_m_extendsBitmapV5 !== null)
                return $this->_m_extendsBitmapV5;
            $this->_m_extendsBitmapV5 = $this->lenHeader() >= \Bmp\HeaderType::BITMAP_V5_HEADER;
            return $this->_m_extendsBitmapV5;
        }
        protected $_m_isColorMaskHere;
        public function isColorMaskHere() {
            if ($this->_m_isColorMaskHere !== null)
                return $this->_m_isColorMaskHere;
            $this->_m_isColorMaskHere =  (($this->lenHeader() == \Bmp\HeaderType::BITMAP_V2_INFO_HEADER) || ($this->lenHeader() == \Bmp\HeaderType::BITMAP_V3_INFO_HEADER) || ($this->extendsBitmapV4())) ;
            return $this->_m_isColorMaskHere;
        }
        protected $_m_bottomUp;
        public function bottomUp() {
            if ($this->_m_bottomUp !== null)
                return $this->_m_bottomUp;
            $this->_m_bottomUp = $this->imageHeightRaw() > 0;
            return $this->_m_bottomUp;
        }
        protected $_m_imageWidth;
        protected $_m_imageHeightRaw;
        protected $_m_numPlanes;
        protected $_m_bitsPerPixel;
        protected $_m_bitmapInfoExt;
        protected $_m_colorMask;
        protected $_m_os22xBitmapExt;
        protected $_m_bitmapV4Ext;
        protected $_m_bitmapV5Ext;
        protected $_m_lenHeader;

        /**
         * Image width, px
         */
        public function imageWidth() { return $this->_m_imageWidth; }

        /**
         * Image height, px (positive => bottom-up image, negative => top-down image)
         */
        public function imageHeightRaw() { return $this->_m_imageHeightRaw; }

        /**
         * Number of planes for target device, must be 1
         */
        public function numPlanes() { return $this->_m_numPlanes; }

        /**
         * Number of bits per pixel that image buffer uses (1, 4, 8, 16, 24 or 32)
         */
        public function bitsPerPixel() { return $this->_m_bitsPerPixel; }
        public function bitmapInfoExt() { return $this->_m_bitmapInfoExt; }
        public function colorMask() { return $this->_m_colorMask; }
        public function os22xBitmapExt() { return $this->_m_os22xBitmapExt; }
        public function bitmapV4Ext() { return $this->_m_bitmapV4Ext; }
        public function bitmapV5Ext() { return $this->_m_bitmapV5Ext; }
        public function lenHeader() { return $this->_m_lenHeader; }
    }
}

namespace Bmp {
    class Os22xBitmapExtension extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp\BitmapHeader $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_units = $this->_io->readU2le();
            $this->_m_reserved = $this->_io->readU2le();
            $this->_m_recording = $this->_io->readU2le();
            $this->_m_rendering = $this->_io->readU2le();
            $this->_m_size1 = $this->_io->readU4le();
            $this->_m_size2 = $this->_io->readU4le();
            $this->_m_colorEncoding = $this->_io->readU4le();
            $this->_m_identifier = $this->_io->readU4le();
        }
        protected $_m_units;
        protected $_m_reserved;
        protected $_m_recording;
        protected $_m_rendering;
        protected $_m_size1;
        protected $_m_size2;
        protected $_m_colorEncoding;
        protected $_m_identifier;
        public function units() { return $this->_m_units; }
        public function reserved() { return $this->_m_reserved; }

        /**
         * Specifies how the bitmap scan lines are stored.
         * The only valid value for this field is 0, indicating that the bitmap is
         * stored from left to right and from the bottom up.
         */
        public function recording() { return $this->_m_recording; }

        /**
         * Specifies the halftoning algorithm used on the bitmap data.
         */
        public function rendering() { return $this->_m_rendering; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => error damping as a percentage in the range 0 through 100
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => X dimension of the pattern used in pixels
         */
        public function size1() { return $this->_m_size1; }

        /**
         * rendering == os2_rendering::error_diffusion
         *   => not used
         * rendering == os2_rendering::panda or rendering == os2_rendering::super_circle
         *   => Y dimension of the pattern used in pixels
         */
        public function size2() { return $this->_m_size2; }

        /**
         * Specifies the color model used to describe the bitmap data.
         * The only valid value is 0, indicating the RGB encoding scheme.
         */
        public function colorEncoding() { return $this->_m_colorEncoding; }

        /**
         * Application-specific value
         */
        public function identifier() { return $this->_m_identifier; }
    }
}

namespace Bmp {
    class FixedPoint16Dot16 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp\BitmapV4Extension $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_raw = $this->_io->readU4le();
        }
        protected $_m_value;
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            $this->_m_value = (($this->raw() + 0.0) / (1 << 16));
            return $this->_m_value;
        }
        protected $_m_raw;
        public function raw() { return $this->_m_raw; }
    }
}

namespace Bmp {
    class ColorTable extends \Kaitai\Struct\Struct {
        public function __construct(bool $hasReservedField, int $numColors, \Kaitai\Struct\Stream $_io, \Bmp\BitmapInfo $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_hasReservedField = $hasReservedField;
            $this->_m_numColors = $numColors;
            $this->_read();
        }

        private function _read() {
            $this->_m_colors = [];
            $n = ( (($this->numColors() > 0) && ($this->numColors() < $this->numColorsPresent()))  ? $this->numColors() : $this->numColorsPresent());
            for ($i = 0; $i < $n; $i++) {
                $this->_m_colors[] = new \Bmp\RgbRecord($this->hasReservedField(), $this->_io, $this, $this->_root);
            }
        }
        protected $_m_numColorsPresent;
        public function numColorsPresent() {
            if ($this->_m_numColorsPresent !== null)
                return $this->_m_numColorsPresent;
            $this->_m_numColorsPresent = intval($this->_io()->size() / ($this->hasReservedField() ? 4 : 3));
            return $this->_m_numColorsPresent;
        }
        protected $_m_colors;
        protected $_m_hasReservedField;
        protected $_m_numColors;
        public function colors() { return $this->_m_colors; }
        public function hasReservedField() { return $this->_m_hasReservedField; }

        /**
         * If equal to 0, the pallete should contain as many colors as can fit into the pixel value
         * according to the `bits_per_pixel` field (if `bits_per_pixel` = 8, then the pixel can
         * represent 2 ** 8 = 256 values, so exactly 256 colors should be present). For more flexibility,
         * it reads as many colors as it can until EOS is reached (and the image data begin).
         */
        public function numColors() { return $this->_m_numColors; }
    }
}

namespace Bmp {
    class FileHeader extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_fileType = $this->_io->readBytes(2);
            if (!($this->fileType() == "\x42\x4D")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x42\x4D", $this->fileType(), $this->_io(), "/types/file_header/seq/0");
            }
            $this->_m_lenFile = $this->_io->readU4le();
            $this->_m_reserved1 = $this->_io->readU2le();
            $this->_m_reserved2 = $this->_io->readU2le();
            $this->_m_ofsBitmap = $this->_io->readS4le();
        }
        protected $_m_fileType;
        protected $_m_lenFile;
        protected $_m_reserved1;
        protected $_m_reserved2;
        protected $_m_ofsBitmap;
        public function fileType() { return $this->_m_fileType; }

        /**
         * not reliable, mostly ignored by BMP decoders
         */
        public function lenFile() { return $this->_m_lenFile; }
        public function reserved1() { return $this->_m_reserved1; }
        public function reserved2() { return $this->_m_reserved2; }

        /**
         * Offset to actual raw pixel data of the image
         */
        public function ofsBitmap() { return $this->_m_ofsBitmap; }
    }
}

namespace Bmp {
    class BitmapInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Bmp $_parent = null, \Bmp $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lenHeader = $this->_io->readU4le();
            $this->_m__raw_header = $this->_io->readBytes(($this->lenHeader() - 4));
            $_io__raw_header = new \Kaitai\Struct\Stream($this->_m__raw_header);
            $this->_m_header = new \Bmp\BitmapHeader($this->lenHeader(), $_io__raw_header, $this, $this->_root);
            if ($this->isColorMaskHere()) {
                $this->_m_colorMask = new \Bmp\ColorMask($this->header()->bitmapInfoExt()->compression() == \Bmp\Compressions::ALPHA_BITFIELDS, $this->_io, $this, $this->_root);
            }
            if (!($this->_io()->isEof())) {
                $this->_m__raw_colorTable = $this->_io->readBytesFull();
                $_io__raw_colorTable = new \Kaitai\Struct\Stream($this->_m__raw_colorTable);
                $this->_m_colorTable = new \Bmp\ColorTable(!($this->header()->isCoreHeader()), ($this->header()->extendsBitmapInfo() ? $this->header()->bitmapInfoExt()->numColorsUsed() : 0), $_io__raw_colorTable, $this, $this->_root);
            }
        }
        protected $_m_isColorMaskGiven;
        public function isColorMaskGiven() {
            if ($this->_m_isColorMaskGiven !== null)
                return $this->_m_isColorMaskGiven;
            $this->_m_isColorMaskGiven =  (($this->header()->extendsBitmapInfo()) && ( (($this->header()->bitmapInfoExt()->compression() == \Bmp\Compressions::BITFIELDS) || ($this->header()->bitmapInfoExt()->compression() == \Bmp\Compressions::ALPHA_BITFIELDS)) ) && ( (($this->isColorMaskHere()) || ($this->header()->isColorMaskHere())) )) ;
            return $this->_m_isColorMaskGiven;
        }
        protected $_m_colorMaskGiven;
        public function colorMaskGiven() {
            if ($this->_m_colorMaskGiven !== null)
                return $this->_m_colorMaskGiven;
            if ($this->isColorMaskGiven()) {
                $this->_m_colorMaskGiven = ($this->isColorMaskHere() ? $this->colorMask() : $this->header()->colorMask());
            }
            return $this->_m_colorMaskGiven;
        }
        protected $_m_colorMaskBlue;
        public function colorMaskBlue() {
            if ($this->_m_colorMaskBlue !== null)
                return $this->_m_colorMaskBlue;
            $this->_m_colorMaskBlue = ($this->isColorMaskGiven() ? $this->colorMaskGiven()->blueMask() : ($this->header()->bitsPerPixel() == 16 ? 31 : ( (($this->header()->bitsPerPixel() == 24) || ($this->header()->bitsPerPixel() == 32))  ? 255 : 0)));
            return $this->_m_colorMaskBlue;
        }
        protected $_m_colorMaskAlpha;
        public function colorMaskAlpha() {
            if ($this->_m_colorMaskAlpha !== null)
                return $this->_m_colorMaskAlpha;
            $this->_m_colorMaskAlpha = ( (($this->isColorMaskGiven()) && ($this->colorMaskGiven()->hasAlphaMask()))  ? $this->colorMaskGiven()->alphaMask() : 0);
            return $this->_m_colorMaskAlpha;
        }
        protected $_m_colorMaskGreen;
        public function colorMaskGreen() {
            if ($this->_m_colorMaskGreen !== null)
                return $this->_m_colorMaskGreen;
            $this->_m_colorMaskGreen = ($this->isColorMaskGiven() ? $this->colorMaskGiven()->greenMask() : ($this->header()->bitsPerPixel() == 16 ? 992 : ( (($this->header()->bitsPerPixel() == 24) || ($this->header()->bitsPerPixel() == 32))  ? 65280 : 0)));
            return $this->_m_colorMaskGreen;
        }
        protected $_m_isColorMaskHere;
        public function isColorMaskHere() {
            if ($this->_m_isColorMaskHere !== null)
                return $this->_m_isColorMaskHere;
            $this->_m_isColorMaskHere =  ((!($this->_io()->isEof())) && ($this->header()->lenHeader() == \Bmp\HeaderType::BITMAP_INFO_HEADER) && ( (($this->header()->bitmapInfoExt()->compression() == \Bmp\Compressions::BITFIELDS) || ($this->header()->bitmapInfoExt()->compression() == \Bmp\Compressions::ALPHA_BITFIELDS)) )) ;
            return $this->_m_isColorMaskHere;
        }
        protected $_m_colorMaskRed;
        public function colorMaskRed() {
            if ($this->_m_colorMaskRed !== null)
                return $this->_m_colorMaskRed;
            $this->_m_colorMaskRed = ($this->isColorMaskGiven() ? $this->colorMaskGiven()->redMask() : ($this->header()->bitsPerPixel() == 16 ? 31744 : ( (($this->header()->bitsPerPixel() == 24) || ($this->header()->bitsPerPixel() == 32))  ? 16711680 : 0)));
            return $this->_m_colorMaskRed;
        }
        protected $_m_lenHeader;
        protected $_m_header;
        protected $_m_colorMask;
        protected $_m_colorTable;
        protected $_m__raw_header;
        protected $_m__raw_colorTable;
        public function lenHeader() { return $this->_m_lenHeader; }
        public function header() { return $this->_m_header; }

        /**
         * Valid only for BITMAPINFOHEADER, in all headers extending it the masks are contained in the header itself.
         */
        public function colorMask() { return $this->_m_colorMask; }
        public function colorTable() { return $this->_m_colorTable; }
        public function _raw_header() { return $this->_m__raw_header; }
        public function _raw_colorTable() { return $this->_m__raw_colorTable; }
    }
}

namespace Bmp {
    class Intent {

        /**
         * Maintains saturation. Used for business charts and other situations in which undithered colors are required.
         */
        const BUSINESS = 1;

        /**
         * Maintains colorimetric match. Used for graphic designs and named colors.
         */
        const GRAPHICS = 2;

        /**
         * Maintains contrast. Used for photographs and natural images.
         */
        const IMAGES = 4;

        /**
         * Maintains the white point. Matches the colors to their nearest color in the destination gamut.
         */
        const ABS_COLORIMETRIC = 8;
    }
}

namespace Bmp {
    class ColorSpace {

        /**
         * This value implies that endpoints and gamma values are given in the appropriate fields.
         */
        const CALIBRATED_RGB = 0;

        /**
         * This value indicates that bV5ProfileData points to the file name of the profile
         * to use (gamma and endpoints values are ignored).
         * 
         * If a profile is linked, the path of the profile can be any fully qualified name
         * (including a network path) that can be opened using the Win32 CreateFile function.
         */
        const PROFILE_LINKED = 1279872587;

        /**
         * This value indicates that bV5ProfileData points to a memory buffer that contains
         * the profile to be used (gamma and endpoints values are ignored).
         */
        const PROFILE_EMBEDDED = 1296188740;

        /**
         * This value indicates that the bitmap is in the system default color space, sRGB.
         */
        const WINDOWS = 1466527264;

        /**
         * Specifies that the bitmap is in sRGB color space.
         */
        const S_RGB = 1934772034;
    }
}

namespace Bmp {
    class Os2Rendering {
        const NO_HALFTONING = 0;
        const ERROR_DIFFUSION = 1;

        /**
         * Processing Algorithm for Noncoded Document Acquisition (PANDA)
         */
        const PANDA = 2;
        const SUPER_CIRCLE = 3;
    }
}

namespace Bmp {
    class HeaderType {
        const BITMAP_CORE_HEADER = 12;
        const BITMAP_INFO_HEADER = 40;
        const BITMAP_V2_INFO_HEADER = 52;
        const BITMAP_V3_INFO_HEADER = 56;
        const OS2_2X_BITMAP_HEADER = 64;
        const BITMAP_V4_HEADER = 108;
        const BITMAP_V5_HEADER = 124;
    }
}

namespace Bmp {
    class Compressions {

        /**
         * Uncompressed RGB format
         */
        const RGB = 0;

        /**
         * RLE compression, 8 bits per pixel
         */
        const RLE8 = 1;

        /**
         * RLE compression, 4 bits per pixel
         */
        const RLE4 = 2;
        const BITFIELDS = 3;

        /**
         * BMP file includes whole JPEG file in image buffer
         */
        const JPEG = 4;

        /**
         * BMP file includes whole PNG file in image buffer
         */
        const PNG = 5;

        /**
         * only Windows CE 5.0 with .NET 4.0 or later
         */
        const ALPHA_BITFIELDS = 6;
    }
}

namespace Bmp {
    class Os2Compressions {
        const RGB = 0;
        const RLE8 = 1;
        const RLE4 = 2;

        /**
         * Huffman 1D compression (also known as CCITT Group 3 One-Dimensional (G31D))
         */
        const HUFFMAN_1D = 3;

        /**
         * RLE compression, 24 bits per pixel
         */
        const RLE24 = 4;
    }
}
