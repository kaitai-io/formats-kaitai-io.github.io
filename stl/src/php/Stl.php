<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

class Stl extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \Stl $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_header = $this->_io->readBytes(80);
        $this->_m_numTriangles = $this->_io->readU4le();
        $this->_m_triangles = [];
        $n = $this->numTriangles();
        for ($i = 0; $i < $n; $i++) {
            $this->_m_triangles[] = new \Stl\Triangle($this->_io, $this, $this->_root);
        }
    }
    protected $_m_header;
    protected $_m_numTriangles;
    protected $_m_triangles;
    public function header() { return $this->_m_header; }
    public function numTriangles() { return $this->_m_numTriangles; }
    public function triangles() { return $this->_m_triangles; }
}

namespace \Stl;

class Triangle extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Stl $_parent = null, \Stl $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_normal = new \Stl\Vec3d($this->_io, $this, $this->_root);
        $this->_m_vertices = [];
        $n = 3;
        for ($i = 0; $i < $n; $i++) {
            $this->_m_vertices[] = new \Stl\Vec3d($this->_io, $this, $this->_root);
        }
    }
    protected $_m_normal;
    protected $_m_vertices;
    public function normal() { return $this->_m_normal; }
    public function vertices() { return $this->_m_vertices; }
}

namespace \Stl;

class Vec3d extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $_io, \Stl\Triangle $_parent = null, \Stl $_root = null) {
        parent::__construct($_io, $_parent, $_root);
        $this->_read();
    }

    private function _read() {
        $this->_m_x = $this->_io->readF4le();
        $this->_m_y = $this->_io->readF4le();
        $this->_m_z = $this->_io->readF4le();
    }
    protected $_m_x;
    protected $_m_y;
    protected $_m_z;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
    public function z() { return $this->_m_z; }
}
