<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Ttf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_offsetTable = new \Ttf\OffsetTable($this->_io, $this, $this->_root);
        $this->_m_directoryTable = [];
        $n = $this->offsetTable()->numTables();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_directoryTable[] = new \Ttf\DirTableEntry($this->_io, $this, $this->_root);
        }
    }
    protected $_m_offsetTable;
    protected $_m_directoryTable;
    public function offsetTable() { return $this->_m_offsetTable; }
    public function directoryTable() { return $this->_m_directoryTable; }
}

namespace \Ttf;

class Post extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_format = new \Ttf\Fixed($this->_io, $this, $this->_root);
        $this->_m_italicAngle = new \Ttf\Fixed($this->_io, $this, $this->_root);
        $this->_m_underlinePosition = $this->_io->readS2be();
        $this->_m_underlineThichness = $this->_io->readS2be();
        $this->_m_isFixedPitch = $this->_io->readU4be();
        $this->_m_minMemType42 = $this->_io->readU4be();
        $this->_m_maxMemType42 = $this->_io->readU4be();
        $this->_m_minMemType1 = $this->_io->readU4be();
        $this->_m_maxMemType1 = $this->_io->readU4be();
        if ( (($this->format()->major() == 2) && ($this->format()->minor() == 0)) ) {
            $this->_m_format20 = new \Ttf\Post\Format20($this->_io, $this, $this->_root);
        }
    }
    protected $_m_format;
    protected $_m_italicAngle;
    protected $_m_underlinePosition;
    protected $_m_underlineThichness;
    protected $_m_isFixedPitch;
    protected $_m_minMemType42;
    protected $_m_maxMemType42;
    protected $_m_minMemType1;
    protected $_m_maxMemType1;
    protected $_m_format20;
    public function format() { return $this->_m_format; }
    public function italicAngle() { return $this->_m_italicAngle; }
    public function underlinePosition() { return $this->_m_underlinePosition; }
    public function underlineThichness() { return $this->_m_underlineThichness; }
    public function isFixedPitch() { return $this->_m_isFixedPitch; }
    public function minMemType42() { return $this->_m_minMemType42; }
    public function maxMemType42() { return $this->_m_maxMemType42; }
    public function minMemType1() { return $this->_m_minMemType1; }
    public function maxMemType1() { return $this->_m_maxMemType1; }
    public function format20() { return $this->_m_format20; }
}

namespace \Ttf\Post;

class Format20 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Post $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numberOfGlyphs = $this->_io->readU2be();
        $this->_m_glyphNameIndex = [];
        $n = $this->numberOfGlyphs();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_glyphNameIndex[] = $this->_io->readU2be();
        }
        $this->_m_glyphNames = [];
        $i = 0;
        do {
            $_ = new \Ttf\Post\Format20\PascalString($this->_io, $this, $this->_root);
            $this->_m_glyphNames[] = $_;
            $i++;
        } while (!($_->length() == 0));
    }
    protected $_m_numberOfGlyphs;
    protected $_m_glyphNameIndex;
    protected $_m_glyphNames;
    public function numberOfGlyphs() { return $this->_m_numberOfGlyphs; }
    public function glyphNameIndex() { return $this->_m_glyphNameIndex; }
    public function glyphNames() { return $this->_m_glyphNames; }
}

namespace \Ttf\Post\Format20;

class PascalString extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Post\Format20 $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_length = $this->_io->readU1();
        if ($this->length() != 0) {
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->length()), "ascii");
        }
    }
    protected $_m_length;
    protected $_m_value;
    public function length() { return $this->_m_length; }
    public function value() { return $this->_m_value; }
}

namespace \Ttf;

class Name extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_formatSelector = $this->_io->readU2be();
        $this->_m_nameRecordCount = $this->_io->readU2be();
        $this->_m_stringStorageOffset = $this->_io->readU2be();
        $this->_m_nameRecords = [];
        $n = $this->nameRecordCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_nameRecords[] = new \Ttf\Name\NameRecord($this->_io, $this, $this->_root);
        }
    }
    protected $_m_formatSelector;
    protected $_m_nameRecordCount;
    protected $_m_stringStorageOffset;
    protected $_m_nameRecords;
    public function formatSelector() { return $this->_m_formatSelector; }
    public function nameRecordCount() { return $this->_m_nameRecordCount; }
    public function stringStorageOffset() { return $this->_m_stringStorageOffset; }
    public function nameRecords() { return $this->_m_nameRecords; }
}

namespace \Ttf\Name;

class NameRecord extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Name $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_platformId = $this->_io->readU2be();
        $this->_m_encodingId = $this->_io->readU2be();
        $this->_m_languageId = $this->_io->readU2be();
        $this->_m_nameId = $this->_io->readU2be();
        $this->_m_stringLength = $this->_io->readU2be();
        $this->_m_stringOffset = $this->_io->readU2be();
    }
    protected $_m_asciiValue;
    public function asciiValue() {
        if ($this->_m_asciiValue !== null)
            return $this->_m_asciiValue;
        $io = $this->_parent()->_io();
        $_pos = $io->pos();
        $io->seek(($this->_parent()->stringStorageOffset() + $this->stringOffset()));
        $this->_m_asciiValue = \Kaitai\Struct\Stream::bytesToStr($io->readBytes($this->stringLength()), "ascii");
        $io->seek($_pos);
        return $this->_m_asciiValue;
    }
    protected $_m_unicodeValue;
    public function unicodeValue() {
        if ($this->_m_unicodeValue !== null)
            return $this->_m_unicodeValue;
        $io = $this->_parent()->_io();
        $_pos = $io->pos();
        $io->seek(($this->_parent()->stringStorageOffset() + $this->stringOffset()));
        $this->_m_unicodeValue = \Kaitai\Struct\Stream::bytesToStr($io->readBytes($this->stringLength()), "utf-16be");
        $io->seek($_pos);
        return $this->_m_unicodeValue;
    }
    protected $_m_platformId;
    protected $_m_encodingId;
    protected $_m_languageId;
    protected $_m_nameId;
    protected $_m_stringLength;
    protected $_m_stringOffset;
    public function platformId() { return $this->_m_platformId; }
    public function encodingId() { return $this->_m_encodingId; }
    public function languageId() { return $this->_m_languageId; }
    public function nameId() { return $this->_m_nameId; }
    public function stringLength() { return $this->_m_stringLength; }
    public function stringOffset() { return $this->_m_stringOffset; }
}

namespace \Ttf;

class Head extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = new \Ttf\Fixed($this->_io, $this, $this->_root);
        $this->_m_fontRevision = new \Ttf\Fixed($this->_io, $this, $this->_root);
        $this->_m_checksumAdjustment = $this->_io->readU4be();
        $this->_m_magicNumber = $this->_io->ensureFixedContents("\x5F\x0F\x3C\xF5");
        $this->_m_flags = $this->_io->readU2be();
        $this->_m_unitsPerEm = $this->_io->readU2be();
        $this->_m_created = $this->_io->readU8be();
        $this->_m_modified = $this->_io->readU8be();
        $this->_m_xMin = $this->_io->readS2be();
        $this->_m_yMin = $this->_io->readS2be();
        $this->_m_xMax = $this->_io->readS2be();
        $this->_m_yMax = $this->_io->readS2be();
        $this->_m_macStyle = $this->_io->readU2be();
        $this->_m_lowestRecPpem = $this->_io->readU2be();
        $this->_m_fontDirectionHint = $this->_io->readS2be();
        $this->_m_indexToLocFormat = $this->_io->readS2be();
        $this->_m_glyphDataFormat = $this->_io->readS2be();
    }
    protected $_m_version;
    protected $_m_fontRevision;
    protected $_m_checksumAdjustment;
    protected $_m_magicNumber;
    protected $_m_flags;
    protected $_m_unitsPerEm;
    protected $_m_created;
    protected $_m_modified;
    protected $_m_xMin;
    protected $_m_yMin;
    protected $_m_xMax;
    protected $_m_yMax;
    protected $_m_macStyle;
    protected $_m_lowestRecPpem;
    protected $_m_fontDirectionHint;
    protected $_m_indexToLocFormat;
    protected $_m_glyphDataFormat;
    public function version() { return $this->_m_version; }
    public function fontRevision() { return $this->_m_fontRevision; }
    public function checksumAdjustment() { return $this->_m_checksumAdjustment; }
    public function magicNumber() { return $this->_m_magicNumber; }
    public function flags() { return $this->_m_flags; }
    public function unitsPerEm() { return $this->_m_unitsPerEm; }
    public function created() { return $this->_m_created; }
    public function modified() { return $this->_m_modified; }
    public function xMin() { return $this->_m_xMin; }
    public function yMin() { return $this->_m_yMin; }
    public function xMax() { return $this->_m_xMax; }
    public function yMax() { return $this->_m_yMax; }
    public function macStyle() { return $this->_m_macStyle; }
    public function lowestRecPpem() { return $this->_m_lowestRecPpem; }
    public function fontDirectionHint() { return $this->_m_fontDirectionHint; }
    public function indexToLocFormat() { return $this->_m_indexToLocFormat; }
    public function glyphDataFormat() { return $this->_m_glyphDataFormat; }
}

