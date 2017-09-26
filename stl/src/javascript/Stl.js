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
    this.triangles = new Array(this.numTriangles);
    for (var i = 0; i < this.numTriangles; i++) {
      this.triangles[i] = new Triangle(this._io, this, this._root);
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
      this._root = _root || this;

      this._read();
    }
    Triangle.prototype._read = function() {
      this.normal = new Vec3d(this._io, this, this._root);
      this.vertices = new Array(3);
      for (var i = 0; i < 3; i++) {
        this.vertices[i] = new Vec3d(this._io, this, this._root);
      }
    }

    return Triangle;
  })();

  var Vec3d = Stl.Vec3d = (function() {
    function Vec3d(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

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

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Stl', [], function() {
    return Stl;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Stl;
}
