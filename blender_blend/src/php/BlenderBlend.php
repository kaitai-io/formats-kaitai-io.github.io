<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class BlenderBlend extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_hdr = new \BlenderBlend\Header($this->_io, $this, $this->_root);
        $this->_m_blocks = [];
        $i = 0;
        while (!$this->_io->isEof()) {
            $this->_m_blocks[] = new \BlenderBlend\FileBlock($this->_io, $this, $this->_root);
            $i++;
        }
    }
    protected $_m_sdnaStructs;
    public function sdnaStructs() {
        if ($this->_m_sdnaStructs !== null)
            return $this->_m_sdnaStructs;
        $this->_m_sdnaStructs = $this->blocks()[(count($this->blocks()) - 2)]->body()->structs();
        return $this->_m_sdnaStructs;
    }
    protected $_m_hdr;
    protected $_m_blocks;
    public function hdr() { return $this->_m_hdr; }
    public function blocks() { return $this->_m_blocks; }
}

namespace \BlenderBlend;

class DnaStruct extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BlenderBlend\Dna1Body $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_idxType = $this->_io->readU2le();
        $this->_m_numFields = $this->_io->readU2le();
        $this->_m_fields = [];
        $n = $this->numFields();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_fields[] = new \BlenderBlend\DnaField($this->_io, $this, $this->_root);
        }
    }
    protected $_m_type;
    public function type() {
        if ($this->_m_type !== null)
            return $this->_m_type;
        $this->_m_type = $this->_parent()->types()[$this->idxType()];
        return $this->_m_type;
    }
    protected $_m_idxType;
    protected $_m_numFields;
    protected $_m_fields;
    public function idxType() { return $this->_m_idxType; }
    public function numFields() { return $this->_m_numFields; }
    public function fields() { return $this->_m_fields; }
}

namespace \BlenderBlend;

class FileBlock extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BlenderBlend $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_code = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
        $this->_m_lenBody = $this->_io->readU4le();
        $this->_m_memAddr = $this->_io->readBytes($this->_root()->hdr()->psize());
        $this->_m_sdnaIndex = $this->_io->readU4le();
        $this->_m_count = $this->_io->readU4le();
        switch ($this->code()) {
            case "DNA1":
                $this->_m__raw_body = $this->_io->readBytes($this->lenBody());
                $io = new \Kaitai\Struct\Stream($this->_m__raw_body);
                $this->_m_body = new \BlenderBlend\Dna1Body($io, $this, $this->_root);
                break;
            default:
                $this->_m_body = $this->_io->readBytes($this->lenBody());
                break;
        }
    }
    protected $_m_sdnaStruct;
    public function sdnaStruct() {
        if ($this->_m_sdnaStruct !== null)
            return $this->_m_sdnaStruct;
        if ($this->sdnaIndex() != 0) {
            $this->_m_sdnaStruct = $this->_root()->sdnaStructs()[$this->sdnaIndex()];
        }
        return $this->_m_sdnaStruct;
    }
    protected $_m_code;
    protected $_m_lenBody;
    protected $_m_memAddr;
    protected $_m_sdnaIndex;
    protected $_m_count;
    protected $_m_body;
    protected $_m__raw_body;

    /**
     * Identifier of the file block
     */
    public function code() { return $this->_m_code; }

    /**
     * Total length of the data after the header of file block
     */
    public function lenBody() { return $this->_m_lenBody; }

    /**
     * Memory address the structure was located when written to disk
     */
    public function memAddr() { return $this->_m_memAddr; }

    /**
     * Index of the SDNA structure
     */
    public function sdnaIndex() { return $this->_m_sdnaIndex; }

    /**
     * Number of structure located in this file-block
     */
    public function count() { return $this->_m_count; }
    public function body() { return $this->_m_body; }
    public function _raw_body() { return $this->_m__raw_body; }
}

namespace \BlenderBlend;

