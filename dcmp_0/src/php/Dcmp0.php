<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Compressed resource data in `'dcmp' (0)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `0`.
 * 
 * The `'dcmp' (0)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for most compressed resources in System 7.0's files.
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data,
 * run-length encoding,
 * and delta encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table,
 * and a specialized kind of delta encoding for segment loader jump tables.
 * 
 * Almost all parts of this compression format operate on units of 2 or 4 bytes.
 * As a result,
 * it is nearly impossible to store data with an odd length in this format.
 * To work around this limitation,
 * odd-length resources are padded with an extra byte before compressing them with this format.
 * This extra byte is ignored after decompression,
 * as the real (odd) length of the resource is stored in the compressed resource header.
 * 
 * The `'dcmp' (1)` compression format (see dcmp_1.ksy) is very similar to this format,
 * with the main difference that it operates mostly on single bytes rather than two-byte units.
 */

class Dcmp0 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_chunks = [];
        $i = 0;
        do {
            $_ = new \Dcmp0\Chunk($this->_io, $this, $this->_root);
            $this->_m_chunks[] = $_;
            $i++;
        } while (!($_->tag() == 255));
    }
    protected $_m_chunks;

    /**
     * The sequence of chunks that make up the compressed data.
     */
    public function chunks() { return $this->_m_chunks; }
}

/**
 * A single chunk of compressed data.
 * Each chunk in the compressed data expands to a sequence of bytes in the uncompressed data,
 * except when `tag == 0xff`,
 * which marks the end of the data and does not correspond to any bytes in the uncompressed data.
 * 
 * Most chunks are stateless and always expand to the same data,
 * regardless of where the chunk appears in the sequence.
 * However,
 * some chunks affect the behavior of future chunks,
 * or expand to different data depending on which chunks came before them.
 */

namespace \Dcmp0;

