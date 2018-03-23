<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Elf extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Elf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x7F\x45\x4C\x46");
        $this->_m_bits = $this->_io->readU1();
        $this->_m_endian = $this->_io->readU1();
        $this->_m_eiVersion = $this->_io->readU1();
        $this->_m_abi = $this->_io->readU1();
        $this->_m_abiVersion = $this->_io->readU1();
        $this->_m_pad = $this->_io->readBytes(7);
        $this->_m_header = new \Elf\EndianElf($this->_io, $this, $this->_root);
    }
    protected $_m_magic;
    protected $_m_bits;
    protected $_m_endian;
    protected $_m_eiVersion;
    protected $_m_abi;
    protected $_m_abiVersion;
    protected $_m_pad;
    protected $_m_header;

    /**
     * File identification, must be 0x7f + "ELF".
     */
    public function magic() { return $this->_m_magic; }

    /**
     * File class: designates target machine word size (32 or 64
     * bits). The size of many integer fields in this format will
     * depend on this setting.
     */
    public function bits() { return $this->_m_bits; }

    /**
     * Endianness used for all integers.
     */
    public function endian() { return $this->_m_endian; }

    /**
     * ELF header version.
     */
    public function eiVersion() { return $this->_m_eiVersion; }

    /**
     * Specifies which OS- and ABI-related extensions will be used
     * in this ELF file.
     */
    public function abi() { return $this->_m_abi; }

    /**
     * Version of ABI targeted by this ELF file. Interpretation
     * depends on `abi` attribute.
     */
    public function abiVersion() { return $this->_m_abiVersion; }
    public function pad() { return $this->_m_pad; }
    public function header() { return $this->_m_header; }
}

namespace \Elf;

class EndianElf extends \Kaitai\Struct\Struct {
    protected $_m__is_le;

    public function __construct(\Kaitai\Struct\Stream $_io, \Elf $_parent = null, \Elf $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        switch ($this->_root()->endian()) {
            case \Elf\Endian::LE:
                $this->_m__is_le = true;
                break;
            case \Elf\Endian::BE:
                $this->_m__is_le = false;
                break;
        }

        if (is_null($this->_m__is_le)) {
            throw new \RuntimeException("Unable to decide on endianness");
        } else if ($this->_m__is_le) {
            $this->_readLE();
        } else {
            $this->_readBE();
        }
    }