namespace \Ttf\Head;

class Flags {
    const BASELINE_AT_Y0 = 1;
    const LEFT_SIDEBEARING_AT_X0 = 2;
    const FLAG_DEPEND_ON_POINT_SIZE = 4;
    const FLAG_FORCE_PPEM = 8;
    const FLAG_MAY_ADVANCE_WIDTH = 16;
}

namespace \Ttf\Head;

class FontDirectionHint {
    const FULLY_MIXED_DIRECTIONAL_GLYPHS = 0;
    const ONLY_STRONGLY_LEFT_TO_RIGHT = 1;
    const STRONGLY_LEFT_TO_RIGHT_AND_NEUTRALS = 2;
}

namespace \Ttf;

class Prep extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_instructions = $this->_io->readBytesFull();
    }
    protected $_m_instructions;
    public function instructions() { return $this->_m_instructions; }
}

namespace \Ttf;

class Hhea extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = new \Ttf\Fixed($this->_io, $this, $this->_root);
        $this->_m_ascender = $this->_io->readS2be();
        $this->_m_descender = $this->_io->readS2be();
        $this->_m_lineGap = $this->_io->readS2be();
        $this->_m_advanceWidthMax = $this->_io->readU2be();
        $this->_m_minLeftSideBearing = $this->_io->readS2be();
        $this->_m_minRightSideBearing = $this->_io->readS2be();
        $this->_m_xMaxExtend = $this->_io->readS2be();
        $this->_m_caretSlopeRise = $this->_io->readS2be();
        $this->_m_caretSlopeRun = $this->_io->readS2be();
        $this->_m_reserved = $this->_io->ensureFixedContents("\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00");
        $this->_m_metricDataFormat = $this->_io->readS2be();
        $this->_m_numberOfHmetrics = $this->_io->readU2be();
    }
    protected $_m_version;
    protected $_m_ascender;
    protected $_m_descender;
    protected $_m_lineGap;
    protected $_m_advanceWidthMax;
    protected $_m_minLeftSideBearing;
    protected $_m_minRightSideBearing;
    protected $_m_xMaxExtend;
    protected $_m_caretSlopeRise;
    protected $_m_caretSlopeRun;
    protected $_m_reserved;
    protected $_m_metricDataFormat;
    protected $_m_numberOfHmetrics;
    public function version() { return $this->_m_version; }

    /**
     * Typographic ascent
     */
    public function ascender() { return $this->_m_ascender; }

    /**
     * Typographic descent
     */
    public function descender() { return $this->_m_descender; }

    /**
     * Typographic line gap. Negative LineGap values are treated as zero in Windows 3.1, System 6, and System 7.
     */
    public function lineGap() { return $this->_m_lineGap; }

    /**
     * Maximum advance width value in `hmtx` table.
     */
    public function advanceWidthMax() { return $this->_m_advanceWidthMax; }

    /**
     * Minimum left sidebearing value in `hmtx` table.
     */
    public function minLeftSideBearing() { return $this->_m_minLeftSideBearing; }

    /**
     * Minimum right sidebearing value; calculated as Min(aw - lsb - (xMax - xMin)).
     */
    public function minRightSideBearing() { return $this->_m_minRightSideBearing; }

    /**
     * Max(lsb + (xMax - xMin)).
     */
    public function xMaxExtend() { return $this->_m_xMaxExtend; }
    public function caretSlopeRise() { return $this->_m_caretSlopeRise; }
    public function caretSlopeRun() { return $this->_m_caretSlopeRun; }
    public function reserved() { return $this->_m_reserved; }
    public function metricDataFormat() { return $this->_m_metricDataFormat; }
    public function numberOfHmetrics() { return $this->_m_numberOfHmetrics; }
}

namespace \Ttf;

class Fpgm extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_instructions = $this->_io->readBytesFull();
    }
    protected $_m_instructions;
    public function instructions() { return $this->_m_instructions; }
}

namespace \Ttf;

class Kern extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU2be();
        $this->_m_subtableCount = $this->_io->readU2be();
        $this->_m_subtables = [];
        $n = $this->subtableCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_subtables[] = new \Ttf\Kern\Subtable($this->_io, $this, $this->_root);
        }
    }
    protected $_m_version;
    protected $_m_subtableCount;
    protected $_m_subtables;
    public function version() { return $this->_m_version; }
    public function subtableCount() { return $this->_m_subtableCount; }
    public function subtables() { return $this->_m_subtables; }
}

namespace \Ttf\Kern;

class Subtable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Kern $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU2be();
        $this->_m_length = $this->_io->readU2be();
        $this->_m_format = $this->_io->readU1();
        $this->_m_reserved = $this->_io->readBitsInt(4);
        $this->_m_isOverride = $this->_io->readBitsInt(1) != 0;
        $this->_m_isCrossStream = $this->_io->readBitsInt(1) != 0;
        $this->_m_isMinimum = $this->_io->readBitsInt(1) != 0;
        $this->_m_isHorizontal = $this->_io->readBitsInt(1) != 0;
        $this->_io->alignToByte();
        if ($this->format() == 0) {
            $this->_m_format0 = new \Ttf\Kern\Subtable\Format0($this->_io, $this, $this->_root);
        }
    }
    protected $_m_version;
    protected $_m_length;
    protected $_m_format;
    protected $_m_reserved;
    protected $_m_isOverride;
    protected $_m_isCrossStream;
    protected $_m_isMinimum;
    protected $_m_isHorizontal;
    protected $_m_format0;
    public function version() { return $this->_m_version; }
    public function length() { return $this->_m_length; }
    public function format() { return $this->_m_format; }
    public function reserved() { return $this->_m_reserved; }
    public function isOverride() { return $this->_m_isOverride; }
    public function isCrossStream() { return $this->_m_isCrossStream; }
    public function isMinimum() { return $this->_m_isMinimum; }
    public function isHorizontal() { return $this->_m_isHorizontal; }
    public function format0() { return $this->_m_format0; }
}

namespace \Ttf\Kern\Subtable;

class Format0 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Kern\Subtable $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_pairCount = $this->_io->readU2be();
        $this->_m_searchRange = $this->_io->readU2be();
        $this->_m_entrySelector = $this->_io->readU2be();
        $this->_m_rangeShift = $this->_io->readU2be();
        $this->_m_kerningPairs = [];
        $n = $this->pairCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_kerningPairs[] = new \Ttf\Kern\Subtable\Format0\KerningPair($this->_io, $this, $this->_root);
        }
    }
    protected $_m_pairCount;
    protected $_m_searchRange;
    protected $_m_entrySelector;
    protected $_m_rangeShift;
    protected $_m_kerningPairs;
    public function pairCount() { return $this->_m_pairCount; }
    public function searchRange() { return $this->_m_searchRange; }
    public function entrySelector() { return $this->_m_entrySelector; }
    public function rangeShift() { return $this->_m_rangeShift; }
    public function kerningPairs() { return $this->_m_kerningPairs; }
}

namespace \Ttf\Kern\Subtable\Format0;

class KerningPair extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Kern\Subtable\Format0 $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_left = $this->_io->readU2be();
        $this->_m_right = $this->_io->readU2be();
        $this->_m_value = $this->_io->readS2be();
    }
    protected $_m_left;
    protected $_m_right;
    protected $_m_value;
    public function left() { return $this->_m_left; }
    public function right() { return $this->_m_right; }
    public function value() { return $this->_m_value; }
}

namespace \Ttf;

class DirTableEntry extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tag = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ascii");
        $this->_m_checksum = $this->_io->readU4be();
        $this->_m_offset = $this->_io->readU4be();
        $this->_m_length = $this->_io->readU4be();
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->offset());
        switch ($this->tag()) {
            case "head":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Head($io, $this, $this->_root);
                break;
            case "cvt ":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Cvt($io, $this, $this->_root);
                break;
            case "prep":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Prep($io, $this, $this->_root);
                break;
            case "kern":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Kern($io, $this, $this->_root);
                break;
            case "hhea":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Hhea($io, $this, $this->_root);
                break;
            case "post":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Post($io, $this, $this->_root);
                break;
            case "OS/2":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Os2($io, $this, $this->_root);
                break;
            case "name":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Name($io, $this, $this->_root);
                break;
            case "maxp":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Maxp($io, $this, $this->_root);
                break;
            case "glyf":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Glyf($io, $this, $this->_root);
                break;
            case "fpgm":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Fpgm($io, $this, $this->_root);
                break;
            case "cmap":
                $this->_m__raw_value = $io->readBytes($this->length());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Cmap($io, $this, $this->_root);
                break;
            default:
                $this->_m_value = $io->readBytes($this->length());
                break;
        }
        $io->seek($_pos);
        return $this->_m_value;
    }
    protected $_m_tag;
    protected $_m_checksum;
    protected $_m_offset;
    protected $_m_length;
    protected $_m__raw_value;
    public function tag() { return $this->_m_tag; }
    public function checksum() { return $this->_m_checksum; }
    public function offset() { return $this->_m_offset; }
    public function length() { return $this->_m_length; }
    public function _raw_value() { return $this->_m__raw_value; }
}

