<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * Compressed resource data in `'dcmp' (1)` format,
 * as stored in compressed resources with header type `8` and decompressor ID `1`.
 * 
 * The `'dcmp' (1)` decompressor resource is included in the System file of System 7.0 and later.
 * This compression format is used for a few compressed resources in System 7.0's files
 * (such as the Finder Help file).
 * This decompressor is also included with and used by some other Apple applications,
 * such as ResEdit.
 * (Note: ResEdit includes the `'dcmp' (1)` resource,
 * but none of its resources actually use this decompressor.)
 * 
 * This compression format supports some basic general-purpose compression schemes,
 * including backreferences to previous data and run-length encoding.
 * It also includes some types of compression tailored specifically to Mac OS resources,
 * including a set of single-byte codes that correspond to entries in a hard-coded lookup table.
 * 
 * The `'dcmp' (0)` compression format (see dcmp_0.ksy) is very similar to this format,
 * with the main difference that it operates mostly on units of 2 or 4 bytes.
 * This makes the ``dcmp' (0)` format more suitable for word-aligned data,
 * such as executable code, bitmaps, sounds, etc.
 * The `'dcmp' (0)` format also appears to be generally preferred over `'dcmp' (1)`,
 * with the latter only being used in resource files that contain mostly unaligned data,
 * such as text.
 */