    private function _readLE() {
        $this->_m_eType = $this->_io->readU2le();
        $this->_m_machine = $this->_io->readU2le();
        $this->_m_eVersion = $this->_io->readU4le();
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_entryPoint = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_entryPoint = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_programHeaderOffset = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_programHeaderOffset = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_sectionHeaderOffset = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_sectionHeaderOffset = $this->_io->readU8le();
                break;
        }
        $this->_m_flags = $this->_io->readBytes(4);
        $this->_m_eEhsize = $this->_io->readU2le();
        $this->_m_programHeaderEntrySize = $this->_io->readU2le();
        $this->_m_qtyProgramHeader = $this->_io->readU2le();
        $this->_m_sectionHeaderEntrySize = $this->_io->readU2le();
        $this->_m_qtySectionHeader = $this->_io->readU2le();
        $this->_m_sectionNamesIdx = $this->_io->readU2le();
    }

    private function _readBE() {
        $this->_m_eType = $this->_io->readU2be();
        $this->_m_machine = $this->_io->readU2be();
        $this->_m_eVersion = $this->_io->readU4be();
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_entryPoint = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_entryPoint = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_programHeaderOffset = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_programHeaderOffset = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_sectionHeaderOffset = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_sectionHeaderOffset = $this->_io->readU8be();
                break;
        }
        $this->_m_flags = $this->_io->readBytes(4);
        $this->_m_eEhsize = $this->_io->readU2be();
        $this->_m_programHeaderEntrySize = $this->_io->readU2be();
        $this->_m_qtyProgramHeader = $this->_io->readU2be();
        $this->_m_sectionHeaderEntrySize = $this->_io->readU2be();
        $this->_m_qtySectionHeader = $this->_io->readU2be();
        $this->_m_sectionNamesIdx = $this->_io->readU2be();
    }
    protected $_m_programHeaders;
    public function programHeaders() {
        if ($this->_m_programHeaders !== null)
            return $this->_m_programHeaders;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->programHeaderOffset());
        if ($this->_m__is_le) {
            $this->_m__raw_programHeaders = [];
            $this->_m_programHeaders = [];
            $n = $this->qtyProgramHeader();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_programHeaders[] = $this->_io->readBytes($this->programHeaderEntrySize());
                $io = new \Kaitai\Struct\Stream(end($this->_m__raw_programHeaders));
                $this->_m_programHeaders[] = new \Elf\EndianElf\ProgramHeader($io, $this, $this->_root, $this->_m__is_le);
            }
        } else {
            $this->_m__raw_programHeaders = [];
            $this->_m_programHeaders = [];
            $n = $this->qtyProgramHeader();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_programHeaders[] = $this->_io->readBytes($this->programHeaderEntrySize());
                $io = new \Kaitai\Struct\Stream(end($this->_m__raw_programHeaders));
                $this->_m_programHeaders[] = new \Elf\EndianElf\ProgramHeader($io, $this, $this->_root, $this->_m__is_le);
            }
        }
        $this->_io->seek($_pos);
        return $this->_m_programHeaders;
    }
    protected $_m_sectionHeaders;
    public function sectionHeaders() {
        if ($this->_m_sectionHeaders !== null)
            return $this->_m_sectionHeaders;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->sectionHeaderOffset());
        if ($this->_m__is_le) {
            $this->_m__raw_sectionHeaders = [];
            $this->_m_sectionHeaders = [];
            $n = $this->qtySectionHeader();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_sectionHeaders[] = $this->_io->readBytes($this->sectionHeaderEntrySize());
                $io = new \Kaitai\Struct\Stream(end($this->_m__raw_sectionHeaders));
                $this->_m_sectionHeaders[] = new \Elf\EndianElf\SectionHeader($io, $this, $this->_root, $this->_m__is_le);
            }
        } else {
            $this->_m__raw_sectionHeaders = [];
            $this->_m_sectionHeaders = [];
            $n = $this->qtySectionHeader();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_sectionHeaders[] = $this->_io->readBytes($this->sectionHeaderEntrySize());
                $io = new \Kaitai\Struct\Stream(end($this->_m__raw_sectionHeaders));
                $this->_m_sectionHeaders[] = new \Elf\EndianElf\SectionHeader($io, $this, $this->_root, $this->_m__is_le);
            }
        }
        $this->_io->seek($_pos);
        return $this->_m_sectionHeaders;
    }
    protected $_m_strings;
    public function strings() {
        if ($this->_m_strings !== null)
            return $this->_m_strings;
        $_pos = $this->_io->pos();
        $this->_io->seek($this->sectionHeaders()[$this->sectionNamesIdx()]->offset());
        if ($this->_m__is_le) {
            $this->_m__raw_strings = $this->_io->readBytes($this->sectionHeaders()[$this->sectionNamesIdx()]->size());
            $io = new \Kaitai\Struct\Stream($this->_m__raw_strings);
            $this->_m_strings = new \Elf\EndianElf\StringsStruct($io, $this, $this->_root, $this->_m__is_le);
        } else {
            $this->_m__raw_strings = $this->_io->readBytes($this->sectionHeaders()[$this->sectionNamesIdx()]->size());
            $io = new \Kaitai\Struct\Stream($this->_m__raw_strings);
            $this->_m_strings = new \Elf\EndianElf\StringsStruct($io, $this, $this->_root, $this->_m__is_le);
        }
        $this->_io->seek($_pos);
        return $this->_m_strings;
    }
    protected $_m_eType;
    protected $_m_machine;
    protected $_m_eVersion;
    protected $_m_entryPoint;
    protected $_m_programHeaderOffset;
    protected $_m_sectionHeaderOffset;
    protected $_m_flags;
    protected $_m_eEhsize;
    protected $_m_programHeaderEntrySize;
    protected $_m_qtyProgramHeader;
    protected $_m_sectionHeaderEntrySize;
    protected $_m_qtySectionHeader;
    protected $_m_sectionNamesIdx;
    protected $_m__raw_programHeaders;
    protected $_m__raw_sectionHeaders;
    protected $_m__raw_strings;
    public function eType() { return $this->_m_eType; }
    public function machine() { return $this->_m_machine; }
    public function eVersion() { return $this->_m_eVersion; }
    public function entryPoint() { return $this->_m_entryPoint; }
    public function programHeaderOffset() { return $this->_m_programHeaderOffset; }
    public function sectionHeaderOffset() { return $this->_m_sectionHeaderOffset; }
    public function flags() { return $this->_m_flags; }
    public function eEhsize() { return $this->_m_eEhsize; }
    public function programHeaderEntrySize() { return $this->_m_programHeaderEntrySize; }
    public function qtyProgramHeader() { return $this->_m_qtyProgramHeader; }
    public function sectionHeaderEntrySize() { return $this->_m_sectionHeaderEntrySize; }
    public function qtySectionHeader() { return $this->_m_qtySectionHeader; }
    public function sectionNamesIdx() { return $this->_m_sectionNamesIdx; }
    public function _raw_programHeaders() { return $this->_m__raw_programHeaders; }
    public function _raw_sectionHeaders() { return $this->_m__raw_sectionHeaders; }
    public function _raw_strings() { return $this->_m__raw_strings; }
}

