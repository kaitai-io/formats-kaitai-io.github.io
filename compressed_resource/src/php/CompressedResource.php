<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Compressed Macintosh resource data,
 * as stored in resources with the "compressed" attribute.
 * 
 * Resource decompression is not documented by Apple.
 * It is mostly used internally in System 7,
 * some of Apple's own applications (such as ResEdit),
 * and also by some third-party applications.
 * Later versions of Classic Mac OS make less use of resource compression,
 * but still support it fully for backwards compatibility.
 * Carbon in Mac OS X no longer supports resource compression in any way.
 * 
 * The data of all compressed resources starts with a common header,
 * followed by the compressed data.
 * The data is decompressed using code in a `'dcmp'` resource.
 * Some decompressors used by Apple are included in the System file,
 * but applications can also include custom decompressors.
 * The header of the compressed data indicates the ID of the `'dcmp'` resource used to decompress the data,
 * along with some parameters for the decompressor.
 */

namespace {
    class CompressedResource extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\CompressedResource $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_header = new \CompressedResource\Header($this->_io, $this, $this->_root);
            $this->_m_compressedData = $this->_io->readBytesFull();
        }
        protected $_m_header;
        protected $_m_compressedData;

        /**
         * The header of the compressed data.
         */
        public function header() { return $this->_m_header; }

        /**
         * The compressed resource data.
         * 
         * The format of this data is completely dependent on the decompressor and its parameters,
         * as specified in the header.
         * For details about the compressed data formats implemented by Apple's decompressors,
         * see the specs in the resource_compression subdirectory.
         */
        public function compressedData() { return $this->_m_compressedData; }
    }
}

/**
 * Compressed resource data header,
 * as stored at the start of all compressed resources.
 */

namespace CompressedResource {
    class Header extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\CompressedResource $_parent = null, ?\CompressedResource $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_commonPart = new \CompressedResource\Header\CommonPart($this->_io, $this, $this->_root);
            $this->_m__raw_typeSpecificPartRawWithIo = $this->_io->readBytes($this->commonPart()->lenHeader() - 12);
            $_io__raw_typeSpecificPartRawWithIo = new \Kaitai\Struct\Stream($this->_m__raw_typeSpecificPartRawWithIo);
            $this->_m_typeSpecificPartRawWithIo = new \BytesWithIo($_io__raw_typeSpecificPartRawWithIo);
        }
        protected $_m_typeSpecificPart;

        /**
         * The type-specific part of the header,
         * parsed according to the type from the common part.
         */
        public function typeSpecificPart() {
            if ($this->_m_typeSpecificPart !== null)
                return $this->_m_typeSpecificPart;
            $io = $this->typeSpecificPartRawWithIo()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            switch ($this->commonPart()->headerType()) {
                case 8:
                    $this->_m_typeSpecificPart = new \CompressedResource\Header\TypeSpecificPartType8($io, $this, $this->_root);
                    break;
                case 9:
                    $this->_m_typeSpecificPart = new \CompressedResource\Header\TypeSpecificPartType9($io, $this, $this->_root);
                    break;
            }
            $io->seek($_pos);
            return $this->_m_typeSpecificPart;
        }
        protected $_m_typeSpecificPartRaw;

        /**
         * The type-specific part of the header,
         * as a raw byte array.
         */
        public function typeSpecificPartRaw() {
            if ($this->_m_typeSpecificPartRaw !== null)
                return $this->_m_typeSpecificPartRaw;
            $this->_m_typeSpecificPartRaw = $this->typeSpecificPartRawWithIo()->data();
            return $this->_m_typeSpecificPartRaw;
        }
        protected $_m_commonPart;
        protected $_m_typeSpecificPartRawWithIo;
        protected $_m__raw_typeSpecificPartRawWithIo;

        /**
         * The common part of the header.
         * Among other things,
         * this part contains the header type,
         * which determines the format of the data in the type-specific part of the header.
         */
        public function commonPart() { return $this->_m_commonPart; }

        /**
         * Use `type_specific_part_raw` instead,
         * unless you need access to this field's `_io`.
         */
        public function typeSpecificPartRawWithIo() { return $this->_m_typeSpecificPartRawWithIo; }
        public function _raw_typeSpecificPartRawWithIo() { return $this->_m__raw_typeSpecificPartRawWithIo; }
    }
}

/**
 * The common part of a compressed resource data header.
 * The format of this part is the same for all compressed resources.
 */

