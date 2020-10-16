<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

namespace {
    class JavaClass extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->magic() == "\xCA\xFE\xBA\xBE")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\xCA\xFE\xBA\xBE", $this->magic(), $this->_io(), "/seq/0");
            }
            $this->_m_versionMinor = $this->_io->readU2be();
            $this->_m_versionMajor = $this->_io->readU2be();
            $this->_m_constantPoolCount = $this->_io->readU2be();
            $this->_m_constantPool = [];
            $n = ($this->constantPoolCount() - 1);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_constantPool[] = new \JavaClass\ConstantPoolEntry($this->_io, $this, $this->_root);
            }
            $this->_m_accessFlags = $this->_io->readU2be();
            $this->_m_thisClass = $this->_io->readU2be();
            $this->_m_superClass = $this->_io->readU2be();
            $this->_m_interfacesCount = $this->_io->readU2be();
            $this->_m_interfaces = [];
            $n = $this->interfacesCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_interfaces[] = $this->_io->readU2be();
            }
            $this->_m_fieldsCount = $this->_io->readU2be();
            $this->_m_fields = [];
            $n = $this->fieldsCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_fields[] = new \JavaClass\FieldInfo($this->_io, $this, $this->_root);
            }
            $this->_m_methodsCount = $this->_io->readU2be();
            $this->_m_methods = [];
            $n = $this->methodsCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_methods[] = new \JavaClass\MethodInfo($this->_io, $this, $this->_root);
            }
            $this->_m_attributesCount = $this->_io->readU2be();
            $this->_m_attributes = [];
            $n = $this->attributesCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_attributes[] = new \JavaClass\AttributeInfo($this->_io, $this, $this->_root);
            }
        }
        protected $_m_magic;
        protected $_m_versionMinor;
        protected $_m_versionMajor;
        protected $_m_constantPoolCount;
        protected $_m_constantPool;
        protected $_m_accessFlags;
        protected $_m_thisClass;
        protected $_m_superClass;
        protected $_m_interfacesCount;
        protected $_m_interfaces;
        protected $_m_fieldsCount;
        protected $_m_fields;
        protected $_m_methodsCount;
        protected $_m_methods;
        protected $_m_attributesCount;
        protected $_m_attributes;
        public function magic() { return $this->_m_magic; }
        public function versionMinor() { return $this->_m_versionMinor; }
        public function versionMajor() { return $this->_m_versionMajor; }
        public function constantPoolCount() { return $this->_m_constantPoolCount; }
        public function constantPool() { return $this->_m_constantPool; }
        public function accessFlags() { return $this->_m_accessFlags; }
        public function thisClass() { return $this->_m_thisClass; }
        public function superClass() { return $this->_m_superClass; }
        public function interfacesCount() { return $this->_m_interfacesCount; }
        public function interfaces() { return $this->_m_interfaces; }
        public function fieldsCount() { return $this->_m_fieldsCount; }
        public function fields() { return $this->_m_fields; }
        public function methodsCount() { return $this->_m_methodsCount; }
        public function methods() { return $this->_m_methods; }
        public function attributesCount() { return $this->_m_attributesCount; }
        public function attributes() { return $this->_m_attributes; }
    }
}

