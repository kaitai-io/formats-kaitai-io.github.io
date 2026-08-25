<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Sample files (numbers in parentheses show how many files per extension contain
 * Exif metadata out of the total):
 * 
 * * <https://github.com/ianare/exif-py/tree/a69bf74770caf6b333221658f5092ed69f99faac/tests/resources/jpg> (84/93 .jpg, 1/1 .jpeg)
 * * <https://github.com/exiftool/exiftool/tree/2200871d9cef988051d2a99d67df3bda6cbb30a8/t/images> (34/41 .jpg, 0/1 .png)
 * * <https://github.com/Exiv2/exiv2/tree/648ada43dcb35ce6077f38183ace52d5e2071f64/test/data> (85/155 .jpg, 5/23 .png)
 * * <https://github.com/python-pillow/Pillow/tree/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images> (36/55 .jpg, 3/420 .png)
 * * <https://github.com/drewnoakes/metadata-extractor-images/tree/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg> (335/430 .jpg)
 * * <https://github.com/libexif/libexif-testsuite/tree/8c1f5bbc18d2cbc80b01b3f9b3eb29546310acf2> (15/18 .jpg)
 */

namespace {
    class Exif extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Exif $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_endianness = $this->_io->readU2le();
            $this->_m_body = new \Exif\ExifBody($this->_io, $this, $this->_root);
        }
        protected $_m_endianness;
        protected $_m_body;
        public function endianness() { return $this->_m_endianness; }
        public function body() { return $this->_m_body; }
    }
}

namespace Exif {
    class ExifBody extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif $_parent = null, ?\Exif $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            switch ($this->_root()->endianness()) {
                case 18761:
                    $this->_m__is_le = true;
                    break;
                case 19789:
                    $this->_m__is_le = false;
                    break;
            }

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_magic = $this->_io->readU2le();
            if (!($this->_m_magic == 42)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(42, $this->_m_magic, $this->_io, "/types/exif_body/seq/0");
            }
            $this->_m_ofsIfd0 = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_magic = $this->_io->readU2be();
            if (!($this->_m_magic == 42)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(42, $this->_m_magic, $this->_io, "/types/exif_body/seq/0");
            }
            $this->_m_ofsIfd0 = $this->_io->readU4be();
        }
        protected $_m_ifd0;
        public function ifd0() {
            if ($this->_m_ifd0 !== null)
                return $this->_m_ifd0;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsIfd0());
            if ($this->_m__is_le) {
                $this->_m_ifd0 = new \Exif\ExifBody\Ifd(false, $this->_io, $this, $this->_root, $this->_m__is_le);
            } else {
                $this->_m_ifd0 = new \Exif\ExifBody\Ifd(false, $this->_io, $this, $this->_root, $this->_m__is_le);
            }
            $this->_io->seek($_pos);
            return $this->_m_ifd0;
        }
        protected $_m_magic;
        protected $_m_ofsIfd0;
        public function magic() { return $this->_m_magic; }
        public function ofsIfd0() { return $this->_m_ofsIfd0; }
    }
}

namespace Exif\ExifBody {
    class AsciiString extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_value = $this->_io->readBytesTerm(0, false, true, false);
        }

        private function _readBE() {
            $this->_m_value = $this->_io->readBytesTerm(0, false, true, false);
        }
        protected $_m_value;

        /**
         * According to the core Exif standard, this should be ASCII, but in
         * practice, this is not always the case. From
         * [ExifTool FAQ](https://exiftool.sourceforge.net/faq.html#Q10):
         * 
         * > However, it is not uncommon for applications to write UTF-8 or
         * other encodings where ASCII is expected.
         * 
         * Therefore, this field is a byte array, not a string. This is to
         * avoid non-ASCII characters being treated as errors in some target
         * languages, such as Python. The only assumption is that a null byte
         * terminates the value (although sometimes the null byte is missing,
         * which we tolerate thanks to the `eos-error: false` setting).
         * 
         * Here is a sample JPEG file with a `tag::image_description` IFD
         * field of type `field_type::ascii` that actually contains UTF-8:
         * <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/exiv2-bug501.jpg>
         * 
         * It seems that most modern applications (e.g. GIMP 3.0.6) always
         * use UTF-8 when storing Exif metadata. However, there are also
         * files with a non-UTF-8 encoding, for example
         * <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Ricoh%20DC-3Z%20(low%20res).jpg>
         * has a `tag::copyright` IFD field with a value encoded in
         * ISO-8859-1 (Latin-1).
         */
        public function value() { return $this->_m_value; }
    }
}

namespace Exif\ExifBody {
    class Doubles extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readF8le();
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readF8be();
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Floats extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readF4le();
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readF4be();
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Ifd extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(bool $isGpsIfd, \Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_m_isGpsIfd = $isGpsIfd;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_numFields = $this->_io->readU2le();
            $this->_m__raw_fields = [];
            $this->_m_fields = [];
            $n = $this->numFields();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_fields[] = $this->_io->readBytes(12);
                $_io__raw_fields = new \Kaitai\Struct\Stream(end($this->_m__raw_fields));
                $this->_m_fields[] = new \Exif\ExifBody\IfdField($_io__raw_fields, $this, $this->_root, $this->_m__is_le);
            }
            $this->_m_ofsNextIfd = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_numFields = $this->_io->readU2be();
            $this->_m__raw_fields = [];
            $this->_m_fields = [];
            $n = $this->numFields();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_fields[] = $this->_io->readBytes(12);
                $_io__raw_fields = new \Kaitai\Struct\Stream(end($this->_m__raw_fields));
                $this->_m_fields[] = new \Exif\ExifBody\IfdField($_io__raw_fields, $this, $this->_root, $this->_m__is_le);
            }
            $this->_m_ofsNextIfd = $this->_io->readU4be();
        }
        protected $_m_nextIfd;
        public function nextIfd() {
            if ($this->_m_nextIfd !== null)
                return $this->_m_nextIfd;
            if ($this->ofsNextIfd() != 0) {
                $_pos = $this->_io->pos();
                $this->_io->seek($this->ofsNextIfd());
                if ($this->_m__is_le) {
                    $this->_m_nextIfd = new \Exif\ExifBody\Ifd($this->isGpsIfd(), $this->_io, $this, $this->_root, $this->_m__is_le);
                } else {
                    $this->_m_nextIfd = new \Exif\ExifBody\Ifd($this->isGpsIfd(), $this->_io, $this, $this->_root, $this->_m__is_le);
                }
                $this->_io->seek($_pos);
            }
            return $this->_m_nextIfd;
        }
        protected $_m_numFields;
        protected $_m_fields;
        protected $_m_ofsNextIfd;
        protected $_m_isGpsIfd;
        protected $_m__raw_fields;
        public function numFields() { return $this->_m_numFields; }
        public function fields() { return $this->_m_fields; }
        public function ofsNextIfd() { return $this->_m_ofsNextIfd; }
        public function isGpsIfd() { return $this->_m_isGpsIfd; }
        public function _raw_fields() { return $this->_m__raw_fields; }
    }
}

