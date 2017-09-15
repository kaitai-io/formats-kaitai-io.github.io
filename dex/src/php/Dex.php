<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Dex extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = new \Dex\HeaderItem($this->_io, $this, $this->_root);
    }
    protected $_m_stringIds;

    /**
     * string identifiers list.
     * These are identifiers for all the strings used by this file, either for  internal naming (e.g., type descriptors) or as constant objects referred to by code.
     * This list must be sorted by string contents, using UTF-16 code point values (not in a locale-sensitive manner), and it must not contain any duplicate entries.    
     */
    public function stringIds() {
        if ($this->_m_stringIds !== null)
            return $this->_m_stringIds;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->stringIdsOff());
        $this->_m_stringIds = [];
        $n = $this->header()->stringIdsSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_stringIds[] = new \Dex\StringIdItem($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_stringIds;
    }
    protected $_m_methodIds;

    /**
     * method identifiers list.
     * These are identifiers for all methods referred to by this file, whether defined in the file or not.
     * This list must be sorted, where the defining type (by type_id index  is the major order, method name (by string_id index) is the intermediate order, and method prototype (by proto_id index) is the minor order.
     * The list must not contain any duplicate entries.
     */
    public function methodIds() {
        if ($this->_m_methodIds !== null)
            return $this->_m_methodIds;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->methodIdsOff());
        $this->_m_methodIds = [];
        $n = $this->header()->methodIdsSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_methodIds[] = new \Dex\MethodIdItem($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_methodIds;
    }
    protected $_m_linkData;

    /**
     * data used in statically linked files.
     * The format of the data in this section is left unspecified by this document.
     * This section is empty in unlinked files, and runtime implementations may use it as they see fit.
     */
    public function linkData() {
        if ($this->_m_linkData !== null)
            return $this->_m_linkData;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->linkOff());
        $this->_m_linkData = $this->_io->readBytes($this->header()->linkSize());
        $this->_io->seek($_pos);
        return $this->_m_linkData;
    }
    protected $_m_map;
    public function map() {
        if ($this->_m_map !== null)
            return $this->_m_map;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->mapOff());
        $this->_m_map = new \Dex\MapList($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_map;
    }
    protected $_m_classDefs;

    /**
     * class definitions list.
     * The classes must be ordered such that a given class's superclass and implemented interfaces appear in the list earlier than the referring class.
     * Furthermore, it is invalid for a definition for the same-named class to appear more than once in the list.
     */
    public function classDefs() {
        if ($this->_m_classDefs !== null)
            return $this->_m_classDefs;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->classDefsOff());
        $this->_m_classDefs = [];
        $n = $this->header()->classDefsSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_classDefs[] = new \Dex\ClassDefItem($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_classDefs;
    }
    protected $_m_data;

    /**
     * data area, containing all the support data for the tables listed above.
     * Different items have different alignment requirements, and padding bytes are inserted before each item if necessary to achieve proper alignment.
     */
    public function data() {
        if ($this->_m_data !== null)
            return $this->_m_data;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->dataOff());
        $this->_m_data = $this->_io->readBytes($this->header()->dataSize());
        $this->_io->seek($_pos);
        return $this->_m_data;
    }
    protected $_m_typeIds;

    /**
     * type identifiers list. 
     * These are identifiers for all types (classes, arrays, or primitive types)  referred to by this file, whether defined in the file or not.
     * This list must be sorted by string_id index, and it must not contain any duplicate entries.
     */
    public function typeIds() {
        if ($this->_m_typeIds !== null)
            return $this->_m_typeIds;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->typeIdsOff());
        $this->_m_typeIds = [];
        $n = $this->header()->typeIdsSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_typeIds[] = new \Dex\TypeIdItem($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_typeIds;
    }
    protected $_m_protoIds;

    /**
     * method prototype identifiers list.
     * These are identifiers for all prototypes referred to by this file.
     * This list must be sorted in return-type (by type_id index) major order, and then by argument list (lexicographic ordering, individual arguments ordered by type_id index). The list must not contain any duplicate entries.
     */
    public function protoIds() {
        if ($this->_m_protoIds !== null)
            return $this->_m_protoIds;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->protoIdsOff());
        $this->_m_protoIds = [];
        $n = $this->header()->protoIdsSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_protoIds[] = new \Dex\ProtoIdItem($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_protoIds;
    }
    protected $_m_fieldIds;

    /**
     * field identifiers list.
     * These are identifiers for all fields referred to by this file, whether defined in the file or not. 
     * This list must be sorted, where the defining type (by type_id index)  is the major order, field name (by string_id index) is the intermediate  order, and type (by type_id index) is the minor order.
     * The list must not contain any duplicate entries.
     */
    public function fieldIds() {
        if ($this->_m_fieldIds !== null)
            return $this->_m_fieldIds;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->header()->fieldIdsOff());
        $this->_m_fieldIds = [];
        $n = $this->header()->fieldIdsSize();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_fieldIds[] = new \Dex\FieldIdItem($this->_io, $this, $this->_root);
        }
        $this->_io->seek($_pos);
        return $this->_m_fieldIds;
    }
    protected $_m_header;
    public function header() { return $this->_m_header; }
}