namespace JavaClass {
    class FloatCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = $this->_io->readF4be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace JavaClass {
    class AttributeInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_nameIndex = $this->_io->readU2be();
            $this->_m_attributeLength = $this->_io->readU4be();
            switch ($this->nameAsStr()) {
                case "SourceFile":
                    $this->_m__raw_info = $this->_io->readBytes($this->attributeLength());
                    $_io__raw_info = new \Kaitai\Struct\Stream($this->_m__raw_info);
                    $this->_m_info = new \JavaClass\AttributeInfo\AttrBodySourceFile($_io__raw_info, $this, $this->_root);
                    break;
                case "LineNumberTable":
                    $this->_m__raw_info = $this->_io->readBytes($this->attributeLength());
                    $_io__raw_info = new \Kaitai\Struct\Stream($this->_m__raw_info);
                    $this->_m_info = new \JavaClass\AttributeInfo\AttrBodyLineNumberTable($_io__raw_info, $this, $this->_root);
                    break;
                case "Exceptions":
                    $this->_m__raw_info = $this->_io->readBytes($this->attributeLength());
                    $_io__raw_info = new \Kaitai\Struct\Stream($this->_m__raw_info);
                    $this->_m_info = new \JavaClass\AttributeInfo\AttrBodyExceptions($_io__raw_info, $this, $this->_root);
                    break;
                case "Code":
                    $this->_m__raw_info = $this->_io->readBytes($this->attributeLength());
                    $_io__raw_info = new \Kaitai\Struct\Stream($this->_m__raw_info);
                    $this->_m_info = new \JavaClass\AttributeInfo\AttrBodyCode($_io__raw_info, $this, $this->_root);
                    break;
                default:
                    $this->_m_info = $this->_io->readBytes($this->attributeLength());
                    break;
            }
        }
        protected $_m_nameAsStr;
        public function nameAsStr() {
            if ($this->_m_nameAsStr !== null)
                return $this->_m_nameAsStr;
            $this->_m_nameAsStr = $this->_root()->constantPool()[($this->nameIndex() - 1)]->cpInfo()->value();
            return $this->_m_nameAsStr;
        }
        protected $_m_nameIndex;
        protected $_m_attributeLength;
        protected $_m_info;
        protected $_m__raw_info;
        public function nameIndex() { return $this->_m_nameIndex; }
        public function attributeLength() { return $this->_m_attributeLength; }
        public function info() { return $this->_m_info; }
        public function _raw_info() { return $this->_m__raw_info; }
    }
}

namespace JavaClass\AttributeInfo {
    class AttrBodyCode extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\AttributeInfo $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_maxStack = $this->_io->readU2be();
            $this->_m_maxLocals = $this->_io->readU2be();
            $this->_m_codeLength = $this->_io->readU4be();
            $this->_m_code = $this->_io->readBytes($this->codeLength());
            $this->_m_exceptionTableLength = $this->_io->readU2be();
            $this->_m_exceptionTable = [];
            $n = $this->exceptionTableLength();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_exceptionTable[] = new \JavaClass\AttributeInfo\AttrBodyCode\ExceptionEntry($this->_io, $this, $this->_root);
            }
            $this->_m_attributesCount = $this->_io->readU2be();
            $this->_m_attributes = [];
            $n = $this->attributesCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_attributes[] = new \JavaClass\AttributeInfo($this->_io, $this, $this->_root);
            }
        }
        protected $_m_maxStack;
        protected $_m_maxLocals;
        protected $_m_codeLength;
        protected $_m_code;
        protected $_m_exceptionTableLength;
        protected $_m_exceptionTable;
        protected $_m_attributesCount;
        protected $_m_attributes;
        public function maxStack() { return $this->_m_maxStack; }
        public function maxLocals() { return $this->_m_maxLocals; }
        public function codeLength() { return $this->_m_codeLength; }
        public function code() { return $this->_m_code; }
        public function exceptionTableLength() { return $this->_m_exceptionTableLength; }
        public function exceptionTable() { return $this->_m_exceptionTable; }
        public function attributesCount() { return $this->_m_attributesCount; }
        public function attributes() { return $this->_m_attributes; }
    }
}

namespace JavaClass\AttributeInfo\AttrBodyCode {
    class ExceptionEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\AttributeInfo\AttrBodyCode $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_startPc = $this->_io->readU2be();
            $this->_m_endPc = $this->_io->readU2be();
            $this->_m_handlerPc = $this->_io->readU2be();
            $this->_m_catchType = $this->_io->readU2be();
        }
        protected $_m_catchException;
        public function catchException() {
            if ($this->_m_catchException !== null)
                return $this->_m_catchException;
            if ($this->catchType() != 0) {
                $this->_m_catchException = $this->_root()->constantPool()[($this->catchType() - 1)];
            }
            return $this->_m_catchException;
        }
        protected $_m_startPc;
        protected $_m_endPc;
        protected $_m_handlerPc;
        protected $_m_catchType;

        /**
         * Start of a code region where exception handler is being
         * active, index in code array (inclusive)
         */
        public function startPc() { return $this->_m_startPc; }

        /**
         * End of a code region where exception handler is being
         * active, index in code array (exclusive)
         */
        public function endPc() { return $this->_m_endPc; }

        /**
         * Start of exception handler code, index in code array
         */
        public function handlerPc() { return $this->_m_handlerPc; }

        /**
         * Exception class that this handler catches, index in constant
         * pool, or 0 (catch all exceptions handler, used to implement
         * `finally`).
         */
        public function catchType() { return $this->_m_catchType; }
    }
}

