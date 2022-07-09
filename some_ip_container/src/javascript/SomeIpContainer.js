// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream', './SomeIp'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'), require('./SomeIp'));
  } else {
    root.SomeIpContainer = factory(root.KaitaiStream, root.SomeIp);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream, SomeIp) {
var SomeIpContainer = (function() {
  function SomeIpContainer(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  SomeIpContainer.prototype._read = function() {
    this.someIpPackages = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.someIpPackages.push(new SomeIp(this._io, this, null));
      i++;
    }
  }

  return SomeIpContainer;
})();
return SomeIpContainer;
}));