class Chunk extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp0 $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tag = $this->_io->readU1();
        switch (( (($this->tag() >= 0) && ($this->tag() <= 31))  ? \Dcmp0\Chunk\TagKind::LITERAL : ( (($this->tag() >= 32) && ($this->tag() <= 74))  ? \Dcmp0\Chunk\TagKind::BACKREFERENCE : ( (($this->tag() >= 75) && ($this->tag() <= 253))  ? \Dcmp0\Chunk\TagKind::TABLE_LOOKUP : ($this->tag() == 254 ? \Dcmp0\Chunk\TagKind::EXTENDED : ($this->tag() == 255 ? \Dcmp0\Chunk\TagKind::END : \Dcmp0\Chunk\TagKind::INVALID)))))) {
            case \Dcmp0\Chunk\TagKind::END:
                $this->_m_body = new \Dcmp0\Chunk\EndBody($this->_io, $this, $this->_root);
                break;
            case \Dcmp0\Chunk\TagKind::LITERAL:
                $this->_m_body = new \Dcmp0\Chunk\LiteralBody($this->tag(), $this->_io, $this, $this->_root);
                break;
            case \Dcmp0\Chunk\TagKind::BACKREFERENCE:
                $this->_m_body = new \Dcmp0\Chunk\BackreferenceBody($this->tag(), $this->_io, $this, $this->_root);
                break;
            case \Dcmp0\Chunk\TagKind::TABLE_LOOKUP:
                $this->_m_body = new \Dcmp0\Chunk\TableLookupBody($this->tag(), $this->_io, $this, $this->_root);
                break;
            case \Dcmp0\Chunk\TagKind::EXTENDED:
                $this->_m_body = new \Dcmp0\Chunk\ExtendedBody($this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_tag;
    protected $_m_body;

    /**
     * The chunk's tag byte.
     * This controls the structure of the body and the meaning of the chunk.
     */
    public function tag() { return $this->_m_tag; }

    /**
     * The chunk's body.
     * 
     * Certain chunks do not have any data following the tag byte.
     * In this case,
     * the body is a zero-length structure.
     */
    public function body() { return $this->_m_body; }
}

/**
 * The body of a literal data chunk.
 * 
 * The data that this chunk expands to is stored literally in the body (`literal`).
 * Optionally,
 * the literal data may also be stored for use by future backreference chunks (`do_store`).
 * 
 * The length of the literal data is stored as a number of two-byte units.
 * This means that the literal data always has an even length in bytes.
 */

namespace \Dcmp0\Chunk;

class LiteralBody extends \Kaitai\Struct\Struct {
    public function __construct(int $tag, \Kaitai\Struct\Stream $_io, \Dcmp0\Chunk $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_tag = $tag;
        $this->_read();
    }

    private function _read() {
        if ($this->isLenLiteralDiv2Separate()) {
            $this->_m_lenLiteralDiv2Separate = $this->_io->readU1();
        }
        $this->_m_literal = $this->_io->readBytes($this->lenLiteral());
    }
    protected $_m_doStore;

    /**
     * Whether this literal should be stored for use by future backreference chunks.
     * 
     * See the documentation of the `backreference_body` type for details about backreference chunks.
     */
    public function doStore() {
        if ($this->_m_doStore !== null)
            return $this->_m_doStore;
        $this->_m_doStore = ($this->tag() & 16) != 0;
        return $this->_m_doStore;
    }
    protected $_m_lenLiteralDiv2;

    /**
     * The length of the literal data,
     * in two-byte units.
     * 
     * In practice,
     * this value is always greater than zero,
     * as there is no use in storing a zero-length literal.
     */
    public function lenLiteralDiv2() {
        if ($this->_m_lenLiteralDiv2 !== null)
            return $this->_m_lenLiteralDiv2;
        $this->_m_lenLiteralDiv2 = ($this->isLenLiteralDiv2Separate() ? $this->lenLiteralDiv2Separate() : $this->lenLiteralDiv2InTag());
        return $this->_m_lenLiteralDiv2;
    }
    protected $_m_lenLiteral;

    /**
     * The length of the literal data,
     * in bytes.
     */
    public function lenLiteral() {
        if ($this->_m_lenLiteral !== null)
            return $this->_m_lenLiteral;
        $this->_m_lenLiteral = ($this->lenLiteralDiv2() * 2);
        return $this->_m_lenLiteral;
    }
    protected $_m_lenLiteralDiv2InTag;

    /**
     * The part of the tag byte that indicates the length of the literal data,
     * in two-byte units.
     * If this value is 0,
     * the length is stored in a separate byte after the tag byte and before the literal data.
     */
    public function lenLiteralDiv2InTag() {
        if ($this->_m_lenLiteralDiv2InTag !== null)
            return $this->_m_lenLiteralDiv2InTag;
        $this->_m_lenLiteralDiv2InTag = ($this->tag() & 15);
        return $this->_m_lenLiteralDiv2InTag;
    }
    protected $_m_isLenLiteralDiv2Separate;

    /**
     * Whether the length of the literal is stored separately from the tag.
     */
    public function isLenLiteralDiv2Separate() {
        if ($this->_m_isLenLiteralDiv2Separate !== null)
            return $this->_m_isLenLiteralDiv2Separate;
        $this->_m_isLenLiteralDiv2Separate = $this->lenLiteralDiv2InTag() == 0;
        return $this->_m_isLenLiteralDiv2Separate;
    }
    protected $_m_lenLiteralDiv2Separate;
    protected $_m_literal;
    protected $_m_tag;

    /**
     * The length of the literal data,
     * in two-byte units.
     * 
     * This field is only present if the tag byte's low nibble is zero.
     * In practice,
     * this only happens if the length is 0x10 or greater,
     * because smaller lengths can be encoded into the tag byte.
     */
    public function lenLiteralDiv2Separate() { return $this->_m_lenLiteralDiv2Separate; }

    /**
     * The literal data.
     */
    public function literal() { return $this->_m_literal; }

    /**
     * The tag byte preceding this chunk body.
     */
    public function tag() { return $this->_m_tag; }
}

/**
 * The body of a backreference chunk.
 * 
 * This chunk expands to the data stored in a preceding literal chunk,
 * indicated by an index number (`index`).
 */

namespace \Dcmp0\Chunk;

class BackreferenceBody extends \Kaitai\Struct\Struct {
    public function __construct(int $tag, \Kaitai\Struct\Stream $_io, \Dcmp0\Chunk $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_tag = $tag;
        $this->_read();
    }

    private function _read() {
        if ($this->isIndexSeparate()) {
            switch ($this->tag()) {
                case 32:
                    $this->_m_indexSeparateMinus = $this->_io->readU1();
                    break;
                case 33:
                    $this->_m_indexSeparateMinus = $this->_io->readU1();
                    break;
                case 34:
                    $this->_m_indexSeparateMinus = $this->_io->readU2be();
                    break;
            }
        }
    }
    protected $_m_isIndexSeparate;

    /**
     * Whether the index is stored separately from the tag.
     */
    public function isIndexSeparate() {
        if ($this->_m_isIndexSeparate !== null)
            return $this->_m_isIndexSeparate;
        $this->_m_isIndexSeparate =  (($this->tag() >= 32) && ($this->tag() <= 34)) ;
        return $this->_m_isIndexSeparate;
    }
    protected $_m_indexInTag;

    /**
     * The index of the referenced literal chunk,
     * as stored in the tag byte.
     */
    public function indexInTag() {
        if ($this->_m_indexInTag !== null)
            return $this->_m_indexInTag;
        $this->_m_indexInTag = ($this->tag() - 35);
        return $this->_m_indexInTag;
    }
    protected $_m_indexSeparate;

    /**
     * The index of the referenced literal chunk,
     * as stored separately from the tag byte,
     * with the implicit offset corrected for.
     */
    public function indexSeparate() {
        if ($this->_m_indexSeparate !== null)
            return $this->_m_indexSeparate;
        if ($this->isIndexSeparate()) {
            $this->_m_indexSeparate = (($this->indexSeparateMinus() + 40) + ($this->tag() == 33 ? 256 : 0));
        }
        return $this->_m_indexSeparate;
    }
    protected $_m_index;

    /**
     * The index of the referenced literal chunk.
     * 
     * Stored literals are assigned index numbers in the order in which they appear in the compressed data,
     * starting at 0.
     * Non-stored literals are not counted in the numbering and cannot be referenced using backreferences.
     * Once an index is assigned to a stored literal,
     * it is never changed or unassigned for the entire length of the compressed data.
     * 
     * As the name indicates,
     * a backreference can only reference stored literal chunks found *before* the backreference,
     * not ones that come after it.
     */
    public function index() {
        if ($this->_m_index !== null)
            return $this->_m_index;
        $this->_m_index = ($this->isIndexSeparate() ? $this->indexSeparate() : $this->indexInTag());
        return $this->_m_index;
    }
    protected $_m_indexSeparateMinus;
    protected $_m_tag;

    /**
     * The index of the referenced literal chunk,
     * stored separately from the tag.
     * The value in this field is stored minus 0x28.
     * If the tag byte is 0x21,
     * the value is also stored minus 0x100,
     * *on top of* the regular offset
     * (i. e. minus 0x128 in total).
     * 
     * In other words,
     * for tag bytes 0x20 and 0x21,
     * the index is actually 9 bits large,
     * with the low 8 bits stored separately and the highest bit stored in the lowest bit of the tag byte.
     * 
     * This field is only present if the tag byte is 0x20 through 0x22.
     * For higher tag bytes,
     * the index is encoded in the tag byte.
     * Values smaller than 0x28 cannot be stored in this field,
     * they must always be encoded in the tag byte.
     */
    public function indexSeparateMinus() { return $this->_m_indexSeparateMinus; }

    /**
     * The tag byte preceding this chunk body.
     */
    public function tag() { return $this->_m_tag; }
}

/**
 * The body of a table lookup chunk.
 * This body is always empty.
 * 
 * This chunk always expands to two bytes (`value`),
 * determined from the tag byte using a fixed lookup table (`lookup_table`).
 * This lookup table is hardcoded in the decompressor and always the same for all compressed data.
 */

namespace \Dcmp0\Chunk;

class TableLookupBody extends \Kaitai\Struct\Struct {
    public function __construct(int $tag, \Kaitai\Struct\Stream $_io, \Dcmp0\Chunk $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_tag = $tag;
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_lookupTable;

    /**
     * Fixed lookup table that maps tag byte numbers to two bytes each.
     * 
     * The entries in the lookup table are offset -
     * index 0 stands for tag 0x4b, 1 for 0x4c, etc.
     */
    public function lookupTable() {
        if ($this->_m_lookupTable !== null)
            return $this->_m_lookupTable;
        $this->_m_lookupTable = ["\x00\x00", "\x4E\xBA", "\x00\x08", "\x4E\x75", "\x00\x0C", "\x4E\xAD", "\x20\x53", "\x2F\x0B", "\x61\x00", "\x00\x10", "\x70\x00", "\x2F\x00", "\x48\x6E", "\x20\x50", "\x20\x6E", "\x2F\x2E", "\xFF\xFC", "\x48\xE7", "\x3F\x3C", "\x00\x04", "\xFF\xF8", "\x2F\x0C", "\x20\x06", "\x4E\xED", "\x4E\x56", "\x20\x68", "\x4E\x5E", "\x00\x01", "\x58\x8F", "\x4F\xEF", "\x00\x02", "\x00\x18", "\x60\x00", "\xFF\xFF", "\x50\x8F", "\x4E\x90", "\x00\x06", "\x26\x6E", "\x00\x14", "\xFF\xF4", "\x4C\xEE", "\x00\x0A", "\x00\x0E", "\x41\xEE", "\x4C\xDF", "\x48\xC0", "\xFF\xF0", "\x2D\x40", "\x00\x12", "\x30\x2E", "\x70\x01", "\x2F\x28", "\x20\x54", "\x67\x00", "\x00\x20", "\x00\x1C", "\x20\x5F", "\x18\x00", "\x26\x6F", "\x48\x78", "\x00\x16", "\x41\xFA", "\x30\x3C", "\x28\x40", "\x72\x00", "\x28\x6E", "\x20\x0C", "\x66\x00", "\x20\x6B", "\x2F\x07", "\x55\x8F", "\x00\x28", "\xFF\xFE", "\xFF\xEC", "\x22\xD8", "\x20\x0B", "\x00\x0F", "\x59\x8F", "\x2F\x3C", "\xFF\x00", "\x01\x18", "\x81\xE1", "\x4A\x00", "\x4E\xB0", "\xFF\xE8", "\x48\xC7", "\x00\x03", "\x00\x22", "\x00\x07", "\x00\x1A", "\x67\x06", "\x67\x08", "\x4E\xF9", "\x00\x24", "\x20\x78", "\x08\x00", "\x66\x04", "\x00\x2A", "\x4E\xD0", "\x30\x28", "\x26\x5F", "\x67\x04", "\x00\x30", "\x43\xEE", "\x3F\x00", "\x20\x1F", "\x00\x1E", "\xFF\xF6", "\x20\x2E", "\x42\xA7", "\x20\x07", "\xFF\xFA", "\x60\x02", "\x3D\x40", "\x0C\x40", "\x66\x06", "\x00\x26", "\x2D\x48", "\x2F\x01", "\x70\xFF", "\x60\x04", "\x18\x80", "\x4A\x40", "\x00\x40", "\x00\x2C", "\x2F\x08", "\x00\x11", "\xFF\xE4", "\x21\x40", "\x26\x40", "\xFF\xF2", "\x42\x6E", "\x4E\xB9", "\x3D\x7C", "\x00\x38", "\x00\x0D", "\x60\x06", "\x42\x2E", "\x20\x3C", "\x67\x0C", "\x2D\x68", "\x66\x08", "\x4A\x2E", "\x4A\xAE", "\x00\x2E", "\x48\x40", "\x22\x5F", "\x22\x00", "\x67\x0A", "\x30\x07", "\x42\x67", "\x00\x32", "\x20\x28", "\x00\x09", "\x48\x7A", "\x02\x00", "\x2F\x2B", "\x00\x05", "\x22\x6E", "\x66\x02", "\xE5\x80", "\x67\x0E", "\x66\x0A", "\x00\x50", "\x3E\x00", "\x66\x0C", "\x2E\x00", "\xFF\xEE", "\x20\x6D", "\x20\x40", "\xFF\xE0", "\x53\x40", "\x60\x08", "\x04\x80", "\x00\x68", "\x0B\x7C", "\x44\x00", "\x41\xE8", "\x48\x41"];
        return $this->_m_lookupTable;
    }
    protected $_m_value;

    /**
     * The two bytes that the tag byte expands to,
     * based on the fixed lookup table.
     */
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = $this->lookupTable()[($this->tag() - 75)];
        return $this->_m_value;
    }
    protected $_m_tag;

    /**
     * The tag byte preceding this chunk body.
     */
    public function tag() { return $this->_m_tag; }
}

/**
 * The body of an end chunk.
 * This body is always empty.
 * 
 * The last chunk in the compressed data must always be an end chunk.
 * An end chunk cannot appear elsewhere in the compressed data.
 */

namespace \Dcmp0\Chunk;

class EndBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp0\Chunk $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
    }
}