namespace JavaClass\AttributeInfo {
    class AttrBodyExceptions extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\AttributeInfo $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_numberOfExceptions = $this->_io->readU2be();
            $this->_m_exceptions = [];
            $n = $this->numberOfExceptions();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_exceptions[] = new \JavaClass\AttributeInfo\AttrBodyExceptions\ExceptionTableEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numberOfExceptions;
        protected $_m_exceptions;
        public function numberOfExceptions() { return $this->_m_numberOfExceptions; }
        public function exceptions() { return $this->_m_exceptions; }
    }
}

namespace JavaClass\AttributeInfo\AttrBodyExceptions {
    class ExceptionTableEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\AttributeInfo\AttrBodyExceptions $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_index = $this->_io->readU2be();
        }
        protected $_m_asInfo;
        public function asInfo() {
            if ($this->_m_asInfo !== null)
                return $this->_m_asInfo;
            $this->_m_asInfo = $this->_root()->constantPool()[($this->index() - 1)]->cpInfo();
            return $this->_m_asInfo;
        }
        protected $_m_nameAsStr;
        public function nameAsStr() {
            if ($this->_m_nameAsStr !== null)
                return $this->_m_nameAsStr;
            $this->_m_nameAsStr = $this->asInfo()->nameAsStr();
            return $this->_m_nameAsStr;
        }
        protected $_m_index;
        public function index() { return $this->_m_index; }
    }
}

namespace JavaClass\AttributeInfo {
    class AttrBodySourceFile extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\AttributeInfo $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sourcefileIndex = $this->_io->readU2be();
        }
        protected $_m_sourcefileAsStr;
        public function sourcefileAsStr() {
            if ($this->_m_sourcefileAsStr !== null)
                return $this->_m_sourcefileAsStr;
            $this->_m_sourcefileAsStr = $this->_root()->constantPool()[($this->sourcefileIndex() - 1)]->cpInfo()->value();
            return $this->_m_sourcefileAsStr;
        }
        protected $_m_sourcefileIndex;
        public function sourcefileIndex() { return $this->_m_sourcefileIndex; }
    }
}

namespace JavaClass\AttributeInfo {
    class AttrBodyLineNumberTable extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\AttributeInfo $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_lineNumberTableLength = $this->_io->readU2be();
            $this->_m_lineNumberTable = [];
            $n = $this->lineNumberTableLength();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_lineNumberTable[] = new \JavaClass\AttributeInfo\AttrBodyLineNumberTable\LineNumberTableEntry($this->_io, $this, $this->_root);
            }
        }
        protected $_m_lineNumberTableLength;
        protected $_m_lineNumberTable;
        public function lineNumberTableLength() { return $this->_m_lineNumberTableLength; }
        public function lineNumberTable() { return $this->_m_lineNumberTable; }
    }
}

namespace JavaClass\AttributeInfo\AttrBodyLineNumberTable {
    class LineNumberTableEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\AttributeInfo\AttrBodyLineNumberTable $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_startPc = $this->_io->readU2be();
            $this->_m_lineNumber = $this->_io->readU2be();
        }
        protected $_m_startPc;
        protected $_m_lineNumber;
        public function startPc() { return $this->_m_startPc; }
        public function lineNumber() { return $this->_m_lineNumber; }
    }
}

namespace JavaClass {
    class MethodRefCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_classIndex = $this->_io->readU2be();
            $this->_m_nameAndTypeIndex = $this->_io->readU2be();
        }
        protected $_m_classAsInfo;
        public function classAsInfo() {
            if ($this->_m_classAsInfo !== null)
                return $this->_m_classAsInfo;
            $this->_m_classAsInfo = $this->_root()->constantPool()[($this->classIndex() - 1)]->cpInfo();
            return $this->_m_classAsInfo;
        }
        protected $_m_nameAndTypeAsInfo;
        public function nameAndTypeAsInfo() {
            if ($this->_m_nameAndTypeAsInfo !== null)
                return $this->_m_nameAndTypeAsInfo;
            $this->_m_nameAndTypeAsInfo = $this->_root()->constantPool()[($this->nameAndTypeIndex() - 1)]->cpInfo();
            return $this->_m_nameAndTypeAsInfo;
        }
        protected $_m_classIndex;
        protected $_m_nameAndTypeIndex;
        public function classIndex() { return $this->_m_classIndex; }
        public function nameAndTypeIndex() { return $this->_m_nameAndTypeIndex; }
    }
}