namespace \Dex;

class HeaderItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x64\x65\x78\x0A");
        $this->_m_versionStr = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "ascii");
        $this->_m_magic2 = $this->_io->ensureFixedContents("\x00");
        $this->_m_checksum = $this->_io->readU4le();
        $this->_m_signature = $this->_io->readBytes(20);
        $this->_m_fileSize = $this->_io->readU4le();
        $this->_m_headerSize = $this->_io->readU4le();
        $this->_m_endianTag = $this->_io->readU4le();
        $this->_m_linkSize = $this->_io->readU4le();
        $this->_m_linkOff = $this->_io->readU4le();
        $this->_m_mapOff = $this->_io->readU4le();
        $this->_m_stringIdsSize = $this->_io->readU4le();
        $this->_m_stringIdsOff = $this->_io->readU4le();
        $this->_m_typeIdsSize = $this->_io->readU4le();
        $this->_m_typeIdsOff = $this->_io->readU4le();
        $this->_m_protoIdsSize = $this->_io->readU4le();
        $this->_m_protoIdsOff = $this->_io->readU4le();
        $this->_m_fieldIdsSize = $this->_io->readU4le();
        $this->_m_fieldIdsOff = $this->_io->readU4le();
        $this->_m_methodIdsSize = $this->_io->readU4le();
        $this->_m_methodIdsOff = $this->_io->readU4le();
        $this->_m_classDefsSize = $this->_io->readU4le();
        $this->_m_classDefsOff = $this->_io->readU4le();
        $this->_m_dataSize = $this->_io->readU4le();
        $this->_m_dataOff = $this->_io->readU4le();
    }
    protected $_m_magic;
    protected $_m_versionStr;
    protected $_m_magic2;
    protected $_m_checksum;
    protected $_m_signature;
    protected $_m_fileSize;
    protected $_m_headerSize;
    protected $_m_endianTag;
    protected $_m_linkSize;
    protected $_m_linkOff;
    protected $_m_mapOff;
    protected $_m_stringIdsSize;
    protected $_m_stringIdsOff;
    protected $_m_typeIdsSize;
    protected $_m_typeIdsOff;
    protected $_m_protoIdsSize;
    protected $_m_protoIdsOff;
    protected $_m_fieldIdsSize;
    protected $_m_fieldIdsOff;
    protected $_m_methodIdsSize;
    protected $_m_methodIdsOff;
    protected $_m_classDefsSize;
    protected $_m_classDefsOff;
    protected $_m_dataSize;
    protected $_m_dataOff;
    public function magic() { return $this->_m_magic; }
    public function versionStr() { return $this->_m_versionStr; }
    public function magic2() { return $this->_m_magic2; }

    /**
     * adler32 checksum of the rest of the file (everything but magic and this field);  used to detect file corruption
     */
    public function checksum() { return $this->_m_checksum; }

    /**
     * SHA-1 signature (hash) of the rest of the file (everything but magic, checksum,  and this field); used to uniquely identify files
     */
    public function signature() { return $this->_m_signature; }

    /**
     * size of the entire file (including the header), in bytes
     */
    public function fileSize() { return $this->_m_fileSize; }

    /**
     * size of the header (this entire section), in bytes. This allows for at  least a limited amount of backwards/forwards compatibility without  invalidating the format.
     */
    public function headerSize() { return $this->_m_headerSize; }
    public function endianTag() { return $this->_m_endianTag; }

    /**
     * size of the link section, or 0 if this file isn't statically linked
     */
    public function linkSize() { return $this->_m_linkSize; }

    /**
     * offset from the start of the file to the link section, or 0 if link_size == 0.  The offset, if non-zero, should be to an offset into the link_data section. The format of the data pointed at is left unspecified by this document;  this header field (and the previous) are left as hooks for use by runtime implementations.
     */
    public function linkOff() { return $this->_m_linkOff; }

    /**
     * offset from the start of the file to the map item. The offset, which must be non-zero, should be to an offset into the data  section, and the data should be in the format specified by "map_list" below.    
     */
    public function mapOff() { return $this->_m_mapOff; }

    /**
     * count of strings in the string identifiers list
     */
    public function stringIdsSize() { return $this->_m_stringIdsSize; }

    /**
     * offset from the start of the file to the string identifiers list, or 0 if string_ids_size == 0 (admittedly a strange edge case).  The offset, if non-zero, should be to the start of the string_ids section.
     */
    public function stringIdsOff() { return $this->_m_stringIdsOff; }

    /**
     * count of elements in the type identifiers list, at most 65535
     */
    public function typeIdsSize() { return $this->_m_typeIdsSize; }

    /**
     * offset from the start of the file to the type identifiers list,  or 0 if type_ids_size == 0 (admittedly a strange edge case).  The offset, if non-zero, should be to the start of the type_ids section.
     */
    public function typeIdsOff() { return $this->_m_typeIdsOff; }

    /**
     * count of elements in the prototype identifiers list, at most 65535
     */
    public function protoIdsSize() { return $this->_m_protoIdsSize; }

    /**
     * offset from the start of the file to the prototype identifiers list,  or 0 if proto_ids_size == 0 (admittedly a strange edge case). The offset, if non-zero, should be to the start of the proto_ids section.
     */
    public function protoIdsOff() { return $this->_m_protoIdsOff; }

    /**
     * count of elements in the field identifiers list
     */
    public function fieldIdsSize() { return $this->_m_fieldIdsSize; }

    /**
     * offset from the start of the file to the field identifiers list, or 0 if field_ids_size == 0. The offset, if non-zero, should be to the start of the field_ids section.    
     */
    public function fieldIdsOff() { return $this->_m_fieldIdsOff; }

    /**
     * count of elements in the method identifiers list
     */
    public function methodIdsSize() { return $this->_m_methodIdsSize; }

    /**
     * offset from the start of the file to the method identifiers list,  or 0 if method_ids_size == 0. The offset, if non-zero, should be to the start of the method_ids section.
     */
    public function methodIdsOff() { return $this->_m_methodIdsOff; }

    /**
     * count of elements in the class definitions list
     */
    public function classDefsSize() { return $this->_m_classDefsSize; }

    /**
     * offset from the start of the file to the class definitions list,  or 0 if class_defs_size == 0 (admittedly a strange edge case). The offset, if non-zero, should be to the start of the class_defs section.
     */
    public function classDefsOff() { return $this->_m_classDefsOff; }

    /**
     * Size of data section in bytes. Must be an even multiple of sizeof(uint).
     */
    public function dataSize() { return $this->_m_dataSize; }

    /**
     * offset from the start of the file to the start of the data section.
     */
    public function dataOff() { return $this->_m_dataOff; }
}