/**
 * The body of an extended chunk.
 * The meaning of this chunk depends on the extended tag byte stored in the chunk data.
 */

namespace \Dcmp0\Chunk;

class ExtendedBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp0\Chunk $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tag = $this->_io->readU1();
        switch ($this->tag()) {
            case 0:
                $this->_m_body = new \Dcmp0\Chunk\ExtendedBody\JumpTableBody($this->_io, $this, $this->_root);
                break;
            case 4:
                $this->_m_body = new \Dcmp0\Chunk\ExtendedBody\DeltaEncoding16BitBody($this->_io, $this, $this->_root);
                break;
            case 6:
                $this->_m_body = new \Dcmp0\Chunk\ExtendedBody\DeltaEncoding32BitBody($this->_io, $this, $this->_root);
                break;
            case 3:
                $this->_m_body = new \Dcmp0\Chunk\ExtendedBody\RepeatBody($this->tag(), $this->_io, $this, $this->_root);
                break;
            case 2:
                $this->_m_body = new \Dcmp0\Chunk\ExtendedBody\RepeatBody($this->tag(), $this->_io, $this, $this->_root);
                break;
        }
    }
    protected $_m_tag;
    protected $_m_body;

    /**
     * The chunk's extended tag byte.
     * This controls the structure of the body and the meaning of the chunk.
     */
    public function tag() { return $this->_m_tag; }

    /**
     * The chunk's body.
     */
    public function body() { return $this->_m_body; }
}