namespace JavaClass {
    class FieldInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_accessFlags = $this->_io->readU2be();
            $this->_m_nameIndex = $this->_io->readU2be();
            $this->_m_descriptorIndex = $this->_io->readU2be();
            $this->_m_attributesCount = $this->_io->readU2be();
            $this->_m_attributes = [];
            $n = $this->attributesCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_attributes[] = new \JavaClass\AttributeInfo($this->_io, $this, $this->_root);
            }
        }
        protected $_m_nameAsStr;
        public function nameAsStr() {
            if ($this->_m_nameAsStr !== null)
                return $this->_m_nameAsStr;
            $this->_m_nameAsStr = $this->_root()->constantPool()[($this->nameIndex() - 1)]->cpInfo()->value();
            return $this->_m_nameAsStr;
        }
        protected $_m_accessFlags;
        protected $_m_nameIndex;
        protected $_m_descriptorIndex;
        protected $_m_attributesCount;
        protected $_m_attributes;
        public function accessFlags() { return $this->_m_accessFlags; }
        public function nameIndex() { return $this->_m_nameIndex; }
        public function descriptorIndex() { return $this->_m_descriptorIndex; }
        public function attributesCount() { return $this->_m_attributesCount; }
        public function attributes() { return $this->_m_attributes; }
    }
}

namespace JavaClass {
    class DoubleCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = $this->_io->readF8be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace JavaClass {
    class LongCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = $this->_io->readU8be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace JavaClass {
    class InvokeDynamicCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_bootstrapMethodAttrIndex = $this->_io->readU2be();
            $this->_m_nameAndTypeIndex = $this->_io->readU2be();
        }
        protected $_m_bootstrapMethodAttrIndex;
        protected $_m_nameAndTypeIndex;
        public function bootstrapMethodAttrIndex() { return $this->_m_bootstrapMethodAttrIndex; }
        public function nameAndTypeIndex() { return $this->_m_nameAndTypeIndex; }
    }
}

namespace JavaClass {
    class MethodHandleCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_referenceKind = $this->_io->readU1();
            $this->_m_referenceIndex = $this->_io->readU2be();
        }
        protected $_m_referenceKind;
        protected $_m_referenceIndex;
        public function referenceKind() { return $this->_m_referenceKind; }
        public function referenceIndex() { return $this->_m_referenceIndex; }
    }
}

namespace JavaClass\MethodHandleCpInfo {
    class ReferenceKindEnum {
        const GET_FIELD = 1;
        const GET_STATIC = 2;
        const PUT_FIELD = 3;
        const PUT_STATIC = 4;
        const INVOKE_VIRTUAL = 5;
        const INVOKE_STATIC = 6;
        const INVOKE_SPECIAL = 7;
        const NEW_INVOKE_SPECIAL = 8;
        const INVOKE_INTERFACE = 9;
    }
}

namespace JavaClass {
    class NameAndTypeCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_nameIndex = $this->_io->readU2be();
            $this->_m_descriptorIndex = $this->_io->readU2be();
        }
        protected $_m_nameAsInfo;
        public function nameAsInfo() {
            if ($this->_m_nameAsInfo !== null)
                return $this->_m_nameAsInfo;
            $this->_m_nameAsInfo = $this->_root()->constantPool()[($this->nameIndex() - 1)]->cpInfo();
            return $this->_m_nameAsInfo;
        }
        protected $_m_nameAsStr;
        public function nameAsStr() {
            if ($this->_m_nameAsStr !== null)
                return $this->_m_nameAsStr;
            $this->_m_nameAsStr = $this->nameAsInfo()->value();
            return $this->_m_nameAsStr;
        }
        protected $_m_descriptorAsInfo;
        public function descriptorAsInfo() {
            if ($this->_m_descriptorAsInfo !== null)
                return $this->_m_descriptorAsInfo;
            $this->_m_descriptorAsInfo = $this->_root()->constantPool()[($this->descriptorIndex() - 1)]->cpInfo();
            return $this->_m_descriptorAsInfo;
        }
        protected $_m_descriptorAsStr;
        public function descriptorAsStr() {
            if ($this->_m_descriptorAsStr !== null)
                return $this->_m_descriptorAsStr;
            $this->_m_descriptorAsStr = $this->descriptorAsInfo()->value();
            return $this->_m_descriptorAsStr;
        }
        protected $_m_nameIndex;
        protected $_m_descriptorIndex;
        public function nameIndex() { return $this->_m_nameIndex; }
        public function descriptorIndex() { return $this->_m_descriptorIndex; }
    }
}

