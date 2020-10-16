<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Compressed resource data in `'dcmp' (2)` format,
 * as stored in compressed resources with header type `9` and decompressor ID `2`.
 * 
 * The `'dcmp' (2)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the System file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (2)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format is based on simple dictionary coding,
 * where each byte in the compressed data expands to two bytes,
 * based on a lookup table
 * (either included in the compressed data or provided by the decompressor).
 * An alternative "tagged" compression format is also supported,
 * which allows using two-byte literals in addition to single-byte table references,
 * at the cost of requiring an extra "tag" byte every 16 output bytes,
 * to differentiate literals and table references.
 */

namespace {
    class Dcmp2 extends \Kaitai\Struct\Struct {
        public function __construct(int $lenDecompressed, \BytesWithIo $headerParametersWithIo, \Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dcmp2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_m_lenDecompressed = $lenDecompressed;
            $this->_m_headerParametersWithIo = $headerParametersWithIo;
            $this->_read();
        }

        private function _read() {
            if ($this->headerParameters()->flags()->hasCustomLookupTable()) {
                $this->_m_customLookupTable = [];
                $n = $this->headerParameters()->numCustomLookupTableEntries();
                for ($i = 0; $i < $n; $i++) {
                    $this->_m_customLookupTable[] = $this->_io->readBytes(2);
                }
            }
            switch ($this->headerParameters()->flags()->tagged()) {
                case true:
                    $this->_m__raw_data = $this->_io->readBytes((($this->_io()->size() - $this->_io()->pos()) - ($this->isLenDecompressedOdd() ? 1 : 0)));
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Dcmp2\TaggedData($_io__raw_data, $this, $this->_root);
                    break;
                default:
                    $this->_m__raw_data = $this->_io->readBytes((($this->_io()->size() - $this->_io()->pos()) - ($this->isLenDecompressedOdd() ? 1 : 0)));
                    $_io__raw_data = new \Kaitai\Struct\Stream($this->_m__raw_data);
                    $this->_m_data = new \Dcmp2\UntaggedData($_io__raw_data, $this, $this->_root);
                    break;
            }
            if ($this->isLenDecompressedOdd()) {
                $this->_m_lastByte = $this->_io->readBytes(1);
            }
        }
        protected $_m_headerParameters;

        /**
         * The parsed decompressor-specific parameters from the compressed resource header.
         */
        public function headerParameters() {
            if ($this->_m_headerParameters !== null)
                return $this->_m_headerParameters;
            $io = $this->headerParametersWithIo()->_io();
            $_pos = $io->pos();
            $io->seek(0);
            $this->_m_headerParameters = new \Dcmp2\HeaderParameters($io, $this, $this->_root);
            $io->seek($_pos);
            return $this->_m_headerParameters;
        }
        protected $_m_isLenDecompressedOdd;

        /**
         * Whether the length of the decompressed data is odd.
         * This affects the meaning of the last byte of the compressed data.
         */
        public function isLenDecompressedOdd() {
            if ($this->_m_isLenDecompressedOdd !== null)
                return $this->_m_isLenDecompressedOdd;
            $this->_m_isLenDecompressedOdd = \Kaitai\Struct\Stream::mod($this->lenDecompressed(), 2) != 0;
            return $this->_m_isLenDecompressedOdd;
        }
        protected $_m_defaultLookupTable;

        /**
         * The default lookup table,
         * which is used if no custom lookup table is included with the compressed data.
         */
        public function defaultLookupTable() {
            if ($this->_m_defaultLookupTable !== null)
                return $this->_m_defaultLookupTable;
            $this->_m_defaultLookupTable = ["\x00\x00", "\x00\x08", "\x4E\xBA", "\x20\x6E", "\x4E\x75", "\x00\x0C", "\x00\x04", "\x70\x00", "\x00\x10", "\x00\x02", "\x48\x6E", "\xFF\xFC", "\x60\x00", "\x00\x01", "\x48\xE7", "\x2F\x2E", "\x4E\x56", "\x00\x06", "\x4E\x5E", "\x2F\x00", "\x61\x00", "\xFF\xF8", "\x2F\x0B", "\xFF\xFF", "\x00\x14", "\x00\x0A", "\x00\x18", "\x20\x5F", "\x00\x0E", "\x20\x50", "\x3F\x3C", "\xFF\xF4", "\x4C\xEE", "\x30\x2E", "\x67\x00", "\x4C\xDF", "\x26\x6E", "\x00\x12", "\x00\x1C", "\x42\x67", "\xFF\xF0", "\x30\x3C", "\x2F\x0C", "\x00\x03", "\x4E\xD0", "\x00\x20", "\x70\x01", "\x00\x16", "\x2D\x40", "\x48\xC0", "\x20\x78", "\x72\x00", "\x58\x8F", "\x66\x00", "\x4F\xEF", "\x42\xA7", "\x67\x06", "\xFF\xFA", "\x55\x8F", "\x28\x6E", "\x3F\x00", "\xFF\xFE", "\x2F\x3C", "\x67\x04", "\x59\x8F", "\x20\x6B", "\x00\x24", "\x20\x1F", "\x41\xFA", "\x81\xE1", "\x66\x04", "\x67\x08", "\x00\x1A", "\x4E\xB9", "\x50\x8F", "\x20\x2E", "\x00\x07", "\x4E\xB0", "\xFF\xF2", "\x3D\x40", "\x00\x1E", "\x20\x68", "\x66\x06", "\xFF\xF6", "\x4E\xF9", "\x08\x00", "\x0C\x40", "\x3D\x7C", "\xFF\xEC", "\x00\x05", "\x20\x3C", "\xFF\xE8", "\xDE\xFC", "\x4A\x2E", "\x00\x30", "\x00\x28", "\x2F\x08", "\x20\x0B", "\x60\x02", "\x42\x6E", "\x2D\x48", "\x20\x53", "\x20\x40", "\x18\x00", "\x60\x04", "\x41\xEE", "\x2F\x28", "\x2F\x01", "\x67\x0A", "\x48\x40", "\x20\x07", "\x66\x08", "\x01\x18", "\x2F\x07", "\x30\x28", "\x3F\x2E", "\x30\x2B", "\x22\x6E", "\x2F\x2B", "\x00\x2C", "\x67\x0C", "\x22\x5F", "\x60\x06", "\x00\xFF", "\x30\x07", "\xFF\xEE", "\x53\x40", "\x00\x40", "\xFF\xE4", "\x4A\x40", "\x66\x0A", "\x00\x0F", "\x4E\xAD", "\x70\xFF", "\x22\xD8", "\x48\x6B", "\x00\x22", "\x20\x4B", "\x67\x0E", "\x4A\xAE", "\x4E\x90", "\xFF\xE0", "\xFF\xC0", "\x00\x2A", "\x27\x40", "\x67\x02", "\x51\xC8", "\x02\xB6", "\x48\x7A", "\x22\x78", "\xB0\x6E", "\xFF\xE6", "\x00\x09", "\x32\x2E", "\x3E\x00", "\x48\x41", "\xFF\xEA", "\x43\xEE", "\x4E\x71", "\x74\x00", "\x2F\x2C", "\x20\x6C", "\x00\x3C", "\x00\x26", "\x00\x50", "\x18\x80", "\x30\x1F", "\x22\x00", "\x66\x0C", "\xFF\xDA", "\x00\x38", "\x66\x02", "\x30\x2C", "\x20\x0C", "\x2D\x6E", "\x42\x40", "\xFF\xE2", "\xA9\xF0", "\xFF\x00", "\x37\x7C", "\xE5\x80", "\xFF\xDC", "\x48\x68", "\x59\x4F", "\x00\x34", "\x3E\x1F", "\x60\x08", "\x2F\x06", "\xFF\xDE", "\x60\x0A", "\x70\x02", "\x00\x32", "\xFF\xCC", "\x00\x80", "\x22\x51", "\x10\x1F", "\x31\x7C", "\xA0\x29", "\xFF\xD8", "\x52\x40", "\x01\x00", "\x67\x10", "\xA0\x23", "\xFF\xCE", "\xFF\xD4", "\x20\x06", "\x48\x78", "\x00\x2E", "\x50\x4F", "\x43\xFA", "\x67\x12", "\x76\x00", "\x41\xE8", "\x4A\x6E", "\x20\xD9", "\x00\x5A", "\x7F\xFF", "\x51\xCA", "\x00\x5C", "\x2E\x00", "\x02\x40", "\x48\xC7", "\x67\x14", "\x0C\x80", "\x2E\x9F", "\xFF\xD6", "\x80\x00", "\x10\x00", "\x48\x42", "\x4A\x6B", "\xFF\xD2", "\x00\x48", "\x4A\x47", "\x4E\xD1", "\x20\x6F", "\x00\x41", "\x60\x0C", "\x2A\x78", "\x42\x2E", "\x32\x00", "\x65\x74", "\x67\x16", "\x00\x44", "\x48\x6D", "\x20\x08", "\x48\x6C", "\x0B\x7C", "\x26\x40", "\x04\x00", "\x00\x68", "\x20\x6D", "\x00\x0D", "\x2A\x40", "\x00\x0B", "\x00\x3E", "\x02\x20"];
            return $this->_m_defaultLookupTable;
        }
        protected $_m_lookupTable;

        /**
         * The lookup table to be used for this compressed data.
         */
        public function lookupTable() {
            if ($this->_m_lookupTable !== null)
                return $this->_m_lookupTable;
            $this->_m_lookupTable = ($this->headerParameters()->flags()->hasCustomLookupTable() ? $this->customLookupTable() : $this->defaultLookupTable());
            return $this->_m_lookupTable;
        }
        protected $_m_customLookupTable;
        protected $_m_data;
        protected $_m_lastByte;
        protected $_m_lenDecompressed;
        protected $_m_headerParametersWithIo;
        protected $_m__raw_data;

        /**
         * The custom lookup table to be used instead of the default lookup table.
         */
        public function customLookupTable() { return $this->_m_customLookupTable; }

        /**
         * The compressed data.
         * The structure of the data varies depending on whether the "tagged" or "untagged" variant of the compression format is used.
         */
        public function data() { return $this->_m_data; }

        /**
         * The last byte of the decompressed data,
         * stored literally.
         * Only present if the decompressed data has an odd length.
         * 
         * This special case is necessary because the compressed data is otherwise always stored in two-byte groups,
         * either literally or as table references,
         * so otherwise there would be no way to compress odd-length resources using this format.
         */
        public function lastByte() { return $this->_m_lastByte; }

        /**
         * The length of the decompressed data in bytes,
         * from the compressed resource header.
         */
        public function lenDecompressed() { return $this->_m_lenDecompressed; }

        /**
         * The unparsed decompressor-specific parameters,
         * from the compressed resource header.
         */
        public function headerParametersWithIo() { return $this->_m_headerParametersWithIo; }
        public function _raw_data() { return $this->_m__raw_data; }
    }
}

/**
 * Decompressor-specific parameters for this compression format,
 * as stored in the compressed resource header.
 */

namespace Dcmp2 {
    class HeaderParameters extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp2 $_parent = null, \Dcmp2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_unknown = $this->_io->readU2be();
            $this->_m_numCustomLookupTableEntriesM1 = $this->_io->readU1();
            $this->_m_flags = new \Dcmp2\HeaderParameters\Flags($this->_io, $this, $this->_root);
        }
        protected $_m_numCustomLookupTableEntries;

        /**
         * The number of entries in the custom lookup table.
         * Only used if a custom lookup table is present.
         */
        public function numCustomLookupTableEntries() {
            if ($this->_m_numCustomLookupTableEntries !== null)
                return $this->_m_numCustomLookupTableEntries;
            if ($this->flags()->hasCustomLookupTable()) {
                $this->_m_numCustomLookupTableEntries = ($this->numCustomLookupTableEntriesM1() + 1);
            }
            return $this->_m_numCustomLookupTableEntries;
        }
        protected $_m_unknown;
        protected $_m_numCustomLookupTableEntriesM1;
        protected $_m_flags;

        /**
         * The meaning of this field is unknown.
         * It does not appear to have any effect on the format of the compressed data or the decompression process.
         * 
         * The value of this field is usually zero and otherwise a small integer (< 10).
         * For `'lpch'` resources,
         * the value is always nonzero,
         * and sometimes larger than usual.
         */
        public function unknown() { return $this->_m_unknown; }

        /**
         * The number of entries in the custom lookup table,
         * minus one.
         * 
         * If the default lookup table is used rather than a custom one,
         * this value is zero.
         */
        public function numCustomLookupTableEntriesM1() { return $this->_m_numCustomLookupTableEntriesM1; }

        /**
         * Various flags that affect the format of the compressed data and the decompression process.
         */
        public function flags() { return $this->_m_flags; }
    }
}

/**
 * Flags for the decompressor,
 * as stored in the decompressor-specific parameters.
 */

namespace Dcmp2\HeaderParameters {
    class Flags extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp2\HeaderParameters $_parent = null, \Dcmp2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_reserved = $this->_io->readBitsIntBe(6);
            $this->_m_tagged = $this->_io->readBitsIntBe(1) != 0;
            $this->_m_hasCustomLookupTable = $this->_io->readBitsIntBe(1) != 0;
        }
        protected $_m_asInt;

        /**
         * The flags as a packed integer,
         * as they are stored in the data.
         */
        public function asInt() {
            if ($this->_m_asInt !== null)
                return $this->_m_asInt;
            $_pos = $this->_io->pos();
            $this->_io->seek(0);
            $this->_m_asInt = $this->_io->readU1();
            $this->_io->seek($_pos);
            return $this->_m_asInt;
        }
        protected $_m_reserved;
        protected $_m_tagged;
        protected $_m_hasCustomLookupTable;

        /**
         * These flags have no known usage or meaning and should always be zero.
         */
        public function reserved() { return $this->_m_reserved; }

        /**
         * Whether the "tagged" variant of this compression format should be used,
         * rather than the default "untagged" variant.
         */
        public function tagged() { return $this->_m_tagged; }

        /**
         * Whether a custom lookup table is included before the compressed data,
         * which should be used instead of the default hardcoded lookup table.
         */
        public function hasCustomLookupTable() { return $this->_m_hasCustomLookupTable; }
    }
}

/**
 * Compressed data in the "untagged" variant of the format.
 */

namespace Dcmp2 {
    class UntaggedData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp2 $_parent = null, \Dcmp2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tableReferences = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_tableReferences[] = $this->_io->readU1();
                $i++;
            }
        }
        protected $_m_tableReferences;

        /**
         * References into the lookup table.
         * Each reference is an integer that is expanded to two bytes by looking it up in the table.
         */
        public function tableReferences() { return $this->_m_tableReferences; }
    }
}

/**
 * Compressed data in the "tagged" variant of the format.
 */

namespace Dcmp2 {
    class TaggedData extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp2 $_parent = null, \Dcmp2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_chunks = [];
            $i = 0;
            while (!$this->_io->isEof()) {
                $this->_m_chunks[] = new \Dcmp2\TaggedData\Chunk($this->_io, $this, $this->_root);
                $i++;
            }
        }
        protected $_m_chunks;

        /**
         * The tagged chunks that make up the compressed data.
         */
        public function chunks() { return $this->_m_chunks; }
    }
}

/**
 * A single tagged chunk of compressed data.
 * 
 * Each chunk expands to 16 bytes of decompressed data.
 * In compressed form,
 * the chunks have a variable length
 * (between 9 and 17 bytes)
 * depending on the value of the tag byte.
 */

namespace Dcmp2\TaggedData {
    class Chunk extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp2\TaggedData $_parent = null, \Dcmp2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tag = [];
            $n = 8;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_tag[] = $this->_io->readBitsIntBe(1) != 0;
            }
            $this->_io->alignToByte();
            $this->_m__raw_units = [];
            $this->_m_units = [];
            $i = 0;
            do {
                switch ($this->tag()[$i]) {
                    case true:
                        $_ = $this->_io->readU1();
                        $this->_m_units[] = $_;
                        break;
                    default:
                        $_ = $this->_io->readBytes(($this->tag()[$i] ? 1 : 2));
                        $this->_m_units[] = $_;
                        break;
                }
                $i++;
            } while (!( (($i >= 7) || ($this->_io()->isEof())) ));
        }
        protected $_m_tag;
        protected $_m_units;

        /**
         * The bits of the tag byte control the format and meaning of the 8 compressed data units that follow the tag byte.
         */
        public function tag() { return $this->_m_tag; }

        /**
         * The compressed data units in this chunk.
         * 
         * The format and meaning of each unit is controlled by the bit in the tag byte with the same index.
         * If the bit is 0 (false),
         * the unit is a pair of bytes,
         * which are literally copied to the decompressed data.
         * If the bit is 1 (true),
         * the unit is a reference into the lookup table,
         * an integer which is expanded to two bytes by looking it up in the table.
         */
        public function units() { return $this->_m_units; }
    }
}
