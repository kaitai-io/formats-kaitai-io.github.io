// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.VlqBase128Le = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * A variable-length unsigned integer using base128 encoding. 1-byte groups
 * consist of 1-bit flag of continuation and 7-bit value chunk, and are ordered
 * "least significant group first", i.e. in "little-endian" manner.
 * 
 * This particular encoding is specified and used in:
 * 
 * * DWARF debug file format, where it's dubbed "unsigned LEB128" or "ULEB128".
 *   http://dwarfstd.org/doc/dwarf-2.0.0.pdf - page 139
 * * Google Protocol Buffers, where it's called "Base 128 Varints".
 *   https://developers.google.com/protocol-buffers/docs/encoding?csw=1#varints
 * * Apache Lucene, where it's called "VInt"
 *   http://lucene.apache.org/core/3_5_0/fileformats.html#VInt
 * * Apache Avro uses this as a basis for integer encoding, adding ZigZag on
 *   top of it for signed ints
 *   http://avro.apache.org/docs/current/spec.html#binary_encode_primitive
 * 
 * More information on this encoding is available at https://en.wikipedia.org/wiki/LEB128
 * 
 * This particular implementation supports serialized values to up 8 bytes long.
 */

var VlqBase128Le = (function() {
  function VlqBase128Le(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  VlqBase128Le.prototype._read = function() {
    this.groups = []
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

  var Group = VlqBase128Le.Group = (function() {
    function Group(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Group.prototype._read = function() {
      this.b = this._io.readU1();
    }

    /**
     * If true, then we have more bytes to read
     */
    Object.defineProperty(Group.prototype, 'hasNext', {
      get: function() {
        if (this._m_hasNext !== undefined)
          return this._m_hasNext;
        this._m_hasNext = (this.b & 128) != 0;
        return this._m_hasNext;
      }
    });

    /**
     * The 7-bit (base128) numeric value chunk of this group
     */
    Object.defineProperty(Group.prototype, 'value', {
      get: function() {
        if (this._m_value !== undefined)
          return this._m_value;
        this._m_value = (this.b & 127);
        return this._m_value;
      }
    });

    return Group;
  })();
  Object.defineProperty(VlqBase128Le.prototype, 'len', {
    get: function() {
      if (this._m_len !== undefined)
        return this._m_len;
      this._m_len = this.groups.length;
      return this._m_len;
    }
  });

  /**
   * Resulting value as normal integer
   */
  Object.defineProperty(VlqBase128Le.prototype, 'value', {
    get: function() {
      if (this._m_value !== undefined)
        return this._m_value;
      this._m_value = (((((((this.groups[0].value + (this.len >= 2 ? (this.groups[1].value << 7) : 0)) + (this.len >= 3 ? (this.groups[2].value << 14) : 0)) + (this.len >= 4 ? (this.groups[3].value << 21) : 0)) + (this.len >= 5 ? (this.groups[4].value << 28) : 0)) + (this.len >= 6 ? (this.groups[5].value << 35) : 0)) + (this.len >= 7 ? (this.groups[6].value << 42) : 0)) + (this.len >= 8 ? (this.groups[7].value << 49) : 0));
      return this._m_value;
    }
  });

  return VlqBase128Le;
})();
return VlqBase128Le;
}));