namespace JavaClass {
    class Utf8CpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_strLen = $this->_io->readU2be();
            $this->_m_value = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->strLen()), "UTF-8");
        }
        protected $_m_strLen;
        protected $_m_value;
        public function strLen() { return $this->_m_strLen; }
        public function value() { return $this->_m_value; }
    }
}

namespace JavaClass {
    class StringCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_stringIndex = $this->_io->readU2be();
        }
        protected $_m_stringIndex;
        public function stringIndex() { return $this->_m_stringIndex; }
    }
}

namespace JavaClass {
    class MethodTypeCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_descriptorIndex = $this->_io->readU2be();
        }
        protected $_m_descriptorIndex;
        public function descriptorIndex() { return $this->_m_descriptorIndex; }
    }
}

namespace JavaClass {
    class InterfaceMethodRefCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_classIndex = $this->_io->readU2be();
            $this->_m_nameAndTypeIndex = $this->_io->readU2be();
        }
        protected $_m_classAsInfo;
        public function classAsInfo() {
            if ($this->_m_classAsInfo !== null)
                return $this->_m_classAsInfo;
            $this->_m_classAsInfo = $this->_root()->constantPool()[($this->classIndex() - 1)]->cpInfo();
            return $this->_m_classAsInfo;
        }
        protected $_m_nameAndTypeAsInfo;
        public function nameAndTypeAsInfo() {
            if ($this->_m_nameAndTypeAsInfo !== null)
                return $this->_m_nameAndTypeAsInfo;
            $this->_m_nameAndTypeAsInfo = $this->_root()->constantPool()[($this->nameAndTypeIndex() - 1)]->cpInfo();
            return $this->_m_nameAndTypeAsInfo;
        }
        protected $_m_classIndex;
        protected $_m_nameAndTypeIndex;
        public function classIndex() { return $this->_m_classIndex; }
        public function nameAndTypeIndex() { return $this->_m_nameAndTypeIndex; }
    }
}

namespace JavaClass {
    class ClassCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_nameIndex = $this->_io->readU2be();
        }
        protected $_m_nameAsInfo;
        public function nameAsInfo() {
            if ($this->_m_nameAsInfo !== null)
                return $this->_m_nameAsInfo;
            $this->_m_nameAsInfo = $this->_root()->constantPool()[($this->nameIndex() - 1)]->cpInfo();
            return $this->_m_nameAsInfo;
        }
        protected $_m_nameAsStr;
        public function nameAsStr() {
            if ($this->_m_nameAsStr !== null)
                return $this->_m_nameAsStr;
            $this->_m_nameAsStr = $this->nameAsInfo()->value();
            return $this->_m_nameAsStr;
        }
        protected $_m_nameIndex;
        public function nameIndex() { return $this->_m_nameIndex; }
    }
}

namespace JavaClass {
    class ConstantPoolEntry extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_tag = $this->_io->readU1();
            switch ($this->tag()) {
                case \JavaClass\ConstantPoolEntry\TagEnum::INTERFACE_METHOD_REF:
                    $this->_m_cpInfo = new \JavaClass\InterfaceMethodRefCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::CLASS_TYPE:
                    $this->_m_cpInfo = new \JavaClass\ClassCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::UTF8:
                    $this->_m_cpInfo = new \JavaClass\Utf8CpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::METHOD_TYPE:
                    $this->_m_cpInfo = new \JavaClass\MethodTypeCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::INTEGER:
                    $this->_m_cpInfo = new \JavaClass\IntegerCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::STRING:
                    $this->_m_cpInfo = new \JavaClass\StringCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::FLOAT:
                    $this->_m_cpInfo = new \JavaClass\FloatCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::LONG:
                    $this->_m_cpInfo = new \JavaClass\LongCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::METHOD_REF:
                    $this->_m_cpInfo = new \JavaClass\MethodRefCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::DOUBLE:
                    $this->_m_cpInfo = new \JavaClass\DoubleCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::INVOKE_DYNAMIC:
                    $this->_m_cpInfo = new \JavaClass\InvokeDynamicCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::FIELD_REF:
                    $this->_m_cpInfo = new \JavaClass\FieldRefCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::METHOD_HANDLE:
                    $this->_m_cpInfo = new \JavaClass\MethodHandleCpInfo($this->_io, $this, $this->_root);
                    break;
                case \JavaClass\ConstantPoolEntry\TagEnum::NAME_AND_TYPE:
                    $this->_m_cpInfo = new \JavaClass\NameAndTypeCpInfo($this->_io, $this, $this->_root);
                    break;
            }
        }
        protected $_m_tag;
        protected $_m_cpInfo;
        public function tag() { return $this->_m_tag; }
        public function cpInfo() { return $this->_m_cpInfo; }
    }
}

