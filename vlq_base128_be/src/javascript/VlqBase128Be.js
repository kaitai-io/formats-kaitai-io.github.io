// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.VlqBase128Be = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "most significant group first", i.e. in "big-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * Standard MIDI file format
 * * ASN.1 BER encoding
 * * RAR 5.0 file format
 * 
 * More information on this encoding is available at
 * <https://en.wikipedia.org/wiki/Variable-length_quantity>
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */

var VlqBase128Be = (function() {
  function VlqBase128Be(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  VlqBase128Be.prototype._read = function() {
    this.groups = [];
    var i = 0;
    do {
      var _ = new Group(this._io, this, this._root);
      this.groups.push(_);
      i++;
    } while (!(!(_.hasNext)));
  }

  /**
   * One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
   */

  var Group = VlqBase128Be.Group = (function() {
    function Group(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Group.prototype._read = function() {
      this.hasNext = this._io.readBitsIntBe(1) != 0;
      this.value = this._io.readBitsIntBe(7);
    }

    /**
     * If true, then we have more bytes to read
     */

    /**
     * The 7-bit (base128) numeric value chunk of this group
     */

    return Group;
  })();
  Object.defineProperty(VlqBase128Be.prototype, 'last', {
    get: function() {
      if (this._m_last !== undefined)
        return this._m_last;
      this._m_last = (this.groups.length - 1);
      return this._m_last;
    }
  });

  /**
   * Resulting value as normal integer
   */
  Object.defineProperty(VlqBase128Be.prototype, 'value', {
    get: function() {
      if (this._m_value !== undefined)
        return this._m_value;
      this._m_value = (((((((this.groups[this.last].value + (this.last >= 1 ? (this.groups[(this.last - 1)].value << 7) : 0)) + (this.last >= 2 ? (this.groups[(this.last - 2)].value << 14) : 0)) + (this.last >= 3 ? (this.groups[(this.last - 3)].value << 21) : 0)) + (this.last >= 4 ? (this.groups[(this.last - 4)].value << 28) : 0)) + (this.last >= 5 ? (this.groups[(this.last - 5)].value << 35) : 0)) + (this.last >= 6 ? (this.groups[(this.last - 6)].value << 42) : 0)) + (this.last >= 7 ? (this.groups[(this.last - 7)].value << 49) : 0));
      return this._m_value;
    }
  });

  return VlqBase128Be;
})();
return VlqBase128Be;
}));