/**
 * The OS/2 table consists of a set of metrics that are required by Windows and OS/2.
 */

namespace \Ttf;

class Os2 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_version = $this->_io->readU2be();
        $this->_m_xAvgCharWidth = $this->_io->readS2be();
        $this->_m_weightClass = $this->_io->readU2be();
        $this->_m_widthClass = $this->_io->readU2be();
        $this->_m_fsType = $this->_io->readS2be();
        $this->_m_ySubscriptXSize = $this->_io->readS2be();
        $this->_m_ySubscriptYSize = $this->_io->readS2be();
        $this->_m_ySubscriptXOffset = $this->_io->readS2be();
        $this->_m_ySubscriptYOffset = $this->_io->readS2be();
        $this->_m_ySuperscriptXSize = $this->_io->readS2be();
        $this->_m_ySuperscriptYSize = $this->_io->readS2be();
        $this->_m_ySuperscriptXOffset = $this->_io->readS2be();
        $this->_m_ySuperscriptYOffset = $this->_io->readS2be();
        $this->_m_yStrikeoutSize = $this->_io->readS2be();
        $this->_m_yStrikeoutPosition = $this->_io->readS2be();
        $this->_m_sFamilyClass = $this->_io->readS2be();
        $this->_m_panose = new \Ttf\Os2\Panose($this->_io, $this, $this->_root);
        $this->_m_unicodeRange = new \Ttf\Os2\UnicodeRange($this->_io, $this, $this->_root);
        $this->_m_achVendId = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ascii");
        $this->_m_selection = $this->_io->readU2be();
        $this->_m_firstCharIndex = $this->_io->readU2be();
        $this->_m_lastCharIndex = $this->_io->readU2be();
        $this->_m_typoAscender = $this->_io->readS2be();
        $this->_m_typoDescender = $this->_io->readS2be();
        $this->_m_typoLineGap = $this->_io->readS2be();
        $this->_m_winAscent = $this->_io->readU2be();
        $this->_m_winDescent = $this->_io->readU2be();
        $this->_m_codePageRange = new \Ttf\Os2\CodePageRange($this->_io, $this, $this->_root);
    }
    protected $_m_version;
    protected $_m_xAvgCharWidth;
    protected $_m_weightClass;
    protected $_m_widthClass;
    protected $_m_fsType;
    protected $_m_ySubscriptXSize;
    protected $_m_ySubscriptYSize;
    protected $_m_ySubscriptXOffset;
    protected $_m_ySubscriptYOffset;
    protected $_m_ySuperscriptXSize;
    protected $_m_ySuperscriptYSize;
    protected $_m_ySuperscriptXOffset;
    protected $_m_ySuperscriptYOffset;
    protected $_m_yStrikeoutSize;
    protected $_m_yStrikeoutPosition;
    protected $_m_sFamilyClass;
    protected $_m_panose;
    protected $_m_unicodeRange;
    protected $_m_achVendId;
    protected $_m_selection;
    protected $_m_firstCharIndex;
    protected $_m_lastCharIndex;
    protected $_m_typoAscender;
    protected $_m_typoDescender;
    protected $_m_typoLineGap;
    protected $_m_winAscent;
    protected $_m_winDescent;
    protected $_m_codePageRange;

    /**
     * The version number for this OS/2 table.
     */
    public function version() { return $this->_m_version; }

    /**
     * The Average Character Width parameter specifies the arithmetic average of the escapement (width) of all of the 26 lowercase letters a through z of the Latin alphabet and the space character. If any of the 26 lowercase letters are not present, this parameter should equal the weighted average of all glyphs in the font. For non-UGL (platform 3, encoding 0) fonts, use the unweighted average.
     */
    public function xAvgCharWidth() { return $this->_m_xAvgCharWidth; }

    /**
     * Indicates the visual weight (degree of blackness or thickness of strokes) of the characters in the font.
     */
    public function weightClass() { return $this->_m_weightClass; }

    /**
     * Indicates a relative change from the normal aspect ratio (width to height ratio) as specified by a font designer for the glyphs in a font.
     */
    public function widthClass() { return $this->_m_widthClass; }

    /**
     * Indicates font embedding licensing rights for the font. Embeddable fonts may be stored in a document. When a document with embedded fonts is opened on a system that does not have the font installed (the remote system), the embedded font may be loaded for temporary (and in some cases, permanent) use on that system by an embedding-aware application. Embedding licensing rights are granted by the vendor of the font.
     */
    public function fsType() { return $this->_m_fsType; }

    /**
     * The recommended horizontal size in font design units for subscripts for this font.
     */
    public function ySubscriptXSize() { return $this->_m_ySubscriptXSize; }

    /**
     * The recommended vertical size in font design units for subscripts for this font.
     */
    public function ySubscriptYSize() { return $this->_m_ySubscriptYSize; }

    /**
     * The recommended horizontal offset in font design untis for subscripts for this font.
     */
    public function ySubscriptXOffset() { return $this->_m_ySubscriptXOffset; }

    /**
     * The recommended vertical offset in font design units from the baseline for subscripts for this font.
     */
    public function ySubscriptYOffset() { return $this->_m_ySubscriptYOffset; }

    /**
     * The recommended horizontal size in font design units for superscripts for this font.
     */
    public function ySuperscriptXSize() { return $this->_m_ySuperscriptXSize; }

    /**
     * The recommended vertical size in font design units for superscripts for this font.
     */
    public function ySuperscriptYSize() { return $this->_m_ySuperscriptYSize; }

    /**
     * The recommended horizontal offset in font design units for superscripts for this font.
     */
    public function ySuperscriptXOffset() { return $this->_m_ySuperscriptXOffset; }

    /**
     * The recommended vertical offset in font design units from the baseline for superscripts for this font.
     */
    public function ySuperscriptYOffset() { return $this->_m_ySuperscriptYOffset; }

    /**
     * Width of the strikeout stroke in font design units.
     */
    public function yStrikeoutSize() { return $this->_m_yStrikeoutSize; }

    /**
     * The position of the strikeout stroke relative to the baseline in font design units.
     */
    public function yStrikeoutPosition() { return $this->_m_yStrikeoutPosition; }

    /**
     * This parameter is a classification of font-family design.
     */
    public function sFamilyClass() { return $this->_m_sFamilyClass; }
    public function panose() { return $this->_m_panose; }
    public function unicodeRange() { return $this->_m_unicodeRange; }

    /**
     * The four character identifier for the vendor of the given type face.
     */
    public function achVendId() { return $this->_m_achVendId; }

    /**
     * Contains information concerning the nature of the font patterns
     */
    public function selection() { return $this->_m_selection; }

    /**
     * The minimum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
     */
    public function firstCharIndex() { return $this->_m_firstCharIndex; }

    /**
     * The maximum Unicode index (character code) in this font, according to the cmap subtable for platform ID 3 and encoding ID 0 or 1.
     */
    public function lastCharIndex() { return $this->_m_lastCharIndex; }

    /**
     * The typographic ascender for this font.
     */
    public function typoAscender() { return $this->_m_typoAscender; }

    /**
     * The typographic descender for this font.
     */
    public function typoDescender() { return $this->_m_typoDescender; }

    /**
     * The typographic line gap for this font.
     */
    public function typoLineGap() { return $this->_m_typoLineGap; }

    /**
     * The ascender metric for Windows.
     */
    public function winAscent() { return $this->_m_winAscent; }

    /**
     * The descender metric for Windows.
     */
    public function winDescent() { return $this->_m_winDescent; }

    /**
     * This field is used to specify the code pages encompassed by the font file in the `cmap` subtable for platform 3, encoding ID 1 (Microsoft platform).
     */
    public function codePageRange() { return $this->_m_codePageRange; }
}

namespace \Ttf\Os2;

class Panose extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Os2 $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_familyType = $this->_io->readU1();
        $this->_m_serifStyle = $this->_io->readU1();
        $this->_m_weight = $this->_io->readU1();
        $this->_m_proportion = $this->_io->readU1();
        $this->_m_contrast = $this->_io->readU1();
        $this->_m_strokeVariation = $this->_io->readU1();
        $this->_m_armStyle = $this->_io->readU1();
        $this->_m_letterForm = $this->_io->readU1();
        $this->_m_midline = $this->_io->readU1();
        $this->_m_xHeight = $this->_io->readU1();
    }
    protected $_m_familyType;
    protected $_m_serifStyle;
    protected $_m_weight;
    protected $_m_proportion;
    protected $_m_contrast;
    protected $_m_strokeVariation;
    protected $_m_armStyle;
    protected $_m_letterForm;
    protected $_m_midline;
    protected $_m_xHeight;
    public function familyType() { return $this->_m_familyType; }
    public function serifStyle() { return $this->_m_serifStyle; }
    public function weight() { return $this->_m_weight; }
    public function proportion() { return $this->_m_proportion; }
    public function contrast() { return $this->_m_contrast; }
    public function strokeVariation() { return $this->_m_strokeVariation; }
    public function armStyle() { return $this->_m_armStyle; }
    public function letterForm() { return $this->_m_letterForm; }
    public function midline() { return $this->_m_midline; }
    public function xHeight() { return $this->_m_xHeight; }
}