/**
 * The body of a jump table chunk.
 * 
 * This chunk generates parts of a segment loader jump table,
 * in the format found in `'CODE' (0)` resources.
 * It expands to the following data,
 * with all non-constant numbers encoded as unsigned 16-bit big-endian integers:
 * 
 * * `0x3f 0x3c` (push following segment number onto stack)
 * * The segment number
 * * `0xa9 0xf0` (`_LoadSeg` trap)
 * * For each address:
 *   * The address
 *   * `0x3f 0x3c` (push following segment number onto stack)
 *   * The segment number
 *   * `0xa9 0xf0` (`_LoadSeg` trap)
 * 
 * Note that this generates one jump table entry without an address before it,
 * meaning that this address needs to be generated by the preceding chunk.
 * All following jump table entries are generated with the addresses encoded in this chunk.
 */

namespace \Dcmp0\Chunk\ExtendedBody;

class JumpTableBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp0\Chunk\ExtendedBody $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_segmentNumberRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_numAddressesRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_addressesRaw = [];
        $n = $this->numAddresses();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_addressesRaw[] = new \DcmpVariableLengthInteger($this->_io);
        }
    }
    protected $_m_segmentNumber;

    /**
     * The segment number for all of the generated jump table entries.
     * 
     * Although it is stored as a variable-length integer,
     * the segment number must be in the range `0x0 <= x <= 0xffff`,
     * i. e. an unsigned 16-bit integer.
     */
    public function segmentNumber() {
        if ($this->_m_segmentNumber !== null)
            return $this->_m_segmentNumber;
        $this->_m_segmentNumber = $this->segmentNumberRaw()->value();
        return $this->_m_segmentNumber;
    }
    protected $_m_numAddresses;

    /**
     * The number of addresses stored in this chunk.
     * 
     * This number must be greater than 0.
     */
    public function numAddresses() {
        if ($this->_m_numAddresses !== null)
            return $this->_m_numAddresses;
        $this->_m_numAddresses = $this->numAddressesRaw()->value();
        return $this->_m_numAddresses;
    }
    protected $_m_segmentNumberRaw;
    protected $_m_numAddressesRaw;
    protected $_m_addressesRaw;

    /**
     * Raw variable-length integer representation of `segment_number`.
     */
    public function segmentNumberRaw() { return $this->_m_segmentNumberRaw; }

    /**
     * Raw variable-length integer representation of `num_addresses`.
     */
    public function numAddressesRaw() { return $this->_m_numAddressesRaw; }

    /**
     * The addresses for each generated jump table entry,
     * stored as variable-length integers.
     * 
     * The first address is stored literally and must be in the range `0x0 <= x <= 0xffff`,
     * i. e. an unsigned 16-bit integer.
     * 
     * All following addresses are stored as deltas relative to the previous address.
     * Each of these deltas is stored plus 6;
     * this value needs to be subtracted before (or after) adding it to the previous address.
     * 
     * Each delta (after subtracting 6) should be positive,
     * and adding it to the previous address should not result in a value larger than `0xffff`,
     * i. e. there should be no 16-bit unsigned integer wraparound.
     * These conditions are always met in all known jump table chunks,
     * so it is not known how the original decompressor behaves otherwise.
     */
    public function addressesRaw() { return $this->_m_addressesRaw; }
}

