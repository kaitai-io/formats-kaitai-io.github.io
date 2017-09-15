<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * It is a color scheme for visualising SPM scans.
 */

class NtMdtPal extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \NtMdtPal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_signature = $this->_io->ensureFixedContents("\x4E\x54\x2D\x4D\x44\x54\x20\x50\x61\x6C\x65\x74\x74\x65\x20\x46\x69\x6C\x65\x20\x20\x31\x2E\x30\x30\x21");
        $this->_m_count = $this->_io->readU4be();
        $this->_m_meta = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_meta[] = new \NtMdtPal\Meta($this->_io, $this, $this->_root);
        }
        $this->_m_something2 = $this->_io->readBytes(1);
        $this->_m_tables = [];
        $n = $this->count();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_tables[] = new \NtMdtPal\ColTable($i, $this->_io, $this, $this->_root);
        }
    }
    protected $_m_signature;
    protected $_m_count;
    protected $_m_meta;
    protected $_m_something2;
    protected $_m_tables;
    public function signature() { return $this->_m_signature; }
    public function count() { return $this->_m_count; }
    public function meta() { return $this->_m_meta; }
    public function something2() { return $this->_m_something2; }
    public function tables() { return $this->_m_tables; }
}

namespace \NtMdtPal;

class Meta extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdtPal $_parent = null, \NtMdtPal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_unkn0 = $this->_io->readBytes(7);
        $this->_m_colorsCount = $this->_io->readU2le();
        $this->_m_unkn1 = $this->_io->readBytes(5);
        $this->_m_nameSize = $this->_io->readU2be();
    }
    protected $_m_unkn0;
    protected $_m_colorsCount;
    protected $_m_unkn1;
    protected $_m_nameSize;
    public function unkn0() { return $this->_m_unkn0; }
    public function colorsCount() { return $this->_m_colorsCount; }
    public function unkn1() { return $this->_m_unkn1; }
    public function nameSize() { return $this->_m_nameSize; }
}

namespace \NtMdtPal;

class Color extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \NtMdtPal\ColTable $_parent = null, \NtMdtPal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_data = $this->_io->readBytes(4);
    }
    protected $_m_data;
    public function data() { return $this->_m_data; }
}

namespace \NtMdtPal;

class ColTable extends \Kaitai\Struct\Struct {
    public function __construct(int $index, \Kaitai\Struct\Stream $_io, \NtMdtPal $_parent = null, \NtMdtPal $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_m_index = $index;
        $this->_read();
    }

    private function _read() {
        $this->_m_size1 = $this->_io->readU1();
        $this->_m_unkn = $this->_io->readU1();
        $this->_m_title = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes($this->_root()->meta()[$this->index()]->nameSize()), "UTF-16");
        $this->_m_unkn1 = $this->_io->readU2be();
        $this->_m_colors = [];
        $n = ($this->_root()->meta()[$this->index()]->colorsCount() - 1);
        for ($i = 0; $i < $n; $i++) {
            $this->_m_colors[] = new \NtMdtPal\Color($this->_io, $this, $this->_root);
        }
    }
    protected $_m_size1;
    protected $_m_unkn;
    protected $_m_title;
    protected $_m_unkn1;
    protected $_m_colors;
    protected $_m_index;
    public function size1() { return $this->_m_size1; }
    public function unkn() { return $this->_m_unkn; }
    public function title() { return $this->_m_title; }
    public function unkn1() { return $this->_m_unkn1; }
    public function colors() { return $this->_m_colors; }
    public function index() { return $this->_m_index; }
}