namespace \Elf\EndianElf;

class ProgramHeader extends \Kaitai\Struct\Struct {
    protected $_m__is_le;

    public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf $_parent = null, \Elf $_root = null, $is_le = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m__is_le = $is_le;
        $this->_read();
    }

    private function _read() {

        if (is_null($this->_m__is_le)) {
            throw new \RuntimeException("Unable to decide on endianness");
        } else if ($this->_m__is_le) {
            $this->_readLE();
        } else {
            $this->_readBE();
        }
    }

    private function _readLE() {
        $this->_m_type = $this->_io->readU4le();
        if ($this->_root()->bits() == \Elf\Bits::B64) {
            $this->_m_flags64 = $this->_io->readU4le();
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_offset = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_offset = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_vaddr = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_vaddr = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_paddr = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_paddr = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_filesz = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_filesz = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_memsz = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_memsz = $this->_io->readU8le();
                break;
        }
        if ($this->_root()->bits() == \Elf\Bits::B32) {
            $this->_m_flags32 = $this->_io->readU4le();
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_align = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_align = $this->_io->readU8le();
                break;
        }
    }

    private function _readBE() {
        $this->_m_type = $this->_io->readU4be();
        if ($this->_root()->bits() == \Elf\Bits::B64) {
            $this->_m_flags64 = $this->_io->readU4be();
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_offset = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_offset = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_vaddr = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_vaddr = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_paddr = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_paddr = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_filesz = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_filesz = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_memsz = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_memsz = $this->_io->readU8be();
                break;
        }
        if ($this->_root()->bits() == \Elf\Bits::B32) {
            $this->_m_flags32 = $this->_io->readU4be();
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_align = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_align = $this->_io->readU8be();
                break;
        }
    }
    protected $_m_dynamic;
    public function dynamic() {
        if ($this->_m_dynamic !== null)
            return $this->_m_dynamic;
        if ($this->type() == \Elf\PhType::DYNAMIC) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->offset());
            if ($this->_m__is_le) {
                $this->_m__raw_dynamic = $io->readBytes($this->filesz());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_dynamic);
                $this->_m_dynamic = new \Elf\EndianElf\DynamicSection($io, $this, $this->_root, $this->_m__is_le);
            } else {
                $this->_m__raw_dynamic = $io->readBytes($this->filesz());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_dynamic);
                $this->_m_dynamic = new \Elf\EndianElf\DynamicSection($io, $this, $this->_root, $this->_m__is_le);
            }
            $io->seek($_pos);
        }
        return $this->_m_dynamic;
    }
    protected $_m_type;
    protected $_m_flags64;
    protected $_m_offset;
    protected $_m_vaddr;
    protected $_m_paddr;
    protected $_m_filesz;
    protected $_m_memsz;
    protected $_m_flags32;
    protected $_m_align;
    protected $_m__raw_dynamic;
    public function type() { return $this->_m_type; }
    public function flags64() { return $this->_m_flags64; }
    public function offset() { return $this->_m_offset; }
    public function vaddr() { return $this->_m_vaddr; }
    public function paddr() { return $this->_m_paddr; }
    public function filesz() { return $this->_m_filesz; }
    public function memsz() { return $this->_m_memsz; }
    public function flags32() { return $this->_m_flags32; }
    public function align() { return $this->_m_align; }
    public function _raw_dynamic() { return $this->_m__raw_dynamic; }
}