/**
 * The body of a repeat chunk.
 * 
 * This chunk expands to a 1-byte or 2-byte value repeated a number of times,
 * i. e. it implements a form of run-length encoding.
 */

namespace \Dcmp0\Chunk\ExtendedBody;

class RepeatBody extends \Kaitai\Struct\Struct {
    public function __construct(int $tag, \Kaitai\Struct\Stream $_io, \Dcmp0\Chunk\ExtendedBody $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_tag = $tag;
        $this->_read();
    }

    private function _read() {
        $this->_m_toRepeatRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_repeatCountM1Raw = new \DcmpVariableLengthInteger($this->_io);
    }
    protected $_m_byteCount;

    /**
     * The length in bytes of the value to be repeated.
     * Regardless of the byte count,
     * the value to be repeated is stored as a variable-length integer.
     */
    public function byteCount() {
        if ($this->_m_byteCount !== null)
            return $this->_m_byteCount;
        $this->_m_byteCount = ($this->tag() == 2 ? 1 : ($this->tag() == 3 ? 2 : -1));
        return $this->_m_byteCount;
    }
    protected $_m_toRepeat;

    /**
     * The value to repeat.
     * 
     * Although it is stored as a variable-length integer,
     * this value must fit into an unsigned big-endian integer that is as long as `byte_count`,
     * i. e. either 8 or 16 bits.
     */
    public function toRepeat() {
        if ($this->_m_toRepeat !== null)
            return $this->_m_toRepeat;
        $this->_m_toRepeat = $this->toRepeatRaw()->value();
        return $this->_m_toRepeat;
    }
    protected $_m_repeatCountM1;