namespace \Ttf\Os2\Panose;

class Weight {
    const ANY = 0;
    const NO_FIT = 1;
    const VERY_LIGHT = 2;
    const LIGHT = 3;
    const THIN = 4;
    const BOOK = 5;
    const MEDIUM = 6;
    const DEMI = 7;
    const BOLD = 8;
    const HEAVY = 9;
    const BLACK = 10;
    const NORD = 11;
}

namespace \Ttf\Os2\Panose;

class Proportion {
    const ANY = 0;
    const NO_FIT = 1;
    const OLD_STYLE = 2;
    const MODERN = 3;
    const EVEN_WIDTH = 4;
    const EXPANDED = 5;
    const CONDENSED = 6;
    const VERY_EXPANDED = 7;
    const VERY_CONDENSED = 8;
    const MONOSPACED = 9;
}

namespace \Ttf\Os2\Panose;

class FamilyKind {
    const ANY = 0;
    const NO_FIT = 1;
    const TEXT_AND_DISPLAY = 2;
    const SCRIPT = 3;
    const DECORATIVE = 4;
    const PICTORIAL = 5;
}

namespace \Ttf\Os2\Panose;

class LetterForm {
    const ANY = 0;
    const NO_FIT = 1;
    const NORMAL_CONTACT = 2;
    const NORMAL_WEIGHTED = 3;
    const NORMAL_BOXED = 4;
    const NORMAL_FLATTENED = 5;
    const NORMAL_ROUNDED = 6;
    const NORMAL_OFF_CENTER = 7;
    const NORMAL_SQUARE = 8;
    const OBLIQUE_CONTACT = 9;
    const OBLIQUE_WEIGHTED = 10;
    const OBLIQUE_BOXED = 11;
    const OBLIQUE_FLATTENED = 12;
    const OBLIQUE_ROUNDED = 13;
    const OBLIQUE_OFF_CENTER = 14;
    const OBLIQUE_SQUARE = 15;
}

namespace \Ttf\Os2\Panose;

class SerifStyle {
    const ANY = 0;
    const NO_FIT = 1;
    const COVE = 2;
    const OBTUSE_COVE = 3;
    const SQUARE_COVE = 4;
    const OBTUSE_SQUARE_COVE = 5;
    const SQUARE = 6;
    const THIN = 7;
    const BONE = 8;
    const EXAGGERATED = 9;
    const TRIANGLE = 10;
    const NORMAL_SANS = 11;
    const OBTUSE_SANS = 12;
    const PERP_SANS = 13;
    const FLARED = 14;
    const ROUNDED = 15;
}

namespace \Ttf\Os2\Panose;

class XHeight {
    const ANY = 0;
    const NO_FIT = 1;
    const CONSTANT_SMALL = 2;
    const CONSTANT_STANDARD = 3;
    const CONSTANT_LARGE = 4;
    const DUCKING_SMALL = 5;
    const DUCKING_STANDARD = 6;
    const DUCKING_LARGE = 7;
}

namespace \Ttf\Os2\Panose;

class ArmStyle {
    const ANY = 0;
    const NO_FIT = 1;
    const STRAIGHT_ARMS_HORIZONTAL = 2;
    const STRAIGHT_ARMS_WEDGE = 3;
    const STRAIGHT_ARMS_VERTICAL = 4;
    const STRAIGHT_ARMS_SINGLE_SERIF = 5;
    const STRAIGHT_ARMS_DOUBLE_SERIF = 6;
    const NON_STRAIGHT_ARMS_HORIZONTAL = 7;
    const NON_STRAIGHT_ARMS_WEDGE = 8;
    const NON_STRAIGHT_ARMS_VERTICAL = 9;
    const NON_STRAIGHT_ARMS_SINGLE_SERIF = 10;
    const NON_STRAIGHT_ARMS_DOUBLE_SERIF = 11;
}

namespace \Ttf\Os2\Panose;

class StrokeVariation {
    const ANY = 0;
    const NO_FIT = 1;
    const GRADUAL_DIAGONAL = 2;
    const GRADUAL_TRANSITIONAL = 3;
    const GRADUAL_VERTICAL = 4;
    const GRADUAL_HORIZONTAL = 5;
    const RAPID_VERTICAL = 6;
    const RAPID_HORIZONTAL = 7;
    const INSTANT_VERTICAL = 8;
}

namespace \Ttf\Os2\Panose;

class Contrast {
    const ANY = 0;
    const NO_FIT = 1;
    const NONE = 2;
    const VERY_LOW = 3;
    const LOW = 4;
    const MEDIUM_LOW = 5;
    const MEDIUM = 6;
    const MEDIUM_HIGH = 7;
    const HIGH = 8;
    const VERY_HIGH = 9;
}

namespace \Ttf\Os2\Panose;

class Midline {
    const ANY = 0;
    const NO_FIT = 1;
    const STANDARD_TRIMMED = 2;
    const STANDARD_POINTED = 3;
    const STANDARD_SERIFED = 4;
    const HIGH_TRIMMED = 5;
    const HIGH_POINTED = 6;
    const HIGH_SERIFED = 7;
    const CONSTANT_TRIMMED = 8;
    const CONSTANT_POINTED = 9;
    const CONSTANT_SERIFED = 10;
    const LOW_TRIMMED = 11;
    const LOW_POINTED = 12;
    const LOW_SERIFED = 13;
}

namespace \Ttf\Os2;