namespace \Elf\EndianElf;

class DynamicSectionEntry extends \Kaitai\Struct\Struct {
    protected $_m__is_le;

    public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf\DynamicSection $_parent = null, \Elf $_root = null, $is_le = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m__is_le = $is_le;
        $this->_read();
    }

    private function _read() {

        if (is_null($this->_m__is_le)) {
            throw new \RuntimeException("Unable to decide on endianness");
        } else if ($this->_m__is_le) {
            $this->_readLE();
        } else {
            $this->_readBE();
        }
    }

    private function _readLE() {
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_tag = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_tag = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_valueOrPtr = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_valueOrPtr = $this->_io->readU8le();
                break;
        }
    }

    private function _readBE() {
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_tag = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_tag = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_valueOrPtr = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_valueOrPtr = $this->_io->readU8be();
                break;
        }
    }
    protected $_m_tagEnum;
    public function tagEnum() {
        if ($this->_m_tagEnum !== null)
            return $this->_m_tagEnum;
        $this->_m_tagEnum = $this->tag();
        return $this->_m_tagEnum;
    }
    protected $_m_tag;
    protected $_m_valueOrPtr;
    public function tag() { return $this->_m_tag; }
    public function valueOrPtr() { return $this->_m_valueOrPtr; }
}

namespace \Elf\EndianElf;

class SectionHeader extends \Kaitai\Struct\Struct {
    protected $_m__is_le;

    public function __construct(\Kaitai\Struct\Stream $_io, \Elf\EndianElf $_parent = null, \Elf $_root = null, $is_le = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m__is_le = $is_le;
        $this->_read();
    }

    private function _read() {

        if (is_null($this->_m__is_le)) {
            throw new \RuntimeException("Unable to decide on endianness");
        } else if ($this->_m__is_le) {
            $this->_readLE();
        } else {
            $this->_readBE();
        }
    }