    /**
     * The number of times to repeat the value,
     * minus one.
     * 
     * This value must not be negative.
     */
    public function repeatCountM1() {
        if ($this->_m_repeatCountM1 !== null)
            return $this->_m_repeatCountM1;
        $this->_m_repeatCountM1 = $this->repeatCountM1Raw()->value();
        return $this->_m_repeatCountM1;
    }
    protected $_m_repeatCount;

    /**
     * The number of times to repeat the value.
     * 
     * This value must be positive.
     */
    public function repeatCount() {
        if ($this->_m_repeatCount !== null)
            return $this->_m_repeatCount;
        $this->_m_repeatCount = ($this->repeatCountM1() + 1);
        return $this->_m_repeatCount;
    }
    protected $_m_toRepeatRaw;
    protected $_m_repeatCountM1Raw;
    protected $_m_tag;

    /**
     * Raw variable-length integer representation of `to_repeat`.
     */
    public function toRepeatRaw() { return $this->_m_toRepeatRaw; }

    /**
     * Raw variable-length integer representation of `repeat_count_m1`.
     */
    public function repeatCountM1Raw() { return $this->_m_repeatCountM1Raw; }

    /**
     * The extended tag byte preceding this chunk body.
     */
    public function tag() { return $this->_m_tag; }
}

/**
 * The body of a 16-bit delta encoding chunk.
 * 
 * This chunk expands to a sequence of 16-bit big-endian integer values.
 * The first value is stored literally.
 * All following values are stored as deltas relative to the previous value.
 */