class UnicodeRange extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Os2 $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_basicLatin = $this->_io->readBitsInt(1) != 0;
        $this->_m_latin1Supplement = $this->_io->readBitsInt(1) != 0;
        $this->_m_latinExtendedA = $this->_io->readBitsInt(1) != 0;
        $this->_m_latinExtendedB = $this->_io->readBitsInt(1) != 0;
        $this->_m_ipaExtensions = $this->_io->readBitsInt(1) != 0;
        $this->_m_spacingModifierLetters = $this->_io->readBitsInt(1) != 0;
        $this->_m_combiningDiacriticalMarks = $this->_io->readBitsInt(1) != 0;
        $this->_m_basicGreek = $this->_io->readBitsInt(1) != 0;
        $this->_m_greekSymbolsAndCoptic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cyrillic = $this->_io->readBitsInt(1) != 0;
        $this->_m_armenian = $this->_io->readBitsInt(1) != 0;
        $this->_m_basicHebrew = $this->_io->readBitsInt(1) != 0;
        $this->_m_hebrewExtended = $this->_io->readBitsInt(1) != 0;
        $this->_m_basicArabic = $this->_io->readBitsInt(1) != 0;
        $this->_m_arabicExtended = $this->_io->readBitsInt(1) != 0;
        $this->_m_devanagari = $this->_io->readBitsInt(1) != 0;
        $this->_m_bengali = $this->_io->readBitsInt(1) != 0;
        $this->_m_gurmukhi = $this->_io->readBitsInt(1) != 0;
        $this->_m_gujarati = $this->_io->readBitsInt(1) != 0;
        $this->_m_oriya = $this->_io->readBitsInt(1) != 0;
        $this->_m_tamil = $this->_io->readBitsInt(1) != 0;
        $this->_m_telugu = $this->_io->readBitsInt(1) != 0;
        $this->_m_kannada = $this->_io->readBitsInt(1) != 0;
        $this->_m_malayalam = $this->_io->readBitsInt(1) != 0;
        $this->_m_thai = $this->_io->readBitsInt(1) != 0;
        $this->_m_lao = $this->_io->readBitsInt(1) != 0;
        $this->_m_basicGeorgian = $this->_io->readBitsInt(1) != 0;
        $this->_m_georgianExtended = $this->_io->readBitsInt(1) != 0;
        $this->_m_hangulJamo = $this->_io->readBitsInt(1) != 0;
        $this->_m_latinExtendedAdditional = $this->_io->readBitsInt(1) != 0;
        $this->_m_greekExtended = $this->_io->readBitsInt(1) != 0;
        $this->_m_generalPunctuation = $this->_io->readBitsInt(1) != 0;
        $this->_m_superscriptsAndSubscripts = $this->_io->readBitsInt(1) != 0;
        $this->_m_currencySymbols = $this->_io->readBitsInt(1) != 0;
        $this->_m_combiningDiacriticalMarksForSymbols = $this->_io->readBitsInt(1) != 0;
        $this->_m_letterlikeSymbols = $this->_io->readBitsInt(1) != 0;
        $this->_m_numberForms = $this->_io->readBitsInt(1) != 0;
        $this->_m_arrows = $this->_io->readBitsInt(1) != 0;
        $this->_m_mathematicalOperators = $this->_io->readBitsInt(1) != 0;
        $this->_m_miscellaneousTechnical = $this->_io->readBitsInt(1) != 0;
        $this->_m_controlPictures = $this->_io->readBitsInt(1) != 0;
        $this->_m_opticalCharacterRecognition = $this->_io->readBitsInt(1) != 0;
        $this->_m_enclosedAlphanumerics = $this->_io->readBitsInt(1) != 0;
        $this->_m_boxDrawing = $this->_io->readBitsInt(1) != 0;
        $this->_m_blockElements = $this->_io->readBitsInt(1) != 0;
        $this->_m_geometricShapes = $this->_io->readBitsInt(1) != 0;
        $this->_m_miscellaneousSymbols = $this->_io->readBitsInt(1) != 0;
        $this->_m_dingbats = $this->_io->readBitsInt(1) != 0;
        $this->_m_cjkSymbolsAndPunctuation = $this->_io->readBitsInt(1) != 0;
        $this->_m_hiragana = $this->_io->readBitsInt(1) != 0;
        $this->_m_katakana = $this->_io->readBitsInt(1) != 0;
        $this->_m_bopomofo = $this->_io->readBitsInt(1) != 0;
        $this->_m_hangulCompatibilityJamo = $this->_io->readBitsInt(1) != 0;
        $this->_m_cjkMiscellaneous = $this->_io->readBitsInt(1) != 0;
        $this->_m_enclosedCjkLettersAndMonths = $this->_io->readBitsInt(1) != 0;
        $this->_m_cjkCompatibility = $this->_io->readBitsInt(1) != 0;
        $this->_m_hangul = $this->_io->readBitsInt(1) != 0;
        $this->_m_reservedForUnicodeSubranges1 = $this->_io->readBitsInt(1) != 0;
        $this->_m_reservedForUnicodeSubranges2 = $this->_io->readBitsInt(1) != 0;
        $this->_m_cjkUnifiedIdeographs = $this->_io->readBitsInt(1) != 0;
        $this->_m_privateUseArea = $this->_io->readBitsInt(1) != 0;
        $this->_m_cjkCompatibilityIdeographs = $this->_io->readBitsInt(1) != 0;
        $this->_m_alphabeticPresentationForms = $this->_io->readBitsInt(1) != 0;
        $this->_m_arabicPresentationFormsA = $this->_io->readBitsInt(1) != 0;
        $this->_m_combiningHalfMarks = $this->_io->readBitsInt(1) != 0;
        $this->_m_cjkCompatibilityForms = $this->_io->readBitsInt(1) != 0;
        $this->_m_smallFormVariants = $this->_io->readBitsInt(1) != 0;
        $this->_m_arabicPresentationFormsB = $this->_io->readBitsInt(1) != 0;
        $this->_m_halfwidthAndFullwidthForms = $this->_io->readBitsInt(1) != 0;
        $this->_m_specials = $this->_io->readBitsInt(1) != 0;
        $this->_io->alignToByte();
        $this->_m_reserved = $this->_io->readBytes(7);
    }
    protected $_m_basicLatin;
    protected $_m_latin1Supplement;
    protected $_m_latinExtendedA;
    protected $_m_latinExtendedB;
    protected $_m_ipaExtensions;
    protected $_m_spacingModifierLetters;
    protected $_m_combiningDiacriticalMarks;
    protected $_m_basicGreek;
    protected $_m_greekSymbolsAndCoptic;
    protected $_m_cyrillic;
    protected $_m_armenian;
    protected $_m_basicHebrew;
    protected $_m_hebrewExtended;
    protected $_m_basicArabic;
    protected $_m_arabicExtended;
    protected $_m_devanagari;
    protected $_m_bengali;
    protected $_m_gurmukhi;
    protected $_m_gujarati;
    protected $_m_oriya;
    protected $_m_tamil;
    protected $_m_telugu;
    protected $_m_kannada;
    protected $_m_malayalam;
    protected $_m_thai;
    protected $_m_lao;
    protected $_m_basicGeorgian;
    protected $_m_georgianExtended;
    protected $_m_hangulJamo;
    protected $_m_latinExtendedAdditional;
    protected $_m_greekExtended;
    protected $_m_generalPunctuation;
    protected $_m_superscriptsAndSubscripts;
    protected $_m_currencySymbols;
    protected $_m_combiningDiacriticalMarksForSymbols;
    protected $_m_letterlikeSymbols;
    protected $_m_numberForms;
    protected $_m_arrows;
    protected $_m_mathematicalOperators;
    protected $_m_miscellaneousTechnical;
    protected $_m_controlPictures;
    protected $_m_opticalCharacterRecognition;
    protected $_m_enclosedAlphanumerics;
    protected $_m_boxDrawing;
    protected $_m_blockElements;
    protected $_m_geometricShapes;
    protected $_m_miscellaneousSymbols;
    protected $_m_dingbats;
    protected $_m_cjkSymbolsAndPunctuation;
    protected $_m_hiragana;
    protected $_m_katakana;
    protected $_m_bopomofo;
    protected $_m_hangulCompatibilityJamo;
    protected $_m_cjkMiscellaneous;
    protected $_m_enclosedCjkLettersAndMonths;
    protected $_m_cjkCompatibility;
    protected $_m_hangul;
    protected $_m_reservedForUnicodeSubranges1;
    protected $_m_reservedForUnicodeSubranges2;
    protected $_m_cjkUnifiedIdeographs;
    protected $_m_privateUseArea;
    protected $_m_cjkCompatibilityIdeographs;
    protected $_m_alphabeticPresentationForms;
    protected $_m_arabicPresentationFormsA;
    protected $_m_combiningHalfMarks;
    protected $_m_cjkCompatibilityForms;
    protected $_m_smallFormVariants;
    protected $_m_arabicPresentationFormsB;
    protected $_m_halfwidthAndFullwidthForms;
    protected $_m_specials;
    protected $_m_reserved;
    public function basicLatin() { return $this->_m_basicLatin; }
    public function latin1Supplement() { return $this->_m_latin1Supplement; }
    public function latinExtendedA() { return $this->_m_latinExtendedA; }
    public function latinExtendedB() { return $this->_m_latinExtendedB; }
    public function ipaExtensions() { return $this->_m_ipaExtensions; }
    public function spacingModifierLetters() { return $this->_m_spacingModifierLetters; }
    public function combiningDiacriticalMarks() { return $this->_m_combiningDiacriticalMarks; }
    public function basicGreek() { return $this->_m_basicGreek; }
    public function greekSymbolsAndCoptic() { return $this->_m_greekSymbolsAndCoptic; }
    public function cyrillic() { return $this->_m_cyrillic; }
    public function armenian() { return $this->_m_armenian; }
    public function basicHebrew() { return $this->_m_basicHebrew; }
    public function hebrewExtended() { return $this->_m_hebrewExtended; }
    public function basicArabic() { return $this->_m_basicArabic; }
    public function arabicExtended() { return $this->_m_arabicExtended; }
    public function devanagari() { return $this->_m_devanagari; }
    public function bengali() { return $this->_m_bengali; }
    public function gurmukhi() { return $this->_m_gurmukhi; }
    public function gujarati() { return $this->_m_gujarati; }
    public function oriya() { return $this->_m_oriya; }
    public function tamil() { return $this->_m_tamil; }
    public function telugu() { return $this->_m_telugu; }
    public function kannada() { return $this->_m_kannada; }
    public function malayalam() { return $this->_m_malayalam; }
    public function thai() { return $this->_m_thai; }
    public function lao() { return $this->_m_lao; }
    public function basicGeorgian() { return $this->_m_basicGeorgian; }
    public function georgianExtended() { return $this->_m_georgianExtended; }
    public function hangulJamo() { return $this->_m_hangulJamo; }
    public function latinExtendedAdditional() { return $this->_m_latinExtendedAdditional; }
    public function greekExtended() { return $this->_m_greekExtended; }
    public function generalPunctuation() { return $this->_m_generalPunctuation; }
    public function superscriptsAndSubscripts() { return $this->_m_superscriptsAndSubscripts; }
    public function currencySymbols() { return $this->_m_currencySymbols; }
    public function combiningDiacriticalMarksForSymbols() { return $this->_m_combiningDiacriticalMarksForSymbols; }
    public function letterlikeSymbols() { return $this->_m_letterlikeSymbols; }
    public function numberForms() { return $this->_m_numberForms; }
    public function arrows() { return $this->_m_arrows; }
    public function mathematicalOperators() { return $this->_m_mathematicalOperators; }
    public function miscellaneousTechnical() { return $this->_m_miscellaneousTechnical; }
    public function controlPictures() { return $this->_m_controlPictures; }
    public function opticalCharacterRecognition() { return $this->_m_opticalCharacterRecognition; }
    public function enclosedAlphanumerics() { return $this->_m_enclosedAlphanumerics; }
    public function boxDrawing() { return $this->_m_boxDrawing; }
    public function blockElements() { return $this->_m_blockElements; }
    public function geometricShapes() { return $this->_m_geometricShapes; }
    public function miscellaneousSymbols() { return $this->_m_miscellaneousSymbols; }
    public function dingbats() { return $this->_m_dingbats; }
    public function cjkSymbolsAndPunctuation() { return $this->_m_cjkSymbolsAndPunctuation; }
    public function hiragana() { return $this->_m_hiragana; }
    public function katakana() { return $this->_m_katakana; }
    public function bopomofo() { return $this->_m_bopomofo; }
    public function hangulCompatibilityJamo() { return $this->_m_hangulCompatibilityJamo; }
    public function cjkMiscellaneous() { return $this->_m_cjkMiscellaneous; }
    public function enclosedCjkLettersAndMonths() { return $this->_m_enclosedCjkLettersAndMonths; }
    public function cjkCompatibility() { return $this->_m_cjkCompatibility; }
    public function hangul() { return $this->_m_hangul; }
    public function reservedForUnicodeSubranges1() { return $this->_m_reservedForUnicodeSubranges1; }
    public function reservedForUnicodeSubranges2() { return $this->_m_reservedForUnicodeSubranges2; }
    public function cjkUnifiedIdeographs() { return $this->_m_cjkUnifiedIdeographs; }
    public function privateUseArea() { return $this->_m_privateUseArea; }
    public function cjkCompatibilityIdeographs() { return $this->_m_cjkCompatibilityIdeographs; }
    public function alphabeticPresentationForms() { return $this->_m_alphabeticPresentationForms; }
    public function arabicPresentationFormsA() { return $this->_m_arabicPresentationFormsA; }
    public function combiningHalfMarks() { return $this->_m_combiningHalfMarks; }
    public function cjkCompatibilityForms() { return $this->_m_cjkCompatibilityForms; }
    public function smallFormVariants() { return $this->_m_smallFormVariants; }
    public function arabicPresentationFormsB() { return $this->_m_arabicPresentationFormsB; }
    public function halfwidthAndFullwidthForms() { return $this->_m_halfwidthAndFullwidthForms; }
    public function specials() { return $this->_m_specials; }
    public function reserved() { return $this->_m_reserved; }
}