    private function _readLE() {
        $this->_m_nameOffset = $this->_io->readU4le();
        $this->_m_type = $this->_io->readU4le();
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_flags = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_flags = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_addr = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_addr = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_offset = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_offset = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_size = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_size = $this->_io->readU8le();
                break;
        }
        $this->_m_linkedSectionIdx = $this->_io->readU4le();
        $this->_m_info = $this->_io->readBytes(4);
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_align = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_align = $this->_io->readU8le();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_entrySize = $this->_io->readU4le();
                break;
            case \Elf\Bits::B64:
                $this->_m_entrySize = $this->_io->readU8le();
                break;
        }
    }

    private function _readBE() {
        $this->_m_nameOffset = $this->_io->readU4be();
        $this->_m_type = $this->_io->readU4be();
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_flags = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_flags = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_addr = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_addr = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_offset = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_offset = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_size = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_size = $this->_io->readU8be();
                break;
        }
        $this->_m_linkedSectionIdx = $this->_io->readU4be();
        $this->_m_info = $this->_io->readBytes(4);
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_align = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_align = $this->_io->readU8be();
                break;
        }
        switch ($this->_root()->bits()) {
            case \Elf\Bits::B32:
                $this->_m_entrySize = $this->_io->readU4be();
                break;
            case \Elf\Bits::B64:
                $this->_m_entrySize = $this->_io->readU8be();
                break;
        }
    }
    protected $_m_flagsEnum;
    public function flagsEnum() {
        if ($this->_m_flagsEnum !== null)
            return $this->_m_flagsEnum;
        $this->_m_flagsEnum = $this->flags();
        return $this->_m_flagsEnum;
    }
    protected $_m_body;
    public function body() {
        if ($this->_m_body !== null)
            return $this->_m_body;
        $io = $this->_root()->_io();
        $_pos = $io->pos();
        $io->seek($this->offset());
        if ($this->_m__is_le) {
            $this->_m_body = $io->readBytes($this->size());
        } else {
            $this->_m_body = $io->readBytes($this->size());
        }
        $io->seek($_pos);
        return $this->_m_body;
    }
    protected $_m_strtab;
    public function strtab() {
        if ($this->_m_strtab !== null)
            return $this->_m_strtab;
        if ($this->type() == \Elf\ShType::STRTAB) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->offset());
            if ($this->_m__is_le) {
                $this->_m__raw_strtab = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_strtab);
                $this->_m_strtab = new \Elf\EndianElf\StringsStruct($io, $this, $this->_root, $this->_m__is_le);
            } else {
                $this->_m__raw_strtab = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_strtab);
                $this->_m_strtab = new \Elf\EndianElf\StringsStruct($io, $this, $this->_root, $this->_m__is_le);
            }
            $io->seek($_pos);
        }
        return $this->_m_strtab;
    }
    protected $_m_name;
    public function name() {
        if ($this->_m_name !== null)
            return $this->_m_name;
        $io = $this->_root()->header()->strings()->_io();
        $_pos = $io->pos();
        $io->seek($this->nameOffset());
        if ($this->_m__is_le) {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
        } else {
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr($io->readBytesTerm(0, false, true, true), "ASCII");
        }
        $io->seek($_pos);
        return $this->_m_name;
    }
    protected $_m_dynamic;
    public function dynamic() {
        if ($this->_m_dynamic !== null)
            return $this->_m_dynamic;
        if ($this->type() == \Elf\ShType::DYNAMIC) {
            $io = $this->_root()->_io();
            $_pos = $io->pos();
            $io->seek($this->offset());
            if ($this->_m__is_le) {
                $this->_m__raw_dynamic = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_dynamic);
                $this->_m_dynamic = new \Elf\EndianElf\DynamicSection($io, $this, $this->_root, $this->_m__is_le);
            } else {
                $this->_m__raw_dynamic = $io->readBytes($this->size());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_dynamic);
                $this->_m_dynamic = new \Elf\EndianElf\DynamicSection($io, $this, $this->_root, $this->_m__is_le);
            }
            $io->seek($_pos);
        }
        return $this->_m_dynamic;
    }
    protected $_m_nameOffset;
    protected $_m_type;
    protected $_m_flags;
    protected $_m_addr;
    protected $_m_offset;
    protected $_m_size;
    protected $_m_linkedSectionIdx;
    protected $_m_info;
    protected $_m_align;
    protected $_m_entrySize;
    protected $_m__raw_strtab;
    protected $_m__raw_dynamic;
    public function nameOffset() { return $this->_m_nameOffset; }
    public function type() { return $this->_m_type; }
    public function flags() { return $this->_m_flags; }
    public function addr() { return $this->_m_addr; }
    public function offset() { return $this->_m_offset; }
    public function size() { return $this->_m_size; }
    public function linkedSectionIdx() { return $this->_m_linkedSectionIdx; }
    public function info() { return $this->_m_info; }
    public function align() { return $this->_m_align; }
    public function entrySize() { return $this->_m_entrySize; }
    public function _raw_strtab() { return $this->_m__raw_strtab; }
    public function _raw_dynamic() { return $this->_m__raw_dynamic; }
}

namespace \Elf\EndianElf;

class DynamicSection extends \Kaitai\Struct\Struct {
    protected $_m__is_le;

    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Elf $_root = null, $is_le = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m__is_le = $is_le;
        $this->_read();
    }

    private function _read() {

        if (is_null($this->_m__is_le)) {
            throw new \RuntimeException("Unable to decide on endianness");
        } else if ($this->_m__is_le) {
            $this->_readLE();
        } else {
            $this->_readBE();
        }
    }

    private function _readLE() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \Elf\EndianElf\DynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
            $i++;
        }
    }

    private function _readBE() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = new \Elf\EndianElf\DynamicSectionEntry($this->_io, $this, $this->_root, $this->_m__is_le);
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Elf\EndianElf;

