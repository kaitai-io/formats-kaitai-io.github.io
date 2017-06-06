// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
