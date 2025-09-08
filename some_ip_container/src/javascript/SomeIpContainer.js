// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './SomeIp'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./SomeIp'));
  } else {
    factory(root.SomeIpContainer || (root.SomeIpContainer = {}), root.KaitaiStream, root.SomeIp || (root.SomeIp = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (SomeIpContainer_, KaitaiStream, SomeIp_) {
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
      this.someIpPackages.push(new SomeIp_.SomeIp(this._io, null, null));
      i++;
    }
  }

  return SomeIpContainer;
})();
SomeIpContainer_.SomeIpContainer = SomeIpContainer;
});