namespace Exif\ExifBody {
    class IfdField extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\Ifd $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_tagRaw = $this->_io->readU2le();
            $this->_m_fieldType = $this->_io->readU2le();
            $this->_m_numValues = $this->_io->readU4le();
            if (!($this->hasImmediateData())) {
                $this->_m_ofsData = $this->_io->readU4le();
            }
        }

        private function _readBE() {
            $this->_m_tagRaw = $this->_io->readU2be();
            $this->_m_fieldType = $this->_io->readU2be();
            $this->_m_numValues = $this->_io->readU4be();
            if (!($this->hasImmediateData())) {
                $this->_m_ofsData = $this->_io->readU4be();
            }
        }
        protected $_m_bytesPerValue;

        /**
         * Size in bytes of a single value of type `field_type`, or 0 if
         * `field_type` is not one of the known types (in which case the size
         * cannot be determined and `data` will be empty).
         */
        public function bytesPerValue() {
            if ($this->_m_bytesPerValue !== null)
                return $this->_m_bytesPerValue;
            $this->_m_bytesPerValue = ( (($this->fieldType() == \Exif\FieldType::BYTE) || ($this->fieldType() == \Exif\FieldType::ASCII) || ($this->fieldType() == \Exif\FieldType::SBYTE) || ($this->fieldType() == \Exif\FieldType::UNDEFINED) || ($this->fieldType() == \Exif\FieldType::UTF8))  ? 1 : ( (($this->fieldType() == \Exif\FieldType::SHORT) || ($this->fieldType() == \Exif\FieldType::SSHORT))  ? 2 : ( (($this->fieldType() == \Exif\FieldType::LONG) || ($this->fieldType() == \Exif\FieldType::SLONG) || ($this->fieldType() == \Exif\FieldType::FLOAT) || ($this->fieldType() == \Exif\FieldType::IFD))  ? 4 : ( (($this->fieldType() == \Exif\FieldType::RATIONAL) || ($this->fieldType() == \Exif\FieldType::SRATIONAL) || ($this->fieldType() == \Exif\FieldType::DOUBLE))  ? 8 : 0))));
            return $this->_m_bytesPerValue;
        }
        protected $_m_data;
        public function data() {
            if ($this->_m_data !== null)
                return $this->_m_data;
            $io = ($this->hasImmediateData() ? $this->_io() : $this->_root()->_io());
            $_pos = $io->pos();
            $io->seek(($this->hasImmediateData() ? 8 : $this->ofsData()));
            if ($this->_m__is_le) {
                switch ($this->fieldType()) {
                    case \Exif\FieldType::ASCII:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\AsciiString($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::DOUBLE:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Doubles($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::FLOAT:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Floats($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::IFD:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Longs($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::LONG:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Longs($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::RATIONAL:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Rationals($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SBYTE:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Sbytes($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SHORT:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Shorts($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SLONG:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Slongs($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SRATIONAL:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Srationals($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SSHORT:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Sshorts($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::UTF8:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Utf8String($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    default:
                        $this->_m_data = $io->readBytes($this->lenData());
                        break;
                }
            } else {
                switch ($this->fieldType()) {
                    case \Exif\FieldType::ASCII:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\AsciiString($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::DOUBLE:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Doubles($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::FLOAT:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Floats($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::IFD:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Longs($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::LONG:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Longs($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::RATIONAL:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Rationals($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SBYTE:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Sbytes($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SHORT:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Shorts($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SLONG:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Slongs($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SRATIONAL:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Srationals($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::SSHORT:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Sshorts($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    case \Exif\FieldType::UTF8:
                        $this->_m__raw_data = $io->readBytes($this->lenData());
                        $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                        $this->_m_data = new \Exif\ExifBody\Utf8String($_io__raw_data, $this, $this->_root, $this->_m__is_le);
                        break;
                    default:
                        $this->_m_data = $io->readBytes($this->lenData());
                        break;
                }
            }
            $io->seek($_pos);
            return $this->_m_data;
        }
        protected $_m_gpsTag;
        public function gpsTag() {
            if ($this->_m_gpsTag !== null)
                return $this->_m_gpsTag;
            if ($this->_parent()->isGpsIfd()) {
                $this->_m_gpsTag = $this->tagRaw();
            }
            return $this->_m_gpsTag;
        }
        protected $_m_hasImmediateData;
        public function hasImmediateData() {
            if ($this->_m_hasImmediateData !== null)
                return $this->_m_hasImmediateData;
            $this->_m_hasImmediateData = $this->lenData() <= 4;
            return $this->_m_hasImmediateData;
        }
        protected $_m_lenData;
        public function lenData() {
            if ($this->_m_lenData !== null)
                return $this->_m_lenData;
            $this->_m_lenData = $this->bytesPerValue() * $this->numValues();
            return $this->_m_lenData;
        }
        protected $_m_subIfd;

        /**
         * All the "IFD Pointer" tags (as the core Exif standard calls them),
         * i.e. `ExifOffset`, `InteropOffset` and `GPSInfo` (using the
         * [ExifTool's
         * names](https://exiftool.sourceforge.net/TagNames/EXIF.html)),
         * should be of type `LONG` (`field_type::long`). However, the type
         * `SLONG` (`field_type::slong`) type has also been observed:
         * <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/test/data/FurnaceCreekInn.jpg>
         * 
         * Both ExifTool and Exiv2 accept `LONG`, `SLONG` and also `IFD`.
         * Exiv2 specifically supports only these three types - see
         * <https://github.com/Exiv2/exiv2/blob/2cd987a731236037b6b78cbff897d08685a8ef49/src/tiffvisitor_int.cpp#L1141>
         * (Git tag "v0.28.8"). ExifTool is more lenient - it even accepts
         * any integer type. In practice, real files most likely only use one
         * of the three types supported by Exiv2, so we stick with that.
         */
        public function subIfd() {
            if ($this->_m_subIfd !== null)
                return $this->_m_subIfd;
            if ( (($this->numValues() == 1) && ( (($this->fieldType() == \Exif\FieldType::LONG) || ($this->fieldType() == \Exif\FieldType::IFD) || ( (($this->fieldType() == \Exif\FieldType::SLONG) && ($this->data()->values()[0] >= 0)) )) ) && ( (($this->tag() == \Exif\Tag::EXIF_OFFSET) || ($this->tag() == \Exif\Tag::INTEROP_OFFSET) || ($this->tag() == \Exif\Tag::GPS_INFO)) )) ) {
                $io = $this->_root()->_io();
                $_pos = $io->pos();
                $io->seek(($this->fieldType() == \Exif\FieldType::SLONG ? $this->data()->values()[0] : $this->data()->values()[0]));
                if ($this->_m__is_le) {
                    $this->_m_subIfd = new \Exif\ExifBody\Ifd($this->tag() == \Exif\Tag::GPS_INFO, $io, $this, $this->_root, $this->_m__is_le);
                } else {
                    $this->_m_subIfd = new \Exif\ExifBody\Ifd($this->tag() == \Exif\Tag::GPS_INFO, $io, $this, $this->_root, $this->_m__is_le);
                }
                $io->seek($_pos);
            }
            return $this->_m_subIfd;
        }
        protected $_m_tag;
        public function tag() {
            if ($this->_m_tag !== null)
                return $this->_m_tag;
            if (!($this->_parent()->isGpsIfd())) {
                $this->_m_tag = $this->tagRaw();
            }
            return $this->_m_tag;
        }
        protected $_m_tagRaw;
        protected $_m_fieldType;
        protected $_m_numValues;
        protected $_m_ofsData;
        protected $_m__raw_data;

        /**
         * Raw numeric tag. Don't read this field - access `tag` or `gps_tag`
         * instead.
         */
        public function tagRaw() { return $this->_m_tagRaw; }
        public function fieldType() { return $this->_m_fieldType; }
        public function numValues() { return $this->_m_numValues; }
        public function ofsData() { return $this->_m_ofsData; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

namespace Exif\ExifBody {
    class Longs extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU4le();
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU4be();
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Rational extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\Rationals $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_valueNum = $this->_io->readU4le();
            $this->_m_valueDen = $this->_io->readU4le();
        }

        private function _readBE() {
            $this->_m_valueNum = $this->_io->readU4be();
            $this->_m_valueDen = $this->_io->readU4be();
        }
        protected $_m_value;

        /**
         * If denominator is zero, this instance is disabled to prevent
         * `ZeroDivisionError` in Python.
         * 
         * Here's a sample file with a zero denominator in the IFD fields
         * `tag::x_resolution` and `tag::y_resolution` (both of which are of
         * type `field_type::rational`):
         * <https://github.com/python-pillow/Pillow/blob/807d689a83738027b6f6e0f219a6a6dd30e01c08/Tests/images/exif-dpi-zerodivision.jpg>
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            if ($this->valueDen() != 0) {
                $this->_m_value = ($this->valueNum() + 0.0) / $this->valueDen();
            }
            return $this->_m_value;
        }
        protected $_m_valueNum;
        protected $_m_valueDen;

        /**
         * Numerator
         */
        public function valueNum() { return $this->_m_valueNum; }

        /**
         * Denominator
         */
        public function valueDen() { return $this->_m_valueDen; }
    }
}

namespace Exif\ExifBody {
    class Rationals extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = new \Exif\ExifBody\Rational($this->_io, $this, $this->_root, $this->_m__is_le);
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = new \Exif\ExifBody\Rational($this->_io, $this, $this->_root, $this->_m__is_le);
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Sbytes extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readS1();
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readS1();
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Shorts extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU2le();
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readU2be();
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Slongs extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readS4le();
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readS4be();
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Srational extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\Srationals $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_valueNum = $this->_io->readS4le();
            $this->_m_valueDen = $this->_io->readS4le();
        }

        private function _readBE() {
            $this->_m_valueNum = $this->_io->readS4be();
            $this->_m_valueDen = $this->_io->readS4be();
        }
        protected $_m_value;

        /**
         * If denominator is zero, this instance is disabled to prevent
         * `ZeroDivisionError` in Python.
         * 
         * Here's a sample file with a zero denominator in the IFD field
         * `tag::exposure_compensation` of type `field_type::srational`:
         * <https://github.com/drewnoakes/metadata-extractor-images/blob/651ad0e67aa8d43d358ad05f9bc07b52d8b9ac6e/jpg/Reconyx%20Hyperfire%20HP4K.jpg>
         */
        public function value() {
            if ($this->_m_value !== null)
                return $this->_m_value;
            if ($this->valueDen() != 0) {
                $this->_m_value = ($this->valueNum() + 0.0) / $this->valueDen();
            }
            return $this->_m_value;
        }
        protected $_m_valueNum;
        protected $_m_valueDen;

        /**
         * Numerator
         */
        public function valueNum() { return $this->_m_valueNum; }

        /**
         * Denominator
         */
        public function valueDen() { return $this->_m_valueDen; }
    }
}

namespace Exif\ExifBody {
    class Srationals extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = new \Exif\ExifBody\Srational($this->_io, $this, $this->_root, $this->_m__is_le);
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = new \Exif\ExifBody\Srational($this->_io, $this, $this->_root, $this->_m__is_le);
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Sshorts extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readS2le();
            }
        }

        private function _readBE() {
            $this->_m_values = [];
            $n = $this->_parent()->numValues();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_values[] = $this->_io->readS2be();
            }
        }
        protected $_m_values;
        public function values() { return $this->_m_values; }
    }
}

namespace Exif\ExifBody {
    class Utf8String extends \Kaitai\Struct\Struct {
        protected $_m__is_le;

        public function __construct(\Kaitai\Struct\Stream $_io, ?\Exif\ExifBody\IfdField $_parent = null, ?\Exif $_root = null, $is_le = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m__is_le = $is_le;
            $this->_read();
        }

        private function _read() {

            if (is_null($this->_m__is_le)) {
                throw new \Kaitai\Struct\Error\UndecidedEndiannessError;
            } else if ($this->_m__is_le) {
                $this->_readLE();
            } else {
                $this->_readBE();
            }
        }

        private function _readLE() {
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, false), "UTF-8");
        }

        private function _readBE() {
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, false), "UTF-8");
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace Exif {
    class FieldType {
        const BYTE = 1;
        const ASCII = 2;
        const SHORT = 3;
        const LONG = 4;
        const RATIONAL = 5;

        /**
         * 8-bit signed integer.
         * 
         * This type is missing from the official Exif specification, but
         * it's part of TIFF 6.0. There's no known Exif tag of this type in
         * the [standard
         * namespace](https://exiftool.sourceforge.net/TagNames/EXIF.html)
         * (there's no occurrence of `int8s` on the page), but it's used by
         * many vendor-specific tags in `MakerNote` sub-IFDs, for example
         * [Nikon](https://exiftool.sourceforge.net/TagNames/Nikon.html)
         * (search for `int8s`).
         * 
         * Unfortunately, this implementation doesn't parse the contents of
         * `MakerNote` tags (`tag::maker_note`) yet.
         */
        const SBYTE = 6;
        const UNDEFINED = 7;

        /**
         * 16-bit signed integer.
         * 
         * This type is missing from the official Exif specification, but
         * it's part of TIFF 6.0 and some tags use it, for example
         * `TimeZoneOffset` (`tag::time_zone_offset`).
         */
        const SSHORT = 8;
        const SLONG = 9;
        const SRATIONAL = 10;

        /**
         * Single precision (4-byte) IEEE 754 float.
         * 
         * This type is missing from the official Exif specification, but
         * it's part of TIFF 6.0 and some tags use it, for example
         * `ProfileToneCurve` (`tag::profile_tone_curve`).
         */
        const FLOAT = 11;

        /**
         * Double precision (8-byte) IEEE 754 float.
         * 
         * This type is missing from the official Exif specification, but
         * it's part of TIFF 6.0 and some tags use it, for example
         * `NoiseProfile` (`tag::noise_profile`).
         */
        const DOUBLE = 12;

        /**
         * Offset of an IFD (32-bit unsigned integer).
         * 
         * This type is missing from the official Exif specification, but
         * it was defined in the [TIFF Technical Note
         * 1](https://www.alternatiff.com/resources/TIFFPM6.pdf) (page 4).
         * There's no known Exif tag of this type in the [standard
         * namespace](https://exiftool.sourceforge.net/TagNames/EXIF.html)
         * (there's no occurrence of `ifd` on the page), but there are some
         * Olympus-specific tags in `MakerNote` sub-IFDs, e.g.
         * `EquipmentIFD` or `CameraSettingsIFD`. See
         * <https://github.com/exiftool/exiftool/blob/2200871d9cef988051d2a99d67df3bda6cbb30a8/lib/Image/ExifTool/Olympus.pm>
         * (Git tag "13.59") - search for `'ifd'`. See also the sample file
         * <https://github.com/exiftool/exiftool/blob/2200871d9cef988051d2a99d67df3bda6cbb30a8/t/images/Olympus2.jpg>,
         * which contains these tags.
         */
        const IFD = 13;
        const UTF8 = 129;

        private const _VALUES = [1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 129 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Exif {
    class GpsTag {
        const GPS_VERSION_ID = 0;
        const GPS_LATITUDE_REF = 1;
        const GPS_LATITUDE = 2;
        const GPS_LONGITUDE_REF = 3;
        const GPS_LONGITUDE = 4;
        const GPS_ALTITUDE_REF = 5;
        const GPS_ALTITUDE = 6;
        const GPS_TIME_STAMP = 7;
        const GPS_SATELLITES = 8;
        const GPS_STATUS = 9;
        const GPS_MEASURE_MODE = 10;
        const GPS_DOP = 11;
        const GPS_SPEED_REF = 12;
        const GPS_SPEED = 13;
        const GPS_TRACK_REF = 14;
        const GPS_TRACK = 15;
        const GPS_IMG_DIRECTION_REF = 16;
        const GPS_IMG_DIRECTION = 17;
        const GPS_MAP_DATUM = 18;
        const GPS_DEST_LATITUDE_REF = 19;
        const GPS_DEST_LATITUDE = 20;
        const GPS_DEST_LONGITUDE_REF = 21;
        const GPS_DEST_LONGITUDE = 22;
        const GPS_DEST_BEARING_REF = 23;
        const GPS_DEST_BEARING = 24;
        const GPS_DEST_DISTANCE_REF = 25;
        const GPS_DEST_DISTANCE = 26;
        const GPS_PROCESSING_METHOD = 27;
        const GPS_AREA_INFORMATION = 28;
        const GPS_DATE_STAMP = 29;
        const GPS_DIFFERENTIAL = 30;
        const GPS_H_POSITIONING_ERROR = 31;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 27 => true, 28 => true, 29 => true, 30 => true, 31 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}

namespace Exif {
    class Tag {
        const INTEROP_INDEX = 1;

        /**
         * Interoperability Version (not in the Exif spec, but used in practice)
         */
        const INTEROP_VERSION = 2;
        const IMAGE_WIDTH = 256;
        const IMAGE_HEIGHT = 257;
        const BITS_PER_SAMPLE = 258;
        const COMPRESSION = 259;
        const PHOTOMETRIC_INTERPRETATION = 262;
        const THRESHOLDING = 263;
        const CELL_WIDTH = 264;
        const CELL_LENGTH = 265;
        const FILL_ORDER = 266;
        const DOCUMENT_NAME = 269;
        const IMAGE_DESCRIPTION = 270;
        const MAKE = 271;
        const MODEL = 272;
        const STRIP_OFFSETS = 273;
        const ORIENTATION = 274;
        const SAMPLES_PER_PIXEL = 277;
        const ROWS_PER_STRIP = 278;
        const STRIP_BYTE_COUNTS = 279;
        const MIN_SAMPLE_VALUE = 280;
        const MAX_SAMPLE_VALUE = 281;
        const X_RESOLUTION = 282;
        const Y_RESOLUTION = 283;
        const PLANAR_CONFIGURATION = 284;
        const PAGE_NAME = 285;
        const X_POSITION = 286;
        const Y_POSITION = 287;
        const FREE_OFFSETS = 288;
        const FREE_BYTE_COUNTS = 289;
        const GRAY_RESPONSE_UNIT = 290;
        const GRAY_RESPONSE_CURVE = 291;
        const T4_OPTIONS = 292;
        const T6_OPTIONS = 293;
        const RESOLUTION_UNIT = 296;
        const PAGE_NUMBER = 297;
        const COLOR_RESPONSE_UNIT = 300;
        const TRANSFER_FUNCTION = 301;
        const SOFTWARE = 305;
        const MODIFY_DATE = 306;
        const ARTIST = 315;
        const HOST_COMPUTER = 316;
        const PREDICTOR = 317;
        const WHITE_POINT = 318;
        const PRIMARY_CHROMATICITIES = 319;
        const COLOR_MAP = 320;
        const HALFTONE_HINTS = 321;
        const TILE_WIDTH = 322;
        const TILE_LENGTH = 323;
        const TILE_OFFSETS = 324;
        const TILE_BYTE_COUNTS = 325;
        const BAD_FAX_LINES = 326;
        const CLEAN_FAX_DATA = 327;
        const CONSECUTIVE_BAD_FAX_LINES = 328;
        const SUB_IFD = 330;
        const INK_SET = 332;
        const INK_NAMES = 333;
        const NUMBEROF_INKS = 334;
        const DOT_RANGE = 336;
        const TARGET_PRINTER = 337;
        const EXTRA_SAMPLES = 338;
        const SAMPLE_FORMAT = 339;
        const S_MIN_SAMPLE_VALUE = 340;
        const S_MAX_SAMPLE_VALUE = 341;
        const TRANSFER_RANGE = 342;
        const CLIP_PATH = 343;
        const X_CLIP_PATH_UNITS = 344;
        const Y_CLIP_PATH_UNITS = 345;
        const INDEXED = 346;
        const JPEG_TABLES = 347;
        const OPI_PROXY = 351;
        const GLOBAL_PARAMETERS_IFD = 400;
        const PROFILE_TYPE = 401;
        const FAX_PROFILE = 402;
        const CODING_METHODS = 403;
        const VERSION_YEAR = 404;
        const MODE_NUMBER = 405;
        const DECODE = 433;
        const DEFAULT_IMAGE_COLOR = 434;
        const T82_OPTIONS = 435;
        const JPEG_TABLES2 = 437;
        const JPEG_PROC = 512;
        const THUMBNAIL_OFFSET = 513;
        const THUMBNAIL_LENGTH = 514;
        const JPEG_RESTART_INTERVAL = 515;
        const JPEG_LOSSLESS_PREDICTORS = 517;
        const JPEG_POINT_TRANSFORMS = 518;
        const JPEGQ_TABLES = 519;
        const JPEGDC_TABLES = 520;
        const JPEGAC_TABLES = 521;
        const Y_CB_CR_COEFFICIENTS = 529;
        const Y_CB_CR_SUB_SAMPLING = 530;
        const Y_CB_CR_POSITIONING = 531;
        const REFERENCE_BLACK_WHITE = 532;
        const STRIP_ROW_COUNTS = 559;
        const APPLICATION_NOTES = 700;
        const USPTO_MISCELLANEOUS = 999;
        const RELATED_IMAGE_FILE_FORMAT = 4096;
        const RELATED_IMAGE_WIDTH = 4097;
        const RELATED_IMAGE_HEIGHT = 4098;
        const RATING = 18246;
        const XP_DIP_XML = 18247;
        const STITCH_INFO = 18248;
        const RATING_PERCENT = 18249;
        const SONY_RAW_FILE_TYPE = 28672;
        const LIGHT_FALLOFF_PARAMS = 28722;
        const CHROMATIC_ABERRATION_CORR_PARAMS = 28725;
        const DISTORTION_CORR_PARAMS = 28727;
        const IMAGE_ID = 32781;
        const WANG_TAG1 = 32931;
        const WANG_ANNOTATION = 32932;
        const WANG_TAG3 = 32933;
        const WANG_TAG4 = 32934;
        const IMAGE_REFERENCE_POINTS = 32953;
        const REGION_XFORM_TACK_POINT = 32954;
        const WARP_QUADRILATERAL = 32955;
        const AFFINE_TRANSFORM_MAT = 32956;
        const MATTEING = 32995;
        const DATA_TYPE = 32996;
        const IMAGE_DEPTH = 32997;
        const TILE_DEPTH = 32998;
        const IMAGE_FULL_WIDTH = 33300;
        const IMAGE_FULL_HEIGHT = 33301;
        const TEXTURE_FORMAT = 33302;
        const WRAP_MODES = 33303;
        const FOV_COT = 33304;
        const MATRIX_WORLD_TO_SCREEN = 33305;
        const MATRIX_WORLD_TO_CAMERA = 33306;
        const MODEL2 = 33405;
        const CFA_REPEAT_PATTERN_DIM = 33421;
        const CFA_PATTERN2 = 33422;
        const BATTERY_LEVEL = 33423;
        const KODAK_IFD = 33424;
        const COPYRIGHT = 33432;
        const EXPOSURE_TIME = 33434;
        const F_NUMBER = 33437;
        const MD_FILE_TAG = 33445;
        const MD_SCALE_PIXEL = 33446;
        const MD_COLOR_TABLE = 33447;
        const MD_LAB_NAME = 33448;
        const MD_SAMPLE_INFO = 33449;
        const MD_PREP_DATE = 33450;
        const MD_PREP_TIME = 33451;
        const MD_FILE_UNITS = 33452;
        const PIXEL_SCALE = 33550;
        const ADVENT_SCALE = 33589;
        const ADVENT_REVISION = 33590;
        const UIC1_TAG = 33628;
        const UIC2_TAG = 33629;
        const UIC3_TAG = 33630;
        const UIC4_TAG = 33631;
        const IPTC_NAA = 33723;
        const INTERGRAPH_PACKET_DATA = 33918;
        const INTERGRAPH_FLAG_REGISTERS = 33919;
        const INTERGRAPH_MATRIX = 33920;
        const INGR_RESERVED = 33921;
        const MODEL_TIE_POINT = 33922;
        const SITE = 34016;
        const COLOR_SEQUENCE = 34017;
        const IT8_HEADER = 34018;
        const RASTER_PADDING = 34019;
        const BITS_PER_RUN_LENGTH = 34020;
        const BITS_PER_EXTENDED_RUN_LENGTH = 34021;
        const COLOR_TABLE = 34022;
        const IMAGE_COLOR_INDICATOR = 34023;
        const BACKGROUND_COLOR_INDICATOR = 34024;
        const IMAGE_COLOR_VALUE = 34025;
        const BACKGROUND_COLOR_VALUE = 34026;
        const PIXEL_INTENSITY_RANGE = 34027;
        const TRANSPARENCY_INDICATOR = 34028;
        const COLOR_CHARACTERIZATION = 34029;
        const HC_USAGE = 34030;
        const TRAP_INDICATOR = 34031;
        const CMYK_EQUIVALENT = 34032;
        const SEM_INFO = 34118;
        const AFCP_IPTC = 34152;
        const PIXEL_MAGIC_JBIG_OPTIONS = 34232;
        const JPL_CARTO_IFD = 34263;
        const MODEL_TRANSFORM = 34264;
        const WB_GRGB_LEVELS = 34306;
        const LEAF_DATA = 34310;
        const PHOTOSHOP_SETTINGS = 34377;
        const EXIF_OFFSET = 34665;
        const ICC_PROFILE = 34675;
        const TIFF_FX_EXTENSIONS = 34687;
        const MULTI_PROFILES = 34688;
        const SHARED_DATA = 34689;
        const T88_OPTIONS = 34690;
        const IMAGE_LAYER = 34732;
        const GEO_TIFF_DIRECTORY = 34735;
        const GEO_TIFF_DOUBLE_PARAMS = 34736;
        const GEO_TIFF_ASCII_PARAMS = 34737;
        const JBIG_OPTIONS = 34750;
        const EXPOSURE_PROGRAM = 34850;
        const SPECTRAL_SENSITIVITY = 34852;
        const GPS_INFO = 34853;
        const ISO = 34855;
        const OPTO_ELECTRIC_CONV_FACTOR = 34856;
        const INTERLACE = 34857;
        const TIME_ZONE_OFFSET = 34858;
        const SELF_TIMER_MODE = 34859;
        const SENSITIVITY_TYPE = 34864;
        const STANDARD_OUTPUT_SENSITIVITY = 34865;
        const RECOMMENDED_EXPOSURE_INDEX = 34866;
        const ISO_SPEED = 34867;
        const ISO_SPEED_LATITUDEYYY = 34868;
        const ISO_SPEED_LATITUDEZZZ = 34869;
        const FAX_RECV_PARAMS = 34908;
        const FAX_SUB_ADDRESS = 34909;
        const FAX_RECV_TIME = 34910;
        const FEDEX_EDR = 34929;
        const LEAF_SUB_IFD = 34954;
        const EXIF_VERSION = 36864;
        const DATE_TIME_ORIGINAL = 36867;
        const CREATE_DATE = 36868;
        const GOOGLE_PLUS_UPLOAD_CODE = 36873;
        const OFFSET_TIME = 36880;
        const OFFSET_TIME_ORIGINAL = 36881;
        const OFFSET_TIME_DIGITIZED = 36882;
        const COMPONENTS_CONFIGURATION = 37121;
        const COMPRESSED_BITS_PER_PIXEL = 37122;
        const SHUTTER_SPEED_VALUE = 37377;
        const APERTURE_VALUE = 37378;
        const BRIGHTNESS_VALUE = 37379;
        const EXPOSURE_COMPENSATION = 37380;
        const MAX_APERTURE_VALUE = 37381;
        const SUBJECT_DISTANCE = 37382;
        const METERING_MODE = 37383;
        const LIGHT_SOURCE = 37384;
        const FLASH = 37385;
        const FOCAL_LENGTH = 37386;
        const FLASH_ENERGY = 37387;
        const SPATIAL_FREQUENCY_RESPONSE = 37388;
        const NOISE = 37389;
        const FOCAL_PLANE_X_RESOLUTION = 37390;
        const FOCAL_PLANE_Y_RESOLUTION = 37391;
        const FOCAL_PLANE_RESOLUTION_UNIT = 37392;
        const IMAGE_NUMBER = 37393;
        const SECURITY_CLASSIFICATION = 37394;
        const IMAGE_HISTORY = 37395;
        const SUBJECT_AREA = 37396;
        const EXPOSURE_INDEX = 37397;
        const TIFF_EP_STANDARD_ID = 37398;
        const SENSING_METHOD = 37399;
        const CIP3_DATA_FILE = 37434;
        const CIP3_SHEET = 37435;
        const CIP3_SIDE = 37436;
        const STO_NITS = 37439;
        const MAKER_NOTE = 37500;
        const USER_COMMENT = 37510;
        const SUB_SEC_TIME = 37520;
        const SUB_SEC_TIME_ORIGINAL = 37521;
        const SUB_SEC_TIME_DIGITIZED = 37522;
        const MS_DOCUMENT_TEXT = 37679;
        const MS_PROPERTY_SET_STORAGE = 37680;
        const MS_DOCUMENT_TEXT_POSITION = 37681;
        const IMAGE_SOURCE_DATA = 37724;
        const AMBIENT_TEMPERATURE = 37888;
        const HUMIDITY = 37889;
        const PRESSURE = 37890;
        const WATER_DEPTH = 37891;
        const ACCELERATION = 37892;
        const CAMERA_ELEVATION_ANGLE = 37893;
        const XP_TITLE = 40091;
        const XP_COMMENT = 40092;
        const XP_AUTHOR = 40093;
        const XP_KEYWORDS = 40094;
        const XP_SUBJECT = 40095;
        const FLASHPIX_VERSION = 40960;
        const COLOR_SPACE = 40961;
        const EXIF_IMAGE_WIDTH = 40962;
        const EXIF_IMAGE_HEIGHT = 40963;
        const RELATED_SOUND_FILE = 40964;
        const INTEROP_OFFSET = 40965;
        const SAMSUNG_RAW_POINTERS_OFFSET = 40976;
        const SAMSUNG_RAW_POINTERS_LENGTH = 40977;
        const SAMSUNG_RAW_BYTE_ORDER = 41217;
        const SAMSUNG_RAW_UNKNOWN = 41218;
        const FLASH_ENERGY2 = 41483;
        const SPATIAL_FREQUENCY_RESPONSE2 = 41484;
        const NOISE2 = 41485;
        const FOCAL_PLANE_X_RESOLUTION2 = 41486;
        const FOCAL_PLANE_Y_RESOLUTION2 = 41487;
        const FOCAL_PLANE_RESOLUTION_UNIT2 = 41488;
        const IMAGE_NUMBER2 = 41489;
        const SECURITY_CLASSIFICATION2 = 41490;
        const IMAGE_HISTORY2 = 41491;
        const SUBJECT_LOCATION = 41492;
        const EXPOSURE_INDEX2 = 41493;
        const TIFF_EP_STANDARD_ID2 = 41494;
        const SENSING_METHOD2 = 41495;
        const FILE_SOURCE = 41728;
        const SCENE_TYPE = 41729;
        const CFA_PATTERN = 41730;
        const CUSTOM_RENDERED = 41985;
        const EXPOSURE_MODE = 41986;
        const WHITE_BALANCE = 41987;
        const DIGITAL_ZOOM_RATIO = 41988;
        const FOCAL_LENGTH_IN35MM_FORMAT = 41989;
        const SCENE_CAPTURE_TYPE = 41990;
        const GAIN_CONTROL = 41991;
        const CONTRAST = 41992;
        const SATURATION = 41993;
        const SHARPNESS = 41994;
        const DEVICE_SETTING_DESCRIPTION = 41995;
        const SUBJECT_DISTANCE_RANGE = 41996;
        const IMAGE_UNIQUE_ID = 42016;
        const OWNER_NAME = 42032;
        const SERIAL_NUMBER = 42033;
        const LENS_INFO = 42034;
        const LENS_MAKE = 42035;
        const LENS_MODEL = 42036;
        const LENS_SERIAL_NUMBER = 42037;
        const GDAL_METADATA = 42112;
        const GDAL_NO_DATA = 42113;
        const GAMMA = 42240;
        const EXPAND_SOFTWARE = 44992;
        const EXPAND_LENS = 44993;
        const EXPAND_FILM = 44994;
        const EXPAND_FILTER_LENS = 44995;
        const EXPAND_SCANNER = 44996;
        const EXPAND_FLASH_LAMP = 44997;
        const PIXEL_FORMAT = 48129;
        const TRANSFORMATION = 48130;
        const UNCOMPRESSED = 48131;
        const IMAGE_TYPE = 48132;
        const IMAGE_WIDTH2 = 48256;
        const IMAGE_HEIGHT2 = 48257;
        const WIDTH_RESOLUTION = 48258;
        const HEIGHT_RESOLUTION = 48259;
        const IMAGE_OFFSET = 48320;
        const IMAGE_BYTE_COUNT = 48321;
        const ALPHA_OFFSET = 48322;
        const ALPHA_BYTE_COUNT = 48323;
        const IMAGE_DATA_DISCARD = 48324;
        const ALPHA_DATA_DISCARD = 48325;
        const OCE_SCANJOB_DESC = 50215;
        const OCE_APPLICATION_SELECTOR = 50216;
        const OCE_ID_NUMBER = 50217;
        const OCE_IMAGE_LOGIC = 50218;
        const ANNOTATIONS = 50255;
        const PRINT_IM = 50341;
        const ORIGINAL_FILE_NAME = 50547;
        const USPTO_ORIGINAL_CONTENT_TYPE = 50560;
        const DNG_VERSION = 50706;
        const DNG_BACKWARD_VERSION = 50707;
        const UNIQUE_CAMERA_MODEL = 50708;
        const LOCALIZED_CAMERA_MODEL = 50709;
        const CFA_PLANE_COLOR = 50710;
        const CFA_LAYOUT = 50711;
        const LINEARIZATION_TABLE = 50712;
        const BLACK_LEVEL_REPEAT_DIM = 50713;
        const BLACK_LEVEL = 50714;
        const BLACK_LEVEL_DELTA_H = 50715;
        const BLACK_LEVEL_DELTA_V = 50716;
        const WHITE_LEVEL = 50717;
        const DEFAULT_SCALE = 50718;
        const DEFAULT_CROP_ORIGIN = 50719;
        const DEFAULT_CROP_SIZE = 50720;
        const COLOR_MATRIX1 = 50721;
        const COLOR_MATRIX2 = 50722;
        const CAMERA_CALIBRATION1 = 50723;
        const CAMERA_CALIBRATION2 = 50724;
        const REDUCTION_MATRIX1 = 50725;
        const REDUCTION_MATRIX2 = 50726;
        const ANALOG_BALANCE = 50727;
        const AS_SHOT_NEUTRAL = 50728;
        const AS_SHOT_WHITE_XY = 50729;
        const BASELINE_EXPOSURE = 50730;
        const BASELINE_NOISE = 50731;
        const BASELINE_SHARPNESS = 50732;
        const BAYER_GREEN_SPLIT = 50733;
        const LINEAR_RESPONSE_LIMIT = 50734;
        const CAMERA_SERIAL_NUMBER = 50735;
        const DNG_LENS_INFO = 50736;
        const CHROMA_BLUR_RADIUS = 50737;
        const ANTI_ALIAS_STRENGTH = 50738;
        const SHADOW_SCALE = 50739;
        const SR2_PRIVATE = 50740;
        const MAKER_NOTE_SAFETY = 50741;
        const RAW_IMAGE_SEGMENTATION = 50752;
        const CALIBRATION_ILLUMINANT1 = 50778;
        const CALIBRATION_ILLUMINANT2 = 50779;
        const BEST_QUALITY_SCALE = 50780;
        const RAW_DATA_UNIQUE_ID = 50781;
        const ALIAS_LAYER_METADATA = 50784;
        const ORIGINAL_RAW_FILE_NAME = 50827;
        const ORIGINAL_RAW_FILE_DATA = 50828;
        const ACTIVE_AREA = 50829;
        const MASKED_AREAS = 50830;
        const AS_SHOT_ICC_PROFILE = 50831;
        const AS_SHOT_PRE_PROFILE_MATRIX = 50832;
        const CURRENT_ICC_PROFILE = 50833;
        const CURRENT_PRE_PROFILE_MATRIX = 50834;
        const COLORIMETRIC_REFERENCE = 50879;
        const S_RAW_TYPE = 50885;
        const PANASONIC_TITLE = 50898;
        const PANASONIC_TITLE2 = 50899;
        const CAMERA_CALIBRATION_SIG = 50931;
        const PROFILE_CALIBRATION_SIG = 50932;
        const PROFILE_IFD = 50933;
        const AS_SHOT_PROFILE_NAME = 50934;
        const NOISE_REDUCTION_APPLIED = 50935;
        const PROFILE_NAME = 50936;
        const PROFILE_HUE_SAT_MAP_DIMS = 50937;
        const PROFILE_HUE_SAT_MAP_DATA1 = 50938;
        const PROFILE_HUE_SAT_MAP_DATA2 = 50939;
        const PROFILE_TONE_CURVE = 50940;
        const PROFILE_EMBED_POLICY = 50941;
        const PROFILE_COPYRIGHT = 50942;
        const FORWARD_MATRIX1 = 50964;
        const FORWARD_MATRIX2 = 50965;
        const PREVIEW_APPLICATION_NAME = 50966;
        const PREVIEW_APPLICATION_VERSION = 50967;
        const PREVIEW_SETTINGS_NAME = 50968;
        const PREVIEW_SETTINGS_DIGEST = 50969;
        const PREVIEW_COLOR_SPACE = 50970;
        const PREVIEW_DATE_TIME = 50971;
        const RAW_IMAGE_DIGEST = 50972;
        const ORIGINAL_RAW_FILE_DIGEST = 50973;
        const SUB_TILE_BLOCK_SIZE = 50974;
        const ROW_INTERLEAVE_FACTOR = 50975;
        const PROFILE_LOOK_TABLE_DIMS = 50981;
        const PROFILE_LOOK_TABLE_DATA = 50982;
        const OPCODE_LIST1 = 51008;
        const OPCODE_LIST2 = 51009;
        const OPCODE_LIST3 = 51022;
        const NOISE_PROFILE = 51041;
        const TIME_CODES = 51043;
        const FRAME_RATE = 51044;
        const T_STOP = 51058;
        const REEL_NAME = 51081;
        const ORIGINAL_DEFAULT_FINAL_SIZE = 51089;
        const ORIGINAL_BEST_QUALITY_SIZE = 51090;
        const ORIGINAL_DEFAULT_CROP_SIZE = 51091;
        const CAMERA_LABEL = 51105;
        const PROFILE_HUE_SAT_MAP_ENCODING = 51107;
        const PROFILE_LOOK_TABLE_ENCODING = 51108;
        const BASELINE_EXPOSURE_OFFSET = 51109;
        const DEFAULT_BLACK_RENDER = 51110;
        const NEW_RAW_IMAGE_DIGEST = 51111;
        const RAW_TO_PREVIEW_GAIN = 51112;
        const DEFAULT_USER_CROP = 51125;
        const PADDING = 59932;
        const OFFSET_SCHEMA = 59933;
        const OWNER_NAME2 = 65000;
        const SERIAL_NUMBER2 = 65001;
        const LENS = 65002;
        const KDC_IFD = 65024;
        const RAW_FILE = 65100;
        const CONVERTER = 65101;
        const WHITE_BALANCE2 = 65102;
        const EXPOSURE = 65105;
        const SHADOWS = 65106;
        const BRIGHTNESS = 65107;
        const CONTRAST2 = 65108;
        const SATURATION2 = 65109;
        const SHARPNESS2 = 65110;
        const SMOOTHNESS = 65111;
        const MOIRE_FILTER = 65112;

        private const _VALUES = [1 => true, 2 => true, 256 => true, 257 => true, 258 => true, 259 => true, 262 => true, 263 => true, 264 => true, 265 => true, 266 => true, 269 => true, 270 => true, 271 => true, 272 => true, 273 => true, 274 => true, 277 => true, 278 => true, 279 => true, 280 => true, 281 => true, 282 => true, 283 => true, 284 => true, 285 => true, 286 => true, 287 => true, 288 => true, 289 => true, 290 => true, 291 => true, 292 => true, 293 => true, 296 => true, 297 => true, 300 => true, 301 => true, 305 => true, 306 => true, 315 => true, 316 => true, 317 => true, 318 => true, 319 => true, 320 => true, 321 => true, 322 => true, 323 => true, 324 => true, 325 => true, 326 => true, 327 => true, 328 => true, 330 => true, 332 => true, 333 => true, 334 => true, 336 => true, 337 => true, 338 => true, 339 => true, 340 => true, 341 => true, 342 => true, 343 => true, 344 => true, 345 => true, 346 => true, 347 => true, 351 => true, 400 => true, 401 => true, 402 => true, 403 => true, 404 => true, 405 => true, 433 => true, 434 => true, 435 => true, 437 => true, 512 => true, 513 => true, 514 => true, 515 => true, 517 => true, 518 => true, 519 => true, 520 => true, 521 => true, 529 => true, 530 => true, 531 => true, 532 => true, 559 => true, 700 => true, 999 => true, 4096 => true, 4097 => true, 4098 => true, 18246 => true, 18247 => true, 18248 => true, 18249 => true, 28672 => true, 28722 => true, 28725 => true, 28727 => true, 32781 => true, 32931 => true, 32932 => true, 32933 => true, 32934 => true, 32953 => true, 32954 => true, 32955 => true, 32956 => true, 32995 => true, 32996 => true, 32997 => true, 32998 => true, 33300 => true, 33301 => true, 33302 => true, 33303 => true, 33304 => true, 33305 => true, 33306 => true, 33405 => true, 33421 => true, 33422 => true, 33423 => true, 33424 => true, 33432 => true, 33434 => true, 33437 => true, 33445 => true, 33446 => true, 33447 => true, 33448 => true, 33449 => true, 33450 => true, 33451 => true, 33452 => true, 33550 => true, 33589 => true, 33590 => true, 33628 => true, 33629 => true, 33630 => true, 33631 => true, 33723 => true, 33918 => true, 33919 => true, 33920 => true, 33921 => true, 33922 => true, 34016 => true, 34017 => true, 34018 => true, 34019 => true, 34020 => true, 34021 => true, 34022 => true, 34023 => true, 34024 => true, 34025 => true, 34026 => true, 34027 => true, 34028 => true, 34029 => true, 34030 => true, 34031 => true, 34032 => true, 34118 => true, 34152 => true, 34232 => true, 34263 => true, 34264 => true, 34306 => true, 34310 => true, 34377 => true, 34665 => true, 34675 => true, 34687 => true, 34688 => true, 34689 => true, 34690 => true, 34732 => true, 34735 => true, 34736 => true, 34737 => true, 34750 => true, 34850 => true, 34852 => true, 34853 => true, 34855 => true, 34856 => true, 34857 => true, 34858 => true, 34859 => true, 34864 => true, 34865 => true, 34866 => true, 34867 => true, 34868 => true, 34869 => true, 34908 => true, 34909 => true, 34910 => true, 34929 => true, 34954 => true, 36864 => true, 36867 => true, 36868 => true, 36873 => true, 36880 => true, 36881 => true, 36882 => true, 37121 => true, 37122 => true, 37377 => true, 37378 => true, 37379 => true, 37380 => true, 37381 => true, 37382 => true, 37383 => true, 37384 => true, 37385 => true, 37386 => true, 37387 => true, 37388 => true, 37389 => true, 37390 => true, 37391 => true, 37392 => true, 37393 => true, 37394 => true, 37395 => true, 37396 => true, 37397 => true, 37398 => true, 37399 => true, 37434 => true, 37435 => true, 37436 => true, 37439 => true, 37500 => true, 37510 => true, 37520 => true, 37521 => true, 37522 => true, 37679 => true, 37680 => true, 37681 => true, 37724 => true, 37888 => true, 37889 => true, 37890 => true, 37891 => true, 37892 => true, 37893 => true, 40091 => true, 40092 => true, 40093 => true, 40094 => true, 40095 => true, 40960 => true, 40961 => true, 40962 => true, 40963 => true, 40964 => true, 40965 => true, 40976 => true, 40977 => true, 41217 => true, 41218 => true, 41483 => true, 41484 => true, 41485 => true, 41486 => true, 41487 => true, 41488 => true, 41489 => true, 41490 => true, 41491 => true, 41492 => true, 41493 => true, 41494 => true, 41495 => true, 41728 => true, 41729 => true, 41730 => true, 41985 => true, 41986 => true, 41987 => true, 41988 => true, 41989 => true, 41990 => true, 41991 => true, 41992 => true, 41993 => true, 41994 => true, 41995 => true, 41996 => true, 42016 => true, 42032 => true, 42033 => true, 42034 => true, 42035 => true, 42036 => true, 42037 => true, 42112 => true, 42113 => true, 42240 => true, 44992 => true, 44993 => true, 44994 => true, 44995 => true, 44996 => true, 44997 => true, 48129 => true, 48130 => true, 48131 => true, 48132 => true, 48256 => true, 48257 => true, 48258 => true, 48259 => true, 48320 => true, 48321 => true, 48322 => true, 48323 => true, 48324 => true, 48325 => true, 50215 => true, 50216 => true, 50217 => true, 50218 => true, 50255 => true, 50341 => true, 50547 => true, 50560 => true, 50706 => true, 50707 => true, 50708 => true, 50709 => true, 50710 => true, 50711 => true, 50712 => true, 50713 => true, 50714 => true, 50715 => true, 50716 => true, 50717 => true, 50718 => true, 50719 => true, 50720 => true, 50721 => true, 50722 => true, 50723 => true, 50724 => true, 50725 => true, 50726 => true, 50727 => true, 50728 => true, 50729 => true, 50730 => true, 50731 => true, 50732 => true, 50733 => true, 50734 => true, 50735 => true, 50736 => true, 50737 => true, 50738 => true, 50739 => true, 50740 => true, 50741 => true, 50752 => true, 50778 => true, 50779 => true, 50780 => true, 50781 => true, 50784 => true, 50827 => true, 50828 => true, 50829 => true, 50830 => true, 50831 => true, 50832 => true, 50833 => true, 50834 => true, 50879 => true, 50885 => true, 50898 => true, 50899 => true, 50931 => true, 50932 => true, 50933 => true, 50934 => true, 50935 => true, 50936 => true, 50937 => true, 50938 => true, 50939 => true, 50940 => true, 50941 => true, 50942 => true, 50964 => true, 50965 => true, 50966 => true, 50967 => true, 50968 => true, 50969 => true, 50970 => true, 50971 => true, 50972 => true, 50973 => true, 50974 => true, 50975 => true, 50981 => true, 50982 => true, 51008 => true, 51009 => true, 51022 => true, 51041 => true, 51043 => true, 51044 => true, 51058 => true, 51081 => true, 51089 => true, 51090 => true, 51091 => true, 51105 => true, 51107 => true, 51108 => true, 51109 => true, 51110 => true, 51111 => true, 51112 => true, 51125 => true, 59932 => true, 59933 => true, 65000 => true, 65001 => true, 65002 => true, 65024 => true, 65100 => true, 65101 => true, 65102 => true, 65105 => true, 65106 => true, 65107 => true, 65108 => true, 65109 => true, 65110 => true, 65111 => true, 65112 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