class StringsStruct extends \Kaitai\Struct\Struct {
    protected $_m__is_le;

    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Elf $_root = null, $is_le = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m__is_le = $is_le;
        $this->_read();
    }

    private function _read() {

        if (is_null($this->_m__is_le)) {
            throw new \RuntimeException("Unable to decide on endianness");
        } else if ($this->_m__is_le) {
            $this->_readLE();
        } else {
            $this->_readBE();
        }
    }

    private function _readLE() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
            $i++;
        }
    }

    private function _readBE() {
        $this->_m_entries = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_entries[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "ASCII");
            $i++;
        }
    }
    protected $_m_entries;
    public function entries() { return $this->_m_entries; }
}

namespace \Elf;

class Endian {
    const LE = 1;
    const BE = 2;
}

namespace \Elf;

class ShType {
    const NULL_TYPE = 0;
    const PROGBITS = 1;
    const SYMTAB = 2;
    const STRTAB = 3;
    const RELA = 4;
    const HASH = 5;
    const DYNAMIC = 6;
    const NOTE = 7;
    const NOBITS = 8;
    const REL = 9;
    const SHLIB = 10;
    const DYNSYM = 11;
    const INIT_ARRAY = 14;
    const FINI_ARRAY = 15;
    const PREINIT_ARRAY = 16;
    const GROUP = 17;
    const SYMTAB_SHNDX = 18;
    const SUNW_CAPCHAIN = 1879048175;
    const SUNW_CAPINFO = 1879048176;
    const SUNW_SYMSORT = 1879048177;
    const SUNW_TLSSORT = 1879048178;
    const SUNW_LDYNSYM = 1879048179;
    const SUNW_DOF = 1879048180;
    const SUNW_CAP = 1879048181;
    const SUNW_SIGNATURE = 1879048182;
    const SUNW_ANNOTATE = 1879048183;
    const SUNW_DEBUGSTR = 1879048184;
    const SUNW_DEBUG = 1879048185;
    const SUNW_MOVE = 1879048186;
    const SUNW_COMDAT = 1879048187;
    const SUNW_SYMINFO = 1879048188;
    const SUNW_VERDEF = 1879048189;
    const SUNW_VERNEED = 1879048190;
    const SUNW_VERSYM = 1879048191;
    const SPARC_GOTDATA = 1879048192;
    const AMD64_UNWIND = 1879048193;
}

namespace \Elf;

class OsAbi {
    const SYSTEM_V = 0;
    const HP_UX = 1;
    const NETBSD = 2;
    const GNU = 3;
    const SOLARIS = 6;
    const AIX = 7;
    const IRIX = 8;
    const FREEBSD = 9;
    const TRU64 = 10;
    const MODESTO = 11;
    const OPENBSD = 12;
    const OPENVMS = 13;
    const NSK = 14;
    const AROS = 15;
    const FENIXOS = 16;
    const CLOUDABI = 17;
    const OPENVOS = 18;
}

namespace \Elf;

class Machine {
    const NOT_SET = 0;
    const SPARC = 2;
    const X86 = 3;
    const MIPS = 8;
    const POWERPC = 20;
    const ARM = 40;
    const SUPERH = 42;
    const IA_64 = 50;
    const X86_64 = 62;
    const AARCH64 = 183;
}

namespace \Elf;

class PhdrType {
    const READ = 1;
    const WRITE = 2;
    const EXECUTE = 4;
    const MASK_PROC = 4026531840;
}

namespace \Elf;

class SectionHeaderFlags {
    const WRITE = 1;
    const ALLOC = 2;
    const EXEC_INSTR = 4;
    const MERGE = 16;
    const STRINGS = 32;
    const INFO_LINK = 64;
    const LINK_ORDER = 128;
    const OS_NON_CONFORMING = 256;
    const GROUP = 512;
    const TLS = 1024;
    const ORDERED = 67108864;
    const EXCLUDE = 134217728;
    const MASK_PROC = 4026531840;
}

namespace \Elf;