namespace \Dex\HeaderItem;

class EndianConstant {
    const ENDIAN_CONSTANT = 305419896;
    const REVERSE_ENDIAN_CONSTANT = 2018915346;
}

namespace \Dex;

class MapList extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_size = $this->_io->readU4le();
        $this->_m_list = [];
        $n = $this->size();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_list[] = new \Dex\MapItem($this->_io, $this, $this->_root);
        }
    }
    protected $_m_size;
    protected $_m_list;
    public function size() { return $this->_m_size; }
    public function list() { return $this->_m_list; }
}

namespace \Dex;

class EncodedValue extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_valueArg = $this->_io->readBitsInt(3);
        $this->_m_valueType = $this->_io->readBitsInt(5);
        $this->_io->alignToByte();
        switch ($this->valueType()) {
            case \Dex\EncodedValue\ValueTypeEnum::DOUBLE:
                $this->_m_value = $this->_io->readF8le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::ANNOTATION:
                $this->_m_value = new \Dex\EncodedAnnotation($this->_io, $this, $this->_root);
                break;
            case \Dex\EncodedValue\ValueTypeEnum::TYPE:
                $this->_m_value = $this->_io->readU4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::CHAR:
                $this->_m_value = $this->_io->readU2le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::METHOD_HANDLE:
                $this->_m_value = $this->_io->readU4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::ARRAY:
                $this->_m_value = new \Dex\EncodedArray($this->_io, $this, $this->_root);
                break;
            case \Dex\EncodedValue\ValueTypeEnum::BYTE:
                $this->_m_value = $this->_io->readS1();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::METHOD:
                $this->_m_value = $this->_io->readU4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::METHOD_TYPE:
                $this->_m_value = $this->_io->readU4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::SHORT:
                $this->_m_value = $this->_io->readS2le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::STRING:
                $this->_m_value = $this->_io->readU4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::INT:
                $this->_m_value = $this->_io->readS4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::FIELD:
                $this->_m_value = $this->_io->readU4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::LONG:
                $this->_m_value = $this->_io->readS8le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::FLOAT:
                $this->_m_value = $this->_io->readF4le();
                break;
            case \Dex\EncodedValue\ValueTypeEnum::ENUM:
                $this->_m_value = $this->_io->readU4le();
                break;
        }
    }
    protected $_m_valueArg;
    protected $_m_valueType;
    protected $_m_value;
    public function valueArg() { return $this->_m_valueArg; }
    public function valueType() { return $this->_m_valueType; }
    public function value() { return $this->_m_value; }
}

