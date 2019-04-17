<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * STL files are used to represent simple 3D models, defined using
 * triangular 3D faces.
 * 
 * Initially it was introduced as native format for 3D Systems
 * Stereolithography CAD system, but due to its extreme simplicity, it
 * was adopted by a wide range of 3D modelling, CAD, rapid prototyping
 * and 3D printing applications as the simplest 3D model exchange
 * format.
 * 
 * STL is extremely bare-bones format: there are no complex headers, no
 * texture / color support, no units specifications, no distinct vertex
 * arrays. Whole model is specified as a collection of triangular
 * faces.
 * 
 * There are two versions of the format (text and binary), this spec
 * describes binary version.
 */

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

/**
 * Each STL triangle is defined by its 3 points in 3D space and a
 * normal vector, which is generally used to determine where is
 * "inside" and "outside" of the model.
 */

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
        $this->_m_abr = $this->_io->readU2le();
    }
    protected $_m_x;
    protected $_m_y;
    protected $_m_z;
    protected $_m_abr;
    public function x() { return $this->_m_x; }
    public function y() { return $this->_m_y; }
    public function z() { return $this->_m_z; }

    /**
     * In theory (per standard), it's "attribute byte count" with
     * no other details given on what "attribute" is and what
     * should be stored in this field.
     * 
     * In practice, software dealing with STL either expected to
     * see 0 here, or uses this 16-bit field per se to store
     * additional attributes (such as RGB color of a vertex or
     * color index).
     */
    public function abr() { return $this->_m_abr; }
}