class DynamicArrayTags {
    const NULL = 0;
    const NEEDED = 1;
    const PLTRELSZ = 2;
    const PLTGOT = 3;
    const HASH = 4;
    const STRTAB = 5;
    const SYMTAB = 6;
    const RELA = 7;
    const RELASZ = 8;
    const RELAENT = 9;
    const STRSZ = 10;
    const SYMENT = 11;
    const INIT = 12;
    const FINI = 13;
    const SONAME = 14;
    const RPATH = 15;
    const SYMBOLIC = 16;
    const REL = 17;
    const RELSZ = 18;
    const RELENT = 19;
    const PLTREL = 20;
    const DEBUG = 21;
    const TEXTREL = 22;
    const JMPREL = 23;
    const BIND_NOW = 24;
    const INIT_ARRAY = 25;
    const FINI_ARRAY = 26;
    const INIT_ARRAYSZ = 27;
    const FINI_ARRAYSZ = 28;
    const RUNPATH = 29;
    const FLAGS = 30;
    const PREINIT_ARRAY = 32;
    const PREINIT_ARRAYSZ = 33;
    const MAXPOSTAGS = 34;
    const SUNW_AUXILIARY = 1610612749;
    const SUNW_FILTER = 1610612750;
    const SUNW_CAP = 1610612752;
    const SUNW_SYMTAB = 1610612753;
    const SUNW_SYMSZ = 1610612754;
    const SUNW_SORTENT = 1610612755;
    const SUNW_SYMSORT = 1610612756;
    const SUNW_SYMSORTSZ = 1610612757;
    const SUNW_TLSSORT = 1610612758;
    const SUNW_TLSSORTSZ = 1610612759;
    const SUNW_CAPINFO = 1610612760;
    const SUNW_STRPAD = 1610612761;
    const SUNW_CAPCHAIN = 1610612762;
    const SUNW_LDMACH = 1610612763;
    const SUNW_CAPCHAINENT = 1610612765;
    const SUNW_CAPCHAINSZ = 1610612767;
    const HIOS = 1879044096;
    const VALRNGLO = 1879047424;
    const GNU_PRELINKED = 1879047669;
    const GNU_CONFLICTSZ = 1879047670;
    const GNU_LIBLISTSZ = 1879047671;
    const CHECKSUM = 1879047672;
    const PLTPADSZ = 1879047673;
    const MOVEENT = 1879047674;
    const MOVESZ = 1879047675;
    const FEATURE_1 = 1879047676;
    const POSFLAG_1 = 1879047677;
    const SYMINSZ = 1879047678;
    const VALRNGHI = 1879047679;
    const ADDRRNGLO = 1879047680;
    const GNU_HASH = 1879047925;
    const TLSDESC_PLT = 1879047926;
    const TLSDESC_GOT = 1879047927;
    const GNU_CONFLICT = 1879047928;
    const GNU_LIBLIST = 1879047929;
    const CONFIG = 1879047930;
    const DEPAUDIT = 1879047931;
    const AUDIT = 1879047932;
    const PLTPAD = 1879047933;
    const MOVETAB = 1879047934;
    const ADDRRNGHI = 1879047935;
    const VERSYM = 1879048176;
    const RELACOUNT = 1879048185;
    const RELCOUNT = 1879048186;
    const FLAGS_1 = 1879048187;
    const VERDEF = 1879048188;
    const VERDEFNUM = 1879048189;
    const VERNEED = 1879048190;
    const VERNEEDNUM = 1879048191;
    const LOPROC = 1879048192;
    const SPARC_REGISTER = 1879048193;
    const AUXILIARY = 2147483645;
    const USED = 2147483646;
    const HIPROC = 2147483647;
}

namespace \Elf;

class Bits {
    const B32 = 1;
    const B64 = 2;
}

namespace \Elf;

class PhType {
    const NULL_TYPE = 0;
    const LOAD = 1;
    const DYNAMIC = 2;
    const INTERP = 3;
    const NOTE = 4;
    const SHLIB = 5;
    const PHDR = 6;
    const TLS = 7;
    const GNU_EH_FRAME = 1685382480;
    const GNU_STACK = 1685382481;
    const GNU_RELRO = 1685382482;
    const PAX_FLAGS = 1694766464;
    const HIOS = 1879048191;
}

namespace \Elf;

class ObjType {
    const RELOCATABLE = 1;
    const EXECUTABLE = 2;
    const SHARED = 3;
    const CORE = 4;
}