namespace JavaClass\ConstantPoolEntry {
    class TagEnum {
        const UTF8 = 1;
        const INTEGER = 3;
        const FLOAT = 4;
        const LONG = 5;
        const DOUBLE = 6;
        const CLASS_TYPE = 7;
        const STRING = 8;
        const FIELD_REF = 9;
        const METHOD_REF = 10;
        const INTERFACE_METHOD_REF = 11;
        const NAME_AND_TYPE = 12;
        const METHOD_HANDLE = 15;
        const METHOD_TYPE = 16;
        const INVOKE_DYNAMIC = 18;
    }
}

namespace JavaClass {
    class MethodInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_accessFlags = $this->_io->readU2be();
            $this->_m_nameIndex = $this->_io->readU2be();
            $this->_m_descriptorIndex = $this->_io->readU2be();
            $this->_m_attributesCount = $this->_io->readU2be();
            $this->_m_attributes = [];
            $n = $this->attributesCount();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_attributes[] = new \JavaClass\AttributeInfo($this->_io, $this, $this->_root);
            }
        }
        protected $_m_nameAsStr;
        public function nameAsStr() {
            if ($this->_m_nameAsStr !== null)
                return $this->_m_nameAsStr;
            $this->_m_nameAsStr = $this->_root()->constantPool()[($this->nameIndex() - 1)]->cpInfo()->value();
            return $this->_m_nameAsStr;
        }
        protected $_m_accessFlags;
        protected $_m_nameIndex;
        protected $_m_descriptorIndex;
        protected $_m_attributesCount;
        protected $_m_attributes;
        public function accessFlags() { return $this->_m_accessFlags; }
        public function nameIndex() { return $this->_m_nameIndex; }
        public function descriptorIndex() { return $this->_m_descriptorIndex; }
        public function attributesCount() { return $this->_m_attributesCount; }
        public function attributes() { return $this->_m_attributes; }
    }
}

namespace JavaClass {
    class IntegerCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_value = $this->_io->readU4be();
        }
        protected $_m_value;
        public function value() { return $this->_m_value; }
    }
}

namespace JavaClass {
    class FieldRefCpInfo extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \JavaClass\ConstantPoolEntry $_parent = null, \JavaClass $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_classIndex = $this->_io->readU2be();
            $this->_m_nameAndTypeIndex = $this->_io->readU2be();
        }
        protected $_m_classAsInfo;
        public function classAsInfo() {
            if ($this->_m_classAsInfo !== null)
                return $this->_m_classAsInfo;
            $this->_m_classAsInfo = $this->_root()->constantPool()[($this->classIndex() - 1)]->cpInfo();
            return $this->_m_classAsInfo;
        }
        protected $_m_nameAndTypeAsInfo;
        public function nameAndTypeAsInfo() {
            if ($this->_m_nameAndTypeAsInfo !== null)
                return $this->_m_nameAndTypeAsInfo;
            $this->_m_nameAndTypeAsInfo = $this->_root()->constantPool()[($this->nameAndTypeIndex() - 1)]->cpInfo();
            return $this->_m_nameAndTypeAsInfo;
        }
        protected $_m_classIndex;
        protected $_m_nameAndTypeIndex;
        public function classIndex() { return $this->_m_classIndex; }
        public function nameAndTypeIndex() { return $this->_m_nameAndTypeIndex; }
    }
}