namespace \Dcmp0\Chunk\ExtendedBody;

class DeltaEncoding16BitBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp0\Chunk\ExtendedBody $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_firstValueRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_numDeltasRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_deltas = [];
        $n = $this->numDeltas();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_deltas[] = $this->_io->readS1();
        }
    }
    protected $_m_firstValue;

    /**
     * The first value in the sequence.
     * 
     * Although it is stored as a variable-length integer,
     * this value must be in the range `-0x8000 <= x <= 0x7fff`,
     * i. e. a signed 16-bit integer.
     */
    public function firstValue() {
        if ($this->_m_firstValue !== null)
            return $this->_m_firstValue;
        $this->_m_firstValue = $this->firstValueRaw()->value();
        return $this->_m_firstValue;
    }
    protected $_m_numDeltas;

    /**
     * The number of deltas stored in this chunk.
     * 
     * This number must not be negative.
     */
    public function numDeltas() {
        if ($this->_m_numDeltas !== null)
            return $this->_m_numDeltas;
        $this->_m_numDeltas = $this->numDeltasRaw()->value();
        return $this->_m_numDeltas;
    }
    protected $_m_firstValueRaw;
    protected $_m_numDeltasRaw;
    protected $_m_deltas;

    /**
     * Raw variable-length integer representation of `first_value`.
     */
    public function firstValueRaw() { return $this->_m_firstValueRaw; }

    /**
     * Raw variable-length integer representation of `num_deltas`.
     */
    public function numDeltasRaw() { return $this->_m_numDeltasRaw; }

    /**
     * The deltas for each value relative to the previous value.
     * 
     * Each of these deltas is a signed 8-bit value.
     * When adding the delta to the previous value,
     * 16-bit integer wraparound is performed if necessary,
     * so that the resulting value always fits into a 16-bit signed integer.
     */
    public function deltas() { return $this->_m_deltas; }
}

/**
 * The body of a 32-bit delta encoding chunk.
 * 
 * This chunk expands to a sequence of 32-bit big-endian integer values.
 * The first value is stored literally.
 * All following values are stored as deltas relative to the previous value.
 */

namespace \Dcmp0\Chunk\ExtendedBody;

class DeltaEncoding32BitBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp0\Chunk\ExtendedBody $_parent = null, \Dcmp0 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_firstValueRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_numDeltasRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_deltasRaw = [];
        $n = $this->numDeltas();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_deltasRaw[] = new \DcmpVariableLengthInteger($this->_io);
        }
    }
    protected $_m_firstValue;

    /**
     * The first value in the sequence.
     */
    public function firstValue() {
        if ($this->_m_firstValue !== null)
            return $this->_m_firstValue;
        $this->_m_firstValue = $this->firstValueRaw()->value();
        return $this->_m_firstValue;
    }
    protected $_m_numDeltas;

    /**
     * The number of deltas stored in this chunk.
     * 
     * This number must not be negative.
     */
    public function numDeltas() {
        if ($this->_m_numDeltas !== null)
            return $this->_m_numDeltas;
        $this->_m_numDeltas = $this->numDeltasRaw()->value();
        return $this->_m_numDeltas;
    }
    protected $_m_firstValueRaw;
    protected $_m_numDeltasRaw;
    protected $_m_deltasRaw;

    /**
     * Raw variable-length integer representation of `first_value`.
     */
    public function firstValueRaw() { return $this->_m_firstValueRaw; }

    /**
     * Raw variable-length integer representation of `num_deltas`.
     */
    public function numDeltasRaw() { return $this->_m_numDeltasRaw; }

    /**
     * The deltas for each value relative to the previous value,
     * stored as variable-length integers.
     * 
     * Each of these deltas is a signed value.
     * When adding the delta to the previous value,
     * 32-bit integer wraparound is performed if necessary,
     * so that the resulting value always fits into a 32-bit signed integer.
     */
    public function deltasRaw() { return $this->_m_deltasRaw; }
}

namespace \Dcmp0\Chunk;

class TagKind {
    const INVALID = -1;
    const LITERAL = 0;
    const BACKREFERENCE = 1;
    const TABLE_LOOKUP = 2;
    const EXTENDED = 3;
    const END = 4;
}