class Dna1Body extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BlenderBlend\FileBlock $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_id = $this->_io->ensureFixedContents("\x53\x44\x4E\x41");
        $this->_m_nameMagic = $this->_io->ensureFixedContents("\x4E\x41\x4D\x45");
        $this->_m_numNames = $this->_io->readU4le();
        $this->_m_names = [];
        $n = $this->numNames();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_names[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
        }
        $this->_m_padding1 = $this->_io->readBytes(\Kaitai\Struct\Stream::mod((4 - $this->_io()->pos()), 4));
        $this->_m_typeMagic = $this->_io->ensureFixedContents("\x54\x59\x50\x45");
        $this->_m_numTypes = $this->_io->readU4le();
        $this->_m_types = [];
        $n = $this->numTypes();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_types[] = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytesTerm(0, false, true, true), "UTF-8");
        }
        $this->_m_padding2 = $this->_io->readBytes(\Kaitai\Struct\Stream::mod((4 - $this->_io()->pos()), 4));
        $this->_m_tlenMagic = $this->_io->ensureFixedContents("\x54\x4C\x45\x4E");
        $this->_m_lengths = [];
        $n = $this->numTypes();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_lengths[] = $this->_io->readU2le();
        }
        $this->_m_padding3 = $this->_io->readBytes(\Kaitai\Struct\Stream::mod((4 - $this->_io()->pos()), 4));
        $this->_m_strcMagic = $this->_io->ensureFixedContents("\x53\x54\x52\x43");
        $this->_m_numStructs = $this->_io->readU4le();
        $this->_m_structs = [];
        $n = $this->numStructs();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_structs[] = new \BlenderBlend\DnaStruct($this->_io, $this, $this->_root);
        }
    }
    protected $_m_id;
    protected $_m_nameMagic;
    protected $_m_numNames;
    protected $_m_names;
    protected $_m_padding1;
    protected $_m_typeMagic;
    protected $_m_numTypes;
    protected $_m_types;
    protected $_m_padding2;
    protected $_m_tlenMagic;
    protected $_m_lengths;
    protected $_m_padding3;
    protected $_m_strcMagic;
    protected $_m_numStructs;
    protected $_m_structs;
    public function id() { return $this->_m_id; }
    public function nameMagic() { return $this->_m_nameMagic; }
    public function numNames() { return $this->_m_numNames; }
    public function names() { return $this->_m_names; }
    public function padding1() { return $this->_m_padding1; }
    public function typeMagic() { return $this->_m_typeMagic; }
    public function numTypes() { return $this->_m_numTypes; }
    public function types() { return $this->_m_types; }
    public function padding2() { return $this->_m_padding2; }
    public function tlenMagic() { return $this->_m_tlenMagic; }
    public function lengths() { return $this->_m_lengths; }
    public function padding3() { return $this->_m_padding3; }
    public function strcMagic() { return $this->_m_strcMagic; }
    public function numStructs() { return $this->_m_numStructs; }
    public function structs() { return $this->_m_structs; }
}

namespace \BlenderBlend;

class Header extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BlenderBlend $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x42\x4C\x45\x4E\x44\x45\x52");
        $this->_m_ptrSizeId = $this->_io->readU1();
        $this->_m_endian = $this->_io->readU1();
        $this->_m_version = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(3), "ASCII");
    }
    protected $_m_psize;

    /**
     * Number of bytes that a pointer occupies
     */
    public function psize() {
        if ($this->_m_psize !== null)
            return $this->_m_psize;
        $this->_m_psize = ($this->ptrSizeId() == \BlenderBlend\PtrSize::BITS_64 ? 8 : 4);
        return $this->_m_psize;
    }
    protected $_m_magic;
    protected $_m_ptrSizeId;
    protected $_m_endian;
    protected $_m_version;
    public function magic() { return $this->_m_magic; }

    /**
     * Size of a pointer; all pointers in the file are stored in this format
     */
    public function ptrSizeId() { return $this->_m_ptrSizeId; }

    /**
     * Type of byte ordering used
     */
    public function endian() { return $this->_m_endian; }

    /**
     * Blender version used to save this file
     */
    public function version() { return $this->_m_version; }
}

namespace \BlenderBlend;

class DnaField extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \BlenderBlend\DnaStruct $_parent = null, \BlenderBlend $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_idxType = $this->_io->readU2le();
        $this->_m_idxName = $this->_io->readU2le();
    }
    protected $_m_type;
    public function type() {
        if ($this->_m_type !== null)
            return $this->_m_type;
        $this->_m_type = $this->_parent()->_parent()->types()[$this->idxType()];
        return $this->_m_type;
    }
    protected $_m_name;
    public function name() {
        if ($this->_m_name !== null)
            return $this->_m_name;
        $this->_m_name = $this->_parent()->_parent()->names()[$this->idxName()];
        return $this->_m_name;
    }
    protected $_m_idxType;
    protected $_m_idxName;
    public function idxType() { return $this->_m_idxType; }
    public function idxName() { return $this->_m_idxName; }
}

namespace \BlenderBlend;

class PtrSize {
    const BITS_64 = 45;
    const BITS_32 = 95;
}

namespace \BlenderBlend;

class Endian {
    const BE = 86;
    const LE = 118;
}