namespace \Ttf\Os2;

class CodePageRange extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Os2 $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_symbolCharacterSet = $this->_io->readBitsInt(1) != 0;
        $this->_m_oemCharacterSet = $this->_io->readBitsInt(1) != 0;
        $this->_m_macintoshCharacterSet = $this->_io->readBitsInt(1) != 0;
        $this->_m_reservedForAlternateAnsiOem = $this->_io->readBitsInt(7);
        $this->_m_cp1361KoreanJohab = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp950ChineseTraditionalCharsTaiwanAndHongKong = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp949KoreanWansung = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp936ChineseSimplifiedCharsPrcAndSingapore = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp932JisJapan = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp874Thai = $this->_io->readBitsInt(1) != 0;
        $this->_m_reservedForAlternateAnsi = $this->_io->readBitsInt(8);
        $this->_m_cp1257WindowsBaltic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp1256Arabic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp1255Hebrew = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp1254Turkish = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp1253Greek = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp1251Cyrillic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp1250Latin2EasternEurope = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp1252Latin1 = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp437Us = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp850WeLatin1 = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp708ArabicAsmo708 = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp737GreekFormer437G = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp775MsDosBaltic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp852Latin2 = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp855IbmCyrillicPrimarilyRussian = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp857IbmTurkish = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp860MsDosPortuguese = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp861MsDosIcelandic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp862Hebrew = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp863MsDosCanadianFrench = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp864Arabic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp865MsDosNordic = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp866MsDosRussian = $this->_io->readBitsInt(1) != 0;
        $this->_m_cp869IbmGreek = $this->_io->readBitsInt(1) != 0;
        $this->_m_reservedForOem = $this->_io->readBitsInt(16);
    }
    protected $_m_symbolCharacterSet;
    protected $_m_oemCharacterSet;
    protected $_m_macintoshCharacterSet;
    protected $_m_reservedForAlternateAnsiOem;
    protected $_m_cp1361KoreanJohab;
    protected $_m_cp950ChineseTraditionalCharsTaiwanAndHongKong;
    protected $_m_cp949KoreanWansung;
    protected $_m_cp936ChineseSimplifiedCharsPrcAndSingapore;
    protected $_m_cp932JisJapan;
    protected $_m_cp874Thai;
    protected $_m_reservedForAlternateAnsi;
    protected $_m_cp1257WindowsBaltic;
    protected $_m_cp1256Arabic;
    protected $_m_cp1255Hebrew;
    protected $_m_cp1254Turkish;
    protected $_m_cp1253Greek;
    protected $_m_cp1251Cyrillic;
    protected $_m_cp1250Latin2EasternEurope;
    protected $_m_cp1252Latin1;
    protected $_m_cp437Us;
    protected $_m_cp850WeLatin1;
    protected $_m_cp708ArabicAsmo708;
    protected $_m_cp737GreekFormer437G;
    protected $_m_cp775MsDosBaltic;
    protected $_m_cp852Latin2;
    protected $_m_cp855IbmCyrillicPrimarilyRussian;
    protected $_m_cp857IbmTurkish;
    protected $_m_cp860MsDosPortuguese;
    protected $_m_cp861MsDosIcelandic;
    protected $_m_cp862Hebrew;
    protected $_m_cp863MsDosCanadianFrench;
    protected $_m_cp864Arabic;
    protected $_m_cp865MsDosNordic;
    protected $_m_cp866MsDosRussian;
    protected $_m_cp869IbmGreek;
    protected $_m_reservedForOem;
    public function symbolCharacterSet() { return $this->_m_symbolCharacterSet; }
    public function oemCharacterSet() { return $this->_m_oemCharacterSet; }
    public function macintoshCharacterSet() { return $this->_m_macintoshCharacterSet; }
    public function reservedForAlternateAnsiOem() { return $this->_m_reservedForAlternateAnsiOem; }
    public function cp1361KoreanJohab() { return $this->_m_cp1361KoreanJohab; }
    public function cp950ChineseTraditionalCharsTaiwanAndHongKong() { return $this->_m_cp950ChineseTraditionalCharsTaiwanAndHongKong; }
    public function cp949KoreanWansung() { return $this->_m_cp949KoreanWansung; }
    public function cp936ChineseSimplifiedCharsPrcAndSingapore() { return $this->_m_cp936ChineseSimplifiedCharsPrcAndSingapore; }
    public function cp932JisJapan() { return $this->_m_cp932JisJapan; }
    public function cp874Thai() { return $this->_m_cp874Thai; }
    public function reservedForAlternateAnsi() { return $this->_m_reservedForAlternateAnsi; }
    public function cp1257WindowsBaltic() { return $this->_m_cp1257WindowsBaltic; }
    public function cp1256Arabic() { return $this->_m_cp1256Arabic; }
    public function cp1255Hebrew() { return $this->_m_cp1255Hebrew; }
    public function cp1254Turkish() { return $this->_m_cp1254Turkish; }
    public function cp1253Greek() { return $this->_m_cp1253Greek; }
    public function cp1251Cyrillic() { return $this->_m_cp1251Cyrillic; }
    public function cp1250Latin2EasternEurope() { return $this->_m_cp1250Latin2EasternEurope; }
    public function cp1252Latin1() { return $this->_m_cp1252Latin1; }
    public function cp437Us() { return $this->_m_cp437Us; }
    public function cp850WeLatin1() { return $this->_m_cp850WeLatin1; }
    public function cp708ArabicAsmo708() { return $this->_m_cp708ArabicAsmo708; }
    public function cp737GreekFormer437G() { return $this->_m_cp737GreekFormer437G; }
    public function cp775MsDosBaltic() { return $this->_m_cp775MsDosBaltic; }
    public function cp852Latin2() { return $this->_m_cp852Latin2; }
    public function cp855IbmCyrillicPrimarilyRussian() { return $this->_m_cp855IbmCyrillicPrimarilyRussian; }
    public function cp857IbmTurkish() { return $this->_m_cp857IbmTurkish; }
    public function cp860MsDosPortuguese() { return $this->_m_cp860MsDosPortuguese; }
    public function cp861MsDosIcelandic() { return $this->_m_cp861MsDosIcelandic; }
    public function cp862Hebrew() { return $this->_m_cp862Hebrew; }
    public function cp863MsDosCanadianFrench() { return $this->_m_cp863MsDosCanadianFrench; }
    public function cp864Arabic() { return $this->_m_cp864Arabic; }
    public function cp865MsDosNordic() { return $this->_m_cp865MsDosNordic; }
    public function cp866MsDosRussian() { return $this->_m_cp866MsDosRussian; }
    public function cp869IbmGreek() { return $this->_m_cp869IbmGreek; }
    public function reservedForOem() { return $this->_m_reservedForOem; }
}