namespace \Dex\EncodedValue;

class ValueTypeEnum {
    const BYTE = 0;
    const SHORT = 2;
    const CHAR = 3;
    const INT = 4;
    const LONG = 6;
    const FLOAT = 16;
    const DOUBLE = 17;
    const METHOD_TYPE = 21;
    const METHOD_HANDLE = 22;
    const STRING = 23;
    const TYPE = 24;
    const FIELD = 25;
    const METHOD = 26;
    const ENUM = 27;
    const ARRAY = 28;
    const ANNOTATION = 29;
    const NULL = 30;
    const BOOLEAN = 31;
}

namespace \Dex;

class CallSiteIdItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_callSiteOff = $this->_io->readU4le();
    }
    protected $_m_callSiteOff;

    /**
     * offset from the start of the file to call site definition.
     * The offset should be in the data section, and the data there should be in the format specified by "call_site_item" below.
     */
    public function callSiteOff() { return $this->_m_callSiteOff; }
}

namespace \Dex;

class MethodIdItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_classIdx = $this->_io->readU2le();
        $this->_m_protoIdx = $this->_io->readU2le();
        $this->_m_nameIdx = $this->_io->readU4le();
    }
    protected $_m_classIdx;
    protected $_m_protoIdx;
    protected $_m_nameIdx;

    /**
     * index into the type_ids list for the definer of this method. This must be a class or array type, and not a primitive type.
     */
    public function classIdx() { return $this->_m_classIdx; }

    /**
     * index into the proto_ids list for the prototype of this method
     */
    public function protoIdx() { return $this->_m_protoIdx; }

    /**
     * index into the string_ids list for the name of this method. The string must conform to the syntax for MemberName, defined above.
     */
    public function nameIdx() { return $this->_m_nameIdx; }
}

namespace \Dex;

class Uleb128 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_b1 = $this->_io->readU1();
        if (($this->b1() & 128) != 0) {
            $this->_m_b2 = $this->_io->readU1();
        }
        if (($this->b2() & 128) != 0) {
            $this->_m_b3 = $this->_io->readU1();
        }
        if (($this->b3() & 128) != 0) {
            $this->_m_b4 = $this->_io->readU1();
        }
        if (($this->b4() & 128) != 0) {
            $this->_m_b5 = $this->_io->readU1();
        }
        if (($this->b5() & 128) != 0) {
            $this->_m_b6 = $this->_io->readU1();
        }
        if (($this->b6() & 128) != 0) {
            $this->_m_b7 = $this->_io->readU1();
        }
        if (($this->b7() & 128) != 0) {
            $this->_m_b8 = $this->_io->readU1();
        }
        if (($this->b8() & 128) != 0) {
            $this->_m_b9 = $this->_io->readU1();
        }
        if (($this->b9() & 128) != 0) {
            $this->_m_b10 = $this->_io->readU1();
        }
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $this->_m_value = ((\Kaitai\Struct\Stream::mod($this->b1(), 128) << 0) + (($this->b1() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b2(), 128) << 7) + (($this->b2() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b3(), 128) << 14) + (($this->b3() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b4(), 128) << 21) + (($this->b4() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b5(), 128) << 28) + (($this->b5() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b6(), 128) << 35) + (($this->b6() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b7(), 128) << 42) + (($this->b7() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b8(), 128) << 49) + (($this->b8() & 128) == 0 ? 0 : ((\Kaitai\Struct\Stream::mod($this->b9(), 128) << 56) + (($this->b8() & 128) == 0 ? 0 : (\Kaitai\Struct\Stream::mod($this->b10(), 128) << 63)))))))))))))))))));
        return $this->_m_value;
    }
    protected $_m_b1;
    protected $_m_b2;
    protected $_m_b3;
    protected $_m_b4;
    protected $_m_b5;
    protected $_m_b6;
    protected $_m_b7;
    protected $_m_b8;
    protected $_m_b9;
    protected $_m_b10;
    public function b1() { return $this->_m_b1; }
    public function b2() { return $this->_m_b2; }
    public function b3() { return $this->_m_b3; }
    public function b4() { return $this->_m_b4; }
    public function b5() { return $this->_m_b5; }
    public function b6() { return $this->_m_b6; }
    public function b7() { return $this->_m_b7; }
    public function b8() { return $this->_m_b8; }
    public function b9() { return $this->_m_b9; }
    public function b10() { return $this->_m_b10; }
}