namespace CompressedResource\Header {
    class CommonPart extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\CompressedResource\Header $_parent = null, ?\CompressedResource $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\xA8\x9F\x65\x72")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xA8\x9F\x65\x72", $this->_m_magic, $this->_io, "/types/header/types/common_part/seq/0");
            }
            $this->_m_lenHeader = $this->_io->readU2be();
            if (!($this->_m_lenHeader == 18)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(18, $this->_m_lenHeader, $this->_io, "/types/header/types/common_part/seq/1");
            }
            $this->_m_headerType = $this->_io->readU1();
            $this->_m_unknown = $this->_io->readU1();
            if (!($this->_m_unknown == 1)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(1, $this->_m_unknown, $this->_io, "/types/header/types/common_part/seq/3");
            }
            $this->_m_lenDecompressed = $this->_io->readU4be();
        }
        protected $_m_magic;
        protected $_m_lenHeader;
        protected $_m_headerType;
        protected $_m_unknown;
        protected $_m_lenDecompressed;

        /**
         * The signature of all compressed resource data.
         * 
         * When interpreted as MacRoman, this byte sequence decodes to `®üer`.
         */
        public function magic() { return $this->_m_magic; }

        /**
         * The byte length of the entire header (common and type-specific parts).
         * 
         * The meaning of this field is mostly a guess,
         * as all known header types result in a total length of `0x12`.
         */
        public function lenHeader() { return $this->_m_lenHeader; }

        /**
         * Type of the header.
         * This determines the format of the data in the type-specific part of the header.
         * 
         * The only known header type values are `8` and `9`.
         * 
         * Every known decompressor is only compatible with one of the header types
         * (but every header type is used by more than one decompressor).
         * Apple's decompressors with IDs 0 and 1 use header type 8,
         * and those with IDs 2 and 3 use header type 9.
         */
        public function headerType() { return $this->_m_headerType; }

        /**
         * The meaning of this field is not known.
         * It has the value `0x01` in all known compressed resources.
         */
        public function unknown() { return $this->_m_unknown; }

        /**
         * The byte length of the data after decompression.
         */
        public function lenDecompressed() { return $this->_m_lenDecompressed; }
    }
}

/**
 * The type-specific part of a compressed resource header with header type `8`.
 */

namespace CompressedResource\Header {
    class TypeSpecificPartType8 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\CompressedResource\Header $_parent = null, ?\CompressedResource $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_workingBufferFractionalSize = $this->_io->readU1();
            $this->_m_expansionBufferSize = $this->_io->readU1();
            $this->_m_decompressorId = $this->_io->readS2be();
            $this->_m_reserved = $this->_io->readU2be();
            if (!($this->_m_reserved == 0)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(0, $this->_m_reserved, $this->_io, "/types/header/types/type_specific_part_type_8/seq/3");
            }
        }
        protected $_m_workingBufferFractionalSize;
        protected $_m_expansionBufferSize;
        protected $_m_decompressorId;
        protected $_m_reserved;

        /**
         * The ratio of the compressed data size to the uncompressed data size,
         * times 256.
         * 
         * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
         * but does not have a direct effect on the decompressor
         * (except that it will misbehave if insufficient memory is provided).
         * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
         */
        public function workingBufferFractionalSize() { return $this->_m_workingBufferFractionalSize; }

        /**
         * The maximum number of bytes that the compressed data might "grow" during decompression.
         * 
         * This parameter affects the amount of memory allocated by the Resource Manager during decompression,
         * but does not have a direct effect on the decompressor
         * (except that it will misbehave if insufficient memory is provided).
         * Alternative decompressors that decompress resources into a separate buffer rather than in-place can generally ignore this parameter.
         */
        public function expansionBufferSize() { return $this->_m_expansionBufferSize; }

        /**
         * The ID of the `'dcmp'` resource that should be used to decompress this resource.
         */
        public function decompressorId() { return $this->_m_decompressorId; }

        /**
         * The meaning of this field is not known.
         * It has the value `0` in all known compressed resources,
         * so it is most likely reserved.
         */
        public function reserved() { return $this->_m_reserved; }
    }
}

/**
 * The type-specific part of a compressed resource header with header type `9`.
 */

namespace CompressedResource\Header {
    class TypeSpecificPartType9 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\CompressedResource\Header $_parent = null, ?\CompressedResource $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_decompressorId = $this->_io->readS2be();
            $this->_m__raw_decompressorSpecificParametersWithIo = $this->_io->readBytes(4);
            $_io__raw_decompressorSpecificParametersWithIo = new \Kaitai\Struct\Stream($this->_m__raw_decompressorSpecificParametersWithIo);
            $this->_m_decompressorSpecificParametersWithIo = new \BytesWithIo($_io__raw_decompressorSpecificParametersWithIo);
        }
        protected $_m_decompressorSpecificParameters;

        /**
         * Decompressor-specific parameters.
         * The exact structure and meaning of this field is different for each decompressor.
         * 
         * This field always has the same length,
         * but decompressors don't always use the entirety of the field,
         * so depending on the decompressor some parts of this field may be meaningless.
         */
        public function decompressorSpecificParameters() {
            if ($this->_m_decompressorSpecificParameters !== null)
                return $this->_m_decompressorSpecificParameters;
            $this->_m_decompressorSpecificParameters = $this->decompressorSpecificParametersWithIo()->data();
            return $this->_m_decompressorSpecificParameters;
        }
        protected $_m_decompressorId;
        protected $_m_decompressorSpecificParametersWithIo;
        protected $_m__raw_decompressorSpecificParametersWithIo;

        /**
         * The ID of the `'dcmp'` resource that should be used to decompress this resource.
         */
        public function decompressorId() { return $this->_m_decompressorId; }

        /**
         * Use `decompressor_specific_parameters` instead,
         * unless you need access to this field's `_io`.
         */
        public function decompressorSpecificParametersWithIo() { return $this->_m_decompressorSpecificParametersWithIo; }
        public function _raw_decompressorSpecificParametersWithIo() { return $this->_m__raw_decompressorSpecificParametersWithIo; }
    }
}