class Dcmp1 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dcmp1 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_chunks = [];
        $i = 0;
        do {
            $_ = new \Dcmp1\Chunk($this->_io, $this, $this->_root);
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

namespace \Dcmp1;

class Chunk extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp1 $_parent = null, \Dcmp1 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tag = $this->_io->readU1();
        switch (( (($this->tag() >= 0) && ($this->tag() <= 31))  ? \Dcmp1\Chunk\TagKind::LITERAL : ( (($this->tag() >= 32) && ($this->tag() <= 207))  ? \Dcmp1\Chunk\TagKind::BACKREFERENCE : ( (($this->tag() >= 208) && ($this->tag() <= 209))  ? \Dcmp1\Chunk\TagKind::LITERAL : ($this->tag() == 210 ? \Dcmp1\Chunk\TagKind::BACKREFERENCE : ( (($this->tag() >= 213) && ($this->tag() <= 253))  ? \Dcmp1\Chunk\TagKind::TABLE_LOOKUP : ($this->tag() == 254 ? \Dcmp1\Chunk\TagKind::EXTENDED : ($this->tag() == 255 ? \Dcmp1\Chunk\TagKind::END : \Dcmp1\Chunk\TagKind::INVALID)))))))) {
            case \Dcmp1\Chunk\TagKind::END:
                $this->_m_body = new \Dcmp1\Chunk\EndBody($this->_io, $this, $this->_root);
                break;
            case \Dcmp1\Chunk\TagKind::LITERAL:
                $this->_m_body = new \Dcmp1\Chunk\LiteralBody($this->tag(), $this->_io, $this, $this->_root);
                break;
            case \Dcmp1\Chunk\TagKind::BACKREFERENCE:
                $this->_m_body = new \Dcmp1\Chunk\BackreferenceBody($this->tag(), $this->_io, $this, $this->_root);
                break;
            case \Dcmp1\Chunk\TagKind::TABLE_LOOKUP:
                $this->_m_body = new \Dcmp1\Chunk\TableLookupBody($this->tag(), $this->_io, $this, $this->_root);
                break;
            case \Dcmp1\Chunk\TagKind::EXTENDED:
                $this->_m_body = new \Dcmp1\Chunk\ExtendedBody($this->_io, $this, $this->_root);
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
 */

namespace \Dcmp1\Chunk;

class LiteralBody extends \Kaitai\Struct\Struct {
    public function __construct(int $tag, \Kaitai\Struct\Stream $_io, \Dcmp1\Chunk $_parent = null, \Dcmp1 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_tag = $tag;
        $this->_read();
    }

    private function _read() {
        if ($this->isLenLiteralSeparate()) {
            $this->_m_lenLiteralSeparate = $this->_io->readU1();
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
        $this->_m_doStore = ($this->isLenLiteralSeparate() ? $this->tag() == 209 : ($this->tag() & 16) != 0);
        return $this->_m_doStore;
    }
    protected $_m_lenLiteralM1InTag;

    /**
     * The part of the tag byte that indicates the length of the literal data,
     * in bytes,
     * minus one.
     * 
     * If the tag byte is 0xd0 or 0xd1,
     * the length is stored in a separate byte after the tag byte and before the literal data.
     */
    public function lenLiteralM1InTag() {
        if ($this->_m_lenLiteralM1InTag !== null)
            return $this->_m_lenLiteralM1InTag;
        if (!($this->isLenLiteralSeparate())) {
            $this->_m_lenLiteralM1InTag = ($this->tag() & 15);
        }
        return $this->_m_lenLiteralM1InTag;
    }
    protected $_m_isLenLiteralSeparate;

    /**
     * Whether the length of the literal is stored separately from the tag.
     */
    public function isLenLiteralSeparate() {
        if ($this->_m_isLenLiteralSeparate !== null)
            return $this->_m_isLenLiteralSeparate;
        $this->_m_isLenLiteralSeparate = $this->tag() >= 208;
        return $this->_m_isLenLiteralSeparate;
    }
    protected $_m_lenLiteral;

    /**
     * The length of the literal data,
     * in bytes.
     * 
     * In practice,
     * this value is always greater than zero,
     * as there is no use in storing a zero-length literal.
     */
    public function lenLiteral() {
        if ($this->_m_lenLiteral !== null)
            return $this->_m_lenLiteral;
        $this->_m_lenLiteral = ($this->isLenLiteralSeparate() ? $this->lenLiteralSeparate() : ($this->lenLiteralM1InTag() + 1));
        return $this->_m_lenLiteral;
    }
    protected $_m_lenLiteralSeparate;
    protected $_m_literal;
    protected $_m_tag;

    /**
     * The length of the literal data,
     * in bytes.
     * 
     * This field is only present if the tag byte is 0xd0 or 0xd1.
     * In practice,
     * this only happens if the length is 0x11 or greater,
     * because smaller lengths can be encoded into the tag byte.
     */
    public function lenLiteralSeparate() { return $this->_m_lenLiteralSeparate; }

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

namespace \Dcmp1\Chunk;

class BackreferenceBody extends \Kaitai\Struct\Struct {
    public function __construct(int $tag, \Kaitai\Struct\Stream $_io, \Dcmp1\Chunk $_parent = null, \Dcmp1 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_tag = $tag;
        $this->_read();
    }

    private function _read() {
        if ($this->isIndexSeparate()) {
            $this->_m_indexSeparateMinus = $this->_io->readU1();
        }
    }
    protected $_m_isIndexSeparate;

    /**
     * Whether the index is stored separately from the tag.
     */
    public function isIndexSeparate() {
        if ($this->_m_isIndexSeparate !== null)
            return $this->_m_isIndexSeparate;
        $this->_m_isIndexSeparate = $this->tag() == 210;
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
        $this->_m_indexInTag = ($this->tag() - 32);
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
            $this->_m_indexSeparate = ($this->indexSeparateMinus() + 176);
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
     * The value in this field is stored minus 0xb0.
     * 
     * This field is only present if the tag byte is 0xd2.
     * For other tag bytes,
     * the index is encoded in the tag byte.
     * Values smaller than 0xb0 cannot be stored in this field,
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

namespace \Dcmp1\Chunk;

class TableLookupBody extends \Kaitai\Struct\Struct {
    public function __construct(int $tag, \Kaitai\Struct\Stream $_io, \Dcmp1\Chunk $_parent = null, \Dcmp1 $_root = null) {
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
     * index 0 stands for tag 0xd5, 1 for 0xd6, etc.
     */
    public function lookupTable() {
        if ($this->_m_lookupTable !== null)
            return $this->_m_lookupTable;
        $this->_m_lookupTable = ["\x00\x00", "\x00\x01", "\x00\x02", "\x00\x03", "\x2E\x01", "\x3E\x01", "\x01\x01", "\x1E\x01", "\xFF\xFF", "\x0E\x01", "\x31\x00", "\x11\x12", "\x01\x07", "\x33\x32", "\x12\x39", "\xED\x10", "\x01\x27", "\x23\x22", "\x01\x37", "\x07\x06", "\x01\x17", "\x01\x23", "\x00\xFF", "\x00\x2F", "\x07\x0E", "\xFD\x3C", "\x01\x35", "\x01\x15", "\x01\x02", "\x00\x07", "\x00\x3E", "\x05\xD5", "\x02\x01", "\x06\x07", "\x07\x08", "\x30\x01", "\x01\x33", "\x00\x10", "\x17\x16", "\x37\x3E", "\x36\x37"];
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
        $this->_m_value = $this->lookupTable()[($this->tag() - 213)];
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

namespace \Dcmp1\Chunk;

class EndBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp1\Chunk $_parent = null, \Dcmp1 $_root = null) {
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

namespace \Dcmp1\Chunk;

class ExtendedBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp1\Chunk $_parent = null, \Dcmp1 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tag = $this->_io->readU1();
        switch ($this->tag()) {
            case 2:
                $this->_m_body = new \Dcmp1\Chunk\ExtendedBody\RepeatBody($this->_io, $this, $this->_root);
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
 * The body of a repeat chunk.
 * 
 * This chunk expands to the same byte repeated a number of times,
 * i. e. it implements a form of run-length encoding.
 */

namespace \Dcmp1\Chunk\ExtendedBody;

class RepeatBody extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dcmp1\Chunk\ExtendedBody $_parent = null, \Dcmp1 $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_toRepeatRaw = new \DcmpVariableLengthInteger($this->_io);
        $this->_m_repeatCountM1Raw = new \DcmpVariableLengthInteger($this->_io);
    }
    protected $_m_toRepeat;

    /**
     * The value to repeat.
     * 
     * Although it is stored as a variable-length integer,
     * this value must fit into an unsigned 8-bit integer.
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

    /**
     * Raw variable-length integer representation of `to_repeat`.
     */
    public function toRepeatRaw() { return $this->_m_toRepeatRaw; }

    /**
     * Raw variable-length integer representation of `repeat_count_m1`.
     */
    public function repeatCountM1Raw() { return $this->_m_repeatCountM1Raw; }
}

namespace \Dcmp1\Chunk;

class TagKind {
    const INVALID = -1;
    const LITERAL = 0;
    const BACKREFERENCE = 1;
    const TABLE_LOOKUP = 2;
    const EXTENDED = 3;
    const END = 4;
}