namespace \Dex;

class TypeIdItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_descriptorIdx = $this->_io->readU4le();
    }
    protected $_m_typeName;
    public function typeName() {
        if ($this->_m_typeName !== null)
            return $this->_m_typeName;
        $this->_m_typeName = $this->_root()->stringIds()[$this->descriptorIdx()]->value()->data();
        return $this->_m_typeName;
    }
    protected $_m_descriptorIdx;

    /**
     * index into the string_ids list for the descriptor string of this type. The string must conform to the syntax for TypeDescriptor, defined above.
     */
    public function descriptorIdx() { return $this->_m_descriptorIdx; }
}

namespace \Dex;

class AnnotationElement extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\EncodedAnnotation $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_nameIdx = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_value = new \Dex\EncodedValue($this->_io, $this, $this->_root);
    }
    protected $_m_nameIdx;
    protected $_m_value;

    /**
     * element name, represented as an index into the string_ids section.
     * The string must conform to the syntax for MemberName, defined above.
     */
    public function nameIdx() { return $this->_m_nameIdx; }

    /**
     * element value
     */
    public function value() { return $this->_m_value; }
}

namespace \Dex;

class EncodedField extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\ClassDataItem $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_fieldIdxDiff = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_accessFlags = new \Dex\Uleb128($this->_io, $this, $this->_root);
    }
    protected $_m_fieldIdxDiff;
    protected $_m_accessFlags;

    /**
     * index into the field_ids list for the identity of this field (includes the name and descriptor), represented as a difference from the index of previous element in the list.
     * The index of the first element in a list is represented directly.
     */
    public function fieldIdxDiff() { return $this->_m_fieldIdxDiff; }

    /**
     * access flags for the field (public, final, etc.).
     * See "access_flags Definitions" for details.
     */
    public function accessFlags() { return $this->_m_accessFlags; }
}

namespace \Dex;

class EncodedArrayItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\ClassDefItem $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_value = new \Dex\EncodedArray($this->_io, $this, $this->_root);
    }
    protected $_m_value;
    public function value() { return $this->_m_value; }
}

namespace \Dex;

class ClassDataItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\ClassDefItem $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_staticFieldsSize = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_instanceFieldsSize = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_directMethodsSize = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_virtualMethodsSize = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_staticFields = [];
        $n = $this->staticFieldsSize()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_staticFields[] = new \Dex\EncodedField($this->_io, $this, $this->_root);
        }
        $this->_m_instanceFields = [];
        $n = $this->instanceFieldsSize()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_instanceFields[] = new \Dex\EncodedField($this->_io, $this, $this->_root);
        }
        $this->_m_directMethods = [];
        $n = $this->directMethodsSize()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_directMethods[] = new \Dex\EncodedMethod($this->_io, $this, $this->_root);
        }
        $this->_m_virtualMethods = [];
        $n = $this->virtualMethodsSize()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_virtualMethods[] = new \Dex\EncodedMethod($this->_io, $this, $this->_root);
        }
    }
    protected $_m_staticFieldsSize;
    protected $_m_instanceFieldsSize;
    protected $_m_directMethodsSize;
    protected $_m_virtualMethodsSize;
    protected $_m_staticFields;
    protected $_m_instanceFields;
    protected $_m_directMethods;
    protected $_m_virtualMethods;

    /**
     * the number of static fields defined in this item
     */
    public function staticFieldsSize() { return $this->_m_staticFieldsSize; }

    /**
     * the number of instance fields defined in this item
     */
    public function instanceFieldsSize() { return $this->_m_instanceFieldsSize; }

    /**
     * the number of direct methods defined in this item
     */
    public function directMethodsSize() { return $this->_m_directMethodsSize; }

    /**
     * the number of virtual methods defined in this item
     */
    public function virtualMethodsSize() { return $this->_m_virtualMethodsSize; }

    /**
     * the defined static fields, represented as a sequence of encoded elements.
     * The fields must be sorted by field_idx in increasing order.
     */
    public function staticFields() { return $this->_m_staticFields; }

    /**
     * the defined instance fields, represented as a sequence of encoded elements.
     * The fields must be sorted by field_idx in increasing order.        
     */
    public function instanceFields() { return $this->_m_instanceFields; }

    /**
     * the defined direct (any of static, private, or constructor) methods, represented as a sequence of encoded elements.
     * The methods must be sorted by method_idx in increasing order.
     */
    public function directMethods() { return $this->_m_directMethods; }

    /**
     * the defined virtual (none of static, private, or constructor) methods, represented as a sequence of encoded elements.
     * This list should not include inherited methods unless overridden by the class that this item represents.
     * The methods must be sorted by method_idx in increasing order.
     * The method_idx of a virtual method must not be the same as any direct method.        
     */
    public function virtualMethods() { return $this->_m_virtualMethods; }
}

namespace \Dex;

class FieldIdItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_classIdx = $this->_io->readU2le();
        $this->_m_typeIdx = $this->_io->readU2le();
        $this->_m_nameIdx = $this->_io->readU4le();
    }
    protected $_m_classIdx;
    protected $_m_typeIdx;
    protected $_m_nameIdx;

    /**
     * index into the type_ids list for the definer of this field. This must be a class type, and not an array or primitive type.
     */
    public function classIdx() { return $this->_m_classIdx; }

    /**
     * index into the type_ids list for the type of this field
     */
    public function typeIdx() { return $this->_m_typeIdx; }

    /**
     * index into the string_ids list for the name of this field. The string must conform to the syntax for MemberName, defined above.
     */
    public function nameIdx() { return $this->_m_nameIdx; }
}

namespace \Dex;

class EncodedAnnotation extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\EncodedValue $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_typeIdx = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_size = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_elements = [];
        $n = $this->size()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_elements[] = new \Dex\AnnotationElement($this->_io, $this, $this->_root);
        }
    }
    protected $_m_typeIdx;
    protected $_m_size;
    protected $_m_elements;

    /**
     * type of the annotation.
     * This must be a class (not array or primitive) type.
     */
    public function typeIdx() { return $this->_m_typeIdx; }

    /**
     * number of name-value mappings in this annotation
     */
    public function size() { return $this->_m_size; }

    /**
     * elements of the annotation, represented directly in-line (not as offsets).
     * Elements must be sorted in increasing order by string_id index.
     */
    public function elements() { return $this->_m_elements; }
}

namespace \Dex;

class ClassDefItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_classIdx = $this->_io->readU4le();
        $this->_m_accessFlags = $this->_io->readU4le();
        $this->_m_superclassIdx = $this->_io->readU4le();
        $this->_m_interfacesOff = $this->_io->readU4le();
        $this->_m_sourceFileIdx = $this->_io->readU4le();
        $this->_m_annotationsOff = $this->_io->readU4le();
        $this->_m_classDataOff = $this->_io->readU4le();
        $this->_m_staticValuesOff = $this->_io->readU4le();
    }
    protected $_m_typeName;
    public function typeName() {
        if ($this->_m_typeName !== null)
            return $this->_m_typeName;
        $this->_m_typeName = $this->_root()->typeIds()[$this->classIdx()]->typeName();
        return $this->_m_typeName;
    }
    protected $_m_classData;
    public function classData() {
        if ($this->_m_classData !== null)
            return $this->_m_classData;
        if ($this->classDataOff() != 0) {
            $_pos = $this->_io->pos();
            $this->_io->seek($this->classDataOff());
            $this->_m_classData = new \Dex\ClassDataItem($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
        }
        return $this->_m_classData;
    }
    protected $_m_staticValues;
    public function staticValues() {
        if ($this->_m_staticValues !== null)
            return $this->_m_staticValues;
        if ($this->staticValuesOff() != 0) {
            $_pos = $this->_io->pos();
            $this->_io->seek($this->staticValuesOff());
            $this->_m_staticValues = new \Dex\EncodedArrayItem($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
        }
        return $this->_m_staticValues;
    }
    protected $_m_classIdx;
    protected $_m_accessFlags;
    protected $_m_superclassIdx;
    protected $_m_interfacesOff;
    protected $_m_sourceFileIdx;
    protected $_m_annotationsOff;
    protected $_m_classDataOff;
    protected $_m_staticValuesOff;

    /**
     * index into the type_ids list for this class.
     * This must be a class type, and not an array or primitive type.
     */
    public function classIdx() { return $this->_m_classIdx; }

    /**
     * access flags for the class (public, final, etc.).
     * See "access_flags Definitions" for details.
     */
    public function accessFlags() { return $this->_m_accessFlags; }

    /**
     * index into the type_ids list for the superclass,  or the constant value NO_INDEX if this class has no superclass  (i.e., it is a root class such as Object). 
     * If present, this must be a class type, and not an array or primitive type.
     */
    public function superclassIdx() { return $this->_m_superclassIdx; }

    /**
     * offset from the start of the file to the list of interfaces, or 0 if there are none.
     * This offset should be in the data section, and the data there should  be in the format specified by "type_list" below. Each of the elements  of the list must be a class type (not an array or primitive type),  and there must not be any duplicates.        
     */
    public function interfacesOff() { return $this->_m_interfacesOff; }

    /**
     * index into the string_ids list for the name of the file containing  the original source for (at least most of) this class, or the  special value NO_INDEX to represent a lack of this information.
     * The debug_info_item of any given method may override this source file, but the expectation is that most classes will only come from one source file.
     */
    public function sourceFileIdx() { return $this->_m_sourceFileIdx; }

    /**
     * offset from the start of the file to the annotations structure for  this class, or 0 if there are no annotations on this class.
     * This offset, if non-zero, should be in the data section, and the data  there should be in the format specified by "annotations_directory_item" below,with all items referring to this class as the definer.        
     */
    public function annotationsOff() { return $this->_m_annotationsOff; }

    /**
     * offset from the start of the file to the associated class data for this item, or 0 if there is no class data for this class.
     * (This may be the case, for example, if this class is a marker interface.)
     * The offset, if non-zero, should be in the data section, and the data there should be in the format specified by "class_data_item" below, with all items referring to this class as the definer.        
     */
    public function classDataOff() { return $this->_m_classDataOff; }

    /**
     * offset from the start of the file to the list of initial values for  static fields, or 0 if there are none (and all static fields are to be  initialized with 0 or null).
     * This offset should be in the data section, and the data there should  be in the format specified by "encoded_array_item" below.
     * The size of the array must be no larger than the number of static fields  declared by this class, and the elements correspond to the static fields  in the same order as declared in the corresponding field_list.
     * The type of each array element must match the declared type of its corresponding field.
     * If there are fewer elements in the array than there are static fields, then the leftover fields are initialized with a type-appropriate 0 or null.
     */
    public function staticValuesOff() { return $this->_m_staticValuesOff; }
}

namespace \Dex;

class StringIdItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_stringDataOff = $this->_io->readU4le();
    }
    protected $_m_value;
    public function value() {
        if ($this->_m_value !== null)
            return $this->_m_value;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->stringDataOff());
        $this->_m_value = new \Dex\StringIdItem\StringDataItem($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_value;
    }
    protected $_m_stringDataOff;

    /**
     * offset from the start of the file to the string data for this item. The offset should be to a location in the data section, and the data should be in the format specified by "string_data_item" below. There is no alignment requirement for the offset.
     */
    public function stringDataOff() { return $this->_m_stringDataOff; }
}

namespace \Dex\StringIdItem;

class StringDataItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\StringIdItem $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_utf16Size = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_data = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->utf16Size()->value()), "ascii");
    }
    protected $_m_utf16Size;
    protected $_m_data;
    public function utf16Size() { return $this->_m_utf16Size; }
    public function data() { return $this->_m_data; }
}

namespace \Dex;

class ProtoIdItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_shortyIdx = $this->_io->readU4le();
        $this->_m_returnTypeIdx = $this->_io->readU4le();
        $this->_m_parametersOff = $this->_io->readU4le();
    }
    protected $_m_shortyIdx;
    protected $_m_returnTypeIdx;
    protected $_m_parametersOff;

    /**
     * index into the string_ids list for the short-form descriptor string of this prototype. The string must conform to the syntax for ShortyDescriptor, defined above,  and must correspond to the return type and parameters of this item.
     */
    public function shortyIdx() { return $this->_m_shortyIdx; }

    /**
     * index into the type_ids list for the return type of this prototype
     */
    public function returnTypeIdx() { return $this->_m_returnTypeIdx; }

    /**
     * offset from the start of the file to the list of parameter types for this prototype,  or 0 if this prototype has no parameters. This offset, if non-zero, should be in the data section, and the data there should be in the format specified by "type_list" below. Additionally, there should be no reference to the type void in the list.
     */
    public function parametersOff() { return $this->_m_parametersOff; }
}

namespace \Dex;

class EncodedMethod extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\ClassDataItem $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_methodIdxDiff = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_accessFlags = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_codeOff = new \Dex\Uleb128($this->_io, $this, $this->_root);
    }
    protected $_m_methodIdxDiff;
    protected $_m_accessFlags;
    protected $_m_codeOff;

    /**
     * index into the method_ids list for the identity of this method (includes the name and descriptor), represented as a difference from the index of previous element in the list.
     * The index of the first element in a list is represented directly.
     */
    public function methodIdxDiff() { return $this->_m_methodIdxDiff; }

    /**
     * access flags for the field (public, final, etc.).
     * See "access_flags Definitions" for details.
     */
    public function accessFlags() { return $this->_m_accessFlags; }

    /**
     * offset from the start of the file to the code structure for this method, or 0 if this method is either abstract or native.
     * The offset should be to a location in the data section.
     * The format of the data is specified by "code_item" below.
     */
    public function codeOff() { return $this->_m_codeOff; }
}

namespace \Dex;

class MapItem extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Dex\MapList $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_type = $this->_io->readU2le();
        $this->_m_unused = $this->_io->readU2le();
        $this->_m_size = $this->_io->readU4le();
        $this->_m_offset = $this->_io->readU4le();
    }
    protected $_m_type;
    protected $_m_unused;
    protected $_m_size;
    protected $_m_offset;

    /**
     * type of the items; see table below
     */
    public function type() { return $this->_m_type; }

    /**
     * (unused)
     */
    public function unused() { return $this->_m_unused; }

    /**
     * count of the number of items to be found at the indicated offset
     */
    public function size() { return $this->_m_size; }

    /**
     * offset from the start of the file to the items in question
     */
    public function offset() { return $this->_m_offset; }
}

namespace \Dex\MapItem;

class MapItemType {
    const HEADER_ITEM = 0;
    const STRING_ID_ITEM = 1;
    const TYPE_ID_ITEM = 2;
    const PROTO_ID_ITEM = 3;
    const FIELD_ID_ITEM = 4;
    const METHOD_ID_ITEM = 5;
    const CLASS_DEF_ITEM = 6;
    const CALL_SITE_ID_ITEM = 7;
    const METHOD_HANDLE_ITEM = 8;
    const MAP_LIST = 4096;
    const TYPE_LIST = 4097;
    const ANNOTATION_SET_REF_LIST = 4098;
    const ANNOTATION_SET_ITEM = 4099;
    const CLASS_DATA_ITEM = 8192;
    const CODE_ITEM = 8193;
    const STRING_DATA_ITEM = 8194;
    const DEBUG_INFO_ITEM = 8195;
    const ANNOTATION_ITEM = 8196;
    const ENCODED_ARRAY_ITEM = 8197;
    const ANNOTATIONS_DIRECTORY_ITEM = 8198;
}

namespace \Dex;

class EncodedArray extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Dex $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_size = new \Dex\Uleb128($this->_io, $this, $this->_root);
        $this->_m_values = [];
        $n = $this->size()->value();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_values[] = new \Dex\EncodedValue($this->_io, $this, $this->_root);
        }
    }
    protected $_m_size;
    protected $_m_values;
    public function size() { return $this->_m_size; }
    public function values() { return $this->_m_values; }
}

namespace \Dex;

class ClassAccessFlags {
    const PUBLIC = 1;
    const PRIVATE = 2;
    const PROTECTED = 4;
    const STATIC = 8;
    const FINAL = 16;
    const INTERFACE = 512;
    const ABSTRACT = 1024;
    const SYNTHETIC = 4096;
    const ANNOTATION = 8192;
    const ENUM = 16384;
}