namespace \Ttf\Os2;

class WeightClass {
    const THIN = 100;
    const EXTRA_LIGHT = 200;
    const LIGHT = 300;
    const NORMAL = 400;
    const MEDIUM = 500;
    const SEMI_BOLD = 600;
    const BOLD = 700;
    const EXTRA_BOLD = 800;
    const BLACK = 900;
}

namespace \Ttf\Os2;

class WidthClass {
    const ULTRA_CONDENSED = 1;
    const EXTRA_CONDENSED = 2;
    const CONDENSED = 3;
    const SEMI_CONDENSED = 4;
    const NORMAL = 5;
    const SEMI_EXPANDED = 6;
    const EXPANDED = 7;
    const EXTRA_EXPANDED = 8;
    const ULTRA_EXPANDED = 9;
}

namespace \Ttf\Os2;

class FsType {
    const RESTRICTED_LICENSE_EMBEDDING = 2;
    const PREVIEW_AND_PRINT_EMBEDDING = 4;
    const EDITABLE_EMBEDDING = 8;
}

namespace \Ttf\Os2;

class FsSelection {
    const ITALIC = 1;
    const UNDERSCORE = 2;
    const NEGATIVE = 4;
    const OUTLINED = 8;
    const STRIKEOUT = 16;
    const BOLD = 32;
    const REGULAR = 64;
}

namespace \Ttf;

class Fixed extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_major = $this->_io->readU2be();
        $this->_m_minor = $this->_io->readU2be();
    }
    protected $_m_major;
    protected $_m_minor;
    public function major() { return $this->_m_major; }
    public function minor() { return $this->_m_minor; }
}

namespace \Ttf;

class Glyf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_numberOfContours = $this->_io->readS2be();
        $this->_m_xMin = $this->_io->readS2be();
        $this->_m_yMin = $this->_io->readS2be();
        $this->_m_xMax = $this->_io->readS2be();
        $this->_m_yMax = $this->_io->readS2be();
        if ($this->numberOfContours() > 0) {
            $this->_m_value = new \Ttf\Glyf\SimpleGlyph($this->_io, $this, $this->_root);
        }
    }
    protected $_m_numberOfContours;
    protected $_m_xMin;
    protected $_m_yMin;
    protected $_m_xMax;
    protected $_m_yMax;
    protected $_m_value;
    public function numberOfContours() { return $this->_m_numberOfContours; }
    public function xMin() { return $this->_m_xMin; }
    public function yMin() { return $this->_m_yMin; }
    public function xMax() { return $this->_m_xMax; }
    public function yMax() { return $this->_m_yMax; }
    public function value() { return $this->_m_value; }
}

namespace \Ttf\Glyf;

class SimpleGlyph extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Glyf $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_endPtsOfContours = [];
        $n = $this->_parent()->numberOfContours();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_endPtsOfContours[] = $this->_io->readU2be();
        }
        $this->_m_instructionLength = $this->_io->readU2be();
        $this->_m_instructions = $this->_io->readBytes($this->instructionLength());
        $this->_m_flags = [];
        $n = $this->pointCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_flags[] = new \Ttf\Glyf\SimpleGlyph\Flag($this->_io, $this, $this->_root);
        }
    }
    protected $_m_pointCount;
    public function pointCount() {
        if ($this->_m_pointCount !== null)
            return $this->_m_pointCount;
        $this->_m_pointCount = (max($this->endPtsOfContours()) + 1);
        return $this->_m_pointCount;
    }
    protected $_m_endPtsOfContours;
    protected $_m_instructionLength;
    protected $_m_instructions;
    protected $_m_flags;
    public function endPtsOfContours() { return $this->_m_endPtsOfContours; }
    public function instructionLength() { return $this->_m_instructionLength; }
    public function instructions() { return $this->_m_instructions; }
    public function flags() { return $this->_m_flags; }
}

namespace \Ttf\Glyf\SimpleGlyph;

class Flag extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Glyf\SimpleGlyph $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_reserved = $this->_io->readBitsInt(2);
        $this->_m_yIsSame = $this->_io->readBitsInt(1) != 0;
        $this->_m_xIsSame = $this->_io->readBitsInt(1) != 0;
        $this->_m_repeat = $this->_io->readBitsInt(1) != 0;
        $this->_m_yShortVector = $this->_io->readBitsInt(1) != 0;
        $this->_m_xShortVector = $this->_io->readBitsInt(1) != 0;
        $this->_m_onCurve = $this->_io->readBitsInt(1) != 0;
        $this->_io->alignToByte();
        if ($this->repeat()) {
            $this->_m_repeatValue = $this->_io->readU1();
        }
    }
    protected $_m_reserved;
    protected $_m_yIsSame;
    protected $_m_xIsSame;
    protected $_m_repeat;
    protected $_m_yShortVector;
    protected $_m_xShortVector;
    protected $_m_onCurve;
    protected $_m_repeatValue;
    public function reserved() { return $this->_m_reserved; }
    public function yIsSame() { return $this->_m_yIsSame; }
    public function xIsSame() { return $this->_m_xIsSame; }
    public function repeat() { return $this->_m_repeat; }
    public function yShortVector() { return $this->_m_yShortVector; }
    public function xShortVector() { return $this->_m_xShortVector; }
    public function onCurve() { return $this->_m_onCurve; }
    public function repeatValue() { return $this->_m_repeatValue; }
}

/**
 * cvt  - Control Value Table This table contains a list of values that can be referenced by instructions. They can be used, among other things, to control characteristics for different glyphs.
 */

namespace \Ttf;

class Cvt extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fwords = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_fwords[] = $this->_io->readS2be();
            $i++;
        }
    }
    protected $_m_fwords;
    public function fwords() { return $this->_m_fwords; }
}

namespace \Ttf;

class Maxp extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_tableVersionNumber = new \Ttf\Fixed($this->_io, $this, $this->_root);
        $this->_m_numGlyphs = $this->_io->readU2be();
        $this->_m_maxPoints = $this->_io->readU2be();
        $this->_m_maxContours = $this->_io->readU2be();
        $this->_m_maxCompositePoints = $this->_io->readU2be();
        $this->_m_maxCompositeContours = $this->_io->readU2be();
        $this->_m_maxZones = $this->_io->readU2be();
        $this->_m_maxTwilightPoints = $this->_io->readU2be();
        $this->_m_maxStorage = $this->_io->readU2be();
        $this->_m_maxFunctionDefs = $this->_io->readU2be();
        $this->_m_maxInstructionDefs = $this->_io->readU2be();
        $this->_m_maxStackElements = $this->_io->readU2be();
        $this->_m_maxSizeOfInstructions = $this->_io->readU2be();
        $this->_m_maxComponentElements = $this->_io->readU2be();
        $this->_m_maxComponentDepth = $this->_io->readU2be();
    }
    protected $_m_tableVersionNumber;
    protected $_m_numGlyphs;
    protected $_m_maxPoints;
    protected $_m_maxContours;
    protected $_m_maxCompositePoints;
    protected $_m_maxCompositeContours;
    protected $_m_maxZones;
    protected $_m_maxTwilightPoints;
    protected $_m_maxStorage;
    protected $_m_maxFunctionDefs;
    protected $_m_maxInstructionDefs;
    protected $_m_maxStackElements;
    protected $_m_maxSizeOfInstructions;
    protected $_m_maxComponentElements;
    protected $_m_maxComponentDepth;

    /**
     * 0x00010000 for version 1.0.
     */
    public function tableVersionNumber() { return $this->_m_tableVersionNumber; }

    /**
     * The number of glyphs in the font.
     */
    public function numGlyphs() { return $this->_m_numGlyphs; }

    /**
     * Maximum points in a non-composite glyph.
     */
    public function maxPoints() { return $this->_m_maxPoints; }

    /**
     * Maximum contours in a non-composite glyph.
     */
    public function maxContours() { return $this->_m_maxContours; }

    /**
     * Maximum points in a composite glyph.
     */
    public function maxCompositePoints() { return $this->_m_maxCompositePoints; }

    /**
     * Maximum contours in a composite glyph.
     */
    public function maxCompositeContours() { return $this->_m_maxCompositeContours; }

    /**
     * 1 if instructions do not use the twilight zone (Z0), or 2 if instructions do use Z0; should be set to 2 in most cases.
     */
    public function maxZones() { return $this->_m_maxZones; }

    /**
     * Maximum points used in Z0.
     */
    public function maxTwilightPoints() { return $this->_m_maxTwilightPoints; }

    /**
     * Number of Storage Area locations.
     */
    public function maxStorage() { return $this->_m_maxStorage; }

    /**
     * Number of FDEFs.
     */
    public function maxFunctionDefs() { return $this->_m_maxFunctionDefs; }

    /**
     * Number of IDEFs.
     */
    public function maxInstructionDefs() { return $this->_m_maxInstructionDefs; }

    /**
     * Maximum stack depth.
     */
    public function maxStackElements() { return $this->_m_maxStackElements; }

    /**
     * Maximum byte count for glyph instructions.
     */
    public function maxSizeOfInstructions() { return $this->_m_maxSizeOfInstructions; }

    /**
     * Maximum number of components referenced at "top level" for any composite glyph.
     */
    public function maxComponentElements() { return $this->_m_maxComponentElements; }

    /**
     * Maximum levels of recursion; 1 for simple components.
     */
    public function maxComponentDepth() { return $this->_m_maxComponentDepth; }
}

