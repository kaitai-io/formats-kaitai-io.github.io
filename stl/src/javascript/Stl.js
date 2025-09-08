// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Stl || (root.Stl = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Stl_, KaitaiStream) {
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

var Stl = (function() {
  function Stl(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Stl.prototype._read = function() {
    this.header = this._io.readBytes(80);
    this.numTriangles = this._io.readU4le();
    this.triangles = [];
    for (var i = 0; i < this.numTriangles; i++) {
      this.triangles.push(new Triangle(this._io, this, this._root));
    }
  }

  /**
   * Each STL triangle is defined by its 3 points in 3D space and a
   * normal vector, which is generally used to determine where is
   * "inside" and "outside" of the model.
   */

  var Triangle = Stl.Triangle = (function() {
    function Triangle(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Triangle.prototype._read = function() {
      this.normal = new Vec3d(this._io, this, this._root);
      this.vertices = [];
      for (var i = 0; i < 3; i++) {
        this.vertices.push(new Vec3d(this._io, this, this._root));
      }
      this.abr = this._io.readU2le();
    }

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

    return Triangle;
  })();

  var Vec3d = Stl.Vec3d = (function() {
    function Vec3d(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Vec3d.prototype._read = function() {
      this.x = this._io.readF4le();
      this.y = this._io.readF4le();
      this.z = this._io.readF4le();
    }

    return Vec3d;
  })();

  return Stl;
})();
Stl_.Stl = Stl;
});