namespace \Ttf;

class OffsetTable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_sfntVersion = new \Ttf\Fixed($this->_io, $this, $this->_root);
        $this->_m_numTables = $this->_io->readU2be();
        $this->_m_searchRange = $this->_io->readU2be();
        $this->_m_entrySelector = $this->_io->readU2be();
        $this->_m_rangeShift = $this->_io->readU2be();
    }
    protected $_m_sfntVersion;
    protected $_m_numTables;
    protected $_m_searchRange;
    protected $_m_entrySelector;
    protected $_m_rangeShift;
    public function sfntVersion() { return $this->_m_sfntVersion; }
    public function numTables() { return $this->_m_numTables; }
    public function searchRange() { return $this->_m_searchRange; }
    public function entrySelector() { return $this->_m_entrySelector; }
    public function rangeShift() { return $this->_m_rangeShift; }
}

/**
 * cmap - Character To Glyph Index Mapping Table This table defines the mapping of character codes to the glyph index values used in the font.
 */

namespace \Ttf;

class Cmap extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\DirTableEntry $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_versionNumber = $this->_io->readU2be();
        $this->_m_numberOfEncodingTables = $this->_io->readU2be();
        $this->_m_tables = [];
        $n = $this->numberOfEncodingTables();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_tables[] = new \Ttf\Cmap\SubtableHeader($this->_io, $this, $this->_root);
        }
    }
    protected $_m_versionNumber;
    protected $_m_numberOfEncodingTables;
    protected $_m_tables;
    public function versionNumber() { return $this->_m_versionNumber; }
    public function numberOfEncodingTables() { return $this->_m_numberOfEncodingTables; }
    public function tables() { return $this->_m_tables; }
}

namespace \Ttf\Cmap;

class SubtableHeader extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Cmap $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_platformId = $this->_io->readU2be();
        $this->_m_encodingId = $this->_io->readU2be();
        $this->_m_subtableOffset = $this->_io->readU4be();
    }
    protected $_m_table;
    public function table() {
        if ($this->_m_table !== null)
            return $this->_m_table;
        $io = $this->_parent()->_io();
        $_pos = $io->pos();
        $io->seek($this->subtableOffset());
        $this->_m_table = new \Ttf\Cmap\Subtable($io, $this, $this->_root);
        $io->seek($_pos);
        return $this->_m_table;
    }
    protected $_m_platformId;
    protected $_m_encodingId;
    protected $_m_subtableOffset;
    public function platformId() { return $this->_m_platformId; }
    public function encodingId() { return $this->_m_encodingId; }
    public function subtableOffset() { return $this->_m_subtableOffset; }
}

namespace \Ttf\Cmap;

class Subtable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Cmap\SubtableHeader $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_format = $this->_io->readU2be();
        $this->_m_length = $this->_io->readU2be();
        $this->_m_version = $this->_io->readU2be();
        switch ($this->format()) {
            case \Ttf\Cmap\Subtable\SubtableFormat::BYTE_ENCODING_TABLE:
                $this->_m__raw_value = $this->_io->readBytes(($this->length() - 6));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Cmap\Subtable\ByteEncodingTable($io, $this, $this->_root);
                break;
            case \Ttf\Cmap\Subtable\SubtableFormat::HIGH_BYTE_MAPPING_THROUGH_TABLE:
                $this->_m__raw_value = $this->_io->readBytes(($this->length() - 6));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Cmap\Subtable\HighByteMappingThroughTable($io, $this, $this->_root);
                break;
            case \Ttf\Cmap\Subtable\SubtableFormat::TRIMMED_TABLE_MAPPING:
                $this->_m__raw_value = $this->_io->readBytes(($this->length() - 6));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Cmap\Subtable\TrimmedTableMapping($io, $this, $this->_root);
                break;
            case \Ttf\Cmap\Subtable\SubtableFormat::SEGMENT_MAPPING_TO_DELTA_VALUES:
                $this->_m__raw_value = $this->_io->readBytes(($this->length() - 6));
                $io = new \Kaitai\Struct\Stream($this->_m__raw_value);
                $this->_m_value = new \Ttf\Cmap\Subtable\SegmentMappingToDeltaValues($io, $this, $this->_root);
                break;
            default:
                $this->_m_value = $this->_io->readBytes(($this->length() - 6));
                break;
        }
    }
    protected $_m_format;
    protected $_m_length;
    protected $_m_version;
    protected $_m_value;
    protected $_m__raw_value;
    public function format() { return $this->_m_format; }
    public function length() { return $this->_m_length; }
    public function version() { return $this->_m_version; }
    public function value() { return $this->_m_value; }
    public function _raw_value() { return $this->_m__raw_value; }
}

namespace \Ttf\Cmap\Subtable;

class ByteEncodingTable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Cmap\Subtable $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_glyphIdArray = $this->_io->readBytes(256);
    }
    protected $_m_glyphIdArray;
    public function glyphIdArray() { return $this->_m_glyphIdArray; }
}

namespace \Ttf\Cmap\Subtable;

class HighByteMappingThroughTable extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Cmap\Subtable $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_subHeaderKeys = [];
        $n = 256;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_subHeaderKeys[] = $this->_io->readU2be();
        }
    }
    protected $_m_subHeaderKeys;
    public function subHeaderKeys() { return $this->_m_subHeaderKeys; }
}

namespace \Ttf\Cmap\Subtable;

class SegmentMappingToDeltaValues extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Cmap\Subtable $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_segCountX2 = $this->_io->readU2be();
        $this->_m_searchRange = $this->_io->readU2be();
        $this->_m_entrySelector = $this->_io->readU2be();
        $this->_m_rangeShift = $this->_io->readU2be();
        $this->_m_endCount = [];
        $n = $this->segCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_endCount[] = $this->_io->readU2be();
        }
        $this->_m_reservedPad = $this->_io->readU2be();
        $this->_m_startCount = [];
        $n = $this->segCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_startCount[] = $this->_io->readU2be();
        }
        $this->_m_idDelta = [];
        $n = $this->segCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_idDelta[] = $this->_io->readU2be();
        }
        $this->_m_idRangeOffset = [];
        $n = $this->segCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_idRangeOffset[] = $this->_io->readU2be();
        }
        $this->_m_glyphIdArray = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_glyphIdArray[] = $this->_io->readU2be();
            $i++;
        }
    }
    protected $_m_segCount;
    public function segCount() {
        if ($this->_m_segCount !== null)
            return $this->_m_segCount;
        $this->_m_segCount = intval($this->segCountX2() / 2);
        return $this->_m_segCount;
    }
    protected $_m_segCountX2;
    protected $_m_searchRange;
    protected $_m_entrySelector;
    protected $_m_rangeShift;
    protected $_m_endCount;
    protected $_m_reservedPad;
    protected $_m_startCount;
    protected $_m_idDelta;
    protected $_m_idRangeOffset;
    protected $_m_glyphIdArray;
    public function segCountX2() { return $this->_m_segCountX2; }
    public function searchRange() { return $this->_m_searchRange; }
    public function entrySelector() { return $this->_m_entrySelector; }
    public function rangeShift() { return $this->_m_rangeShift; }
    public function endCount() { return $this->_m_endCount; }
    public function reservedPad() { return $this->_m_reservedPad; }
    public function startCount() { return $this->_m_startCount; }
    public function idDelta() { return $this->_m_idDelta; }
    public function idRangeOffset() { return $this->_m_idRangeOffset; }
    public function glyphIdArray() { return $this->_m_glyphIdArray; }
}

namespace \Ttf\Cmap\Subtable;

class TrimmedTableMapping extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Ttf\Cmap\Subtable $_parent = null, \Ttf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_firstCode = $this->_io->readU2be();
        $this->_m_entryCount = $this->_io->readU2be();
        $this->_m_glyphIdArray = [];
        $n = $this->entryCount();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_glyphIdArray[] = $this->_io->readU2be();
        }
    }
    protected $_m_firstCode;
    protected $_m_entryCount;
    protected $_m_glyphIdArray;
    public function firstCode() { return $this->_m_firstCode; }
    public function entryCount() { return $this->_m_entryCount; }
    public function glyphIdArray() { return $this->_m_glyphIdArray; }
}

namespace \Ttf\Cmap\Subtable;

class SubtableFormat {
    const BYTE_ENCODING_TABLE = 0;
    const HIGH_BYTE_MAPPING_THROUGH_TABLE = 2;
    const SEGMENT_MAPPING_TO_DELTA_VALUES = 4;
    const TRIMMED_TABLE_MAPPING = 6;
}
