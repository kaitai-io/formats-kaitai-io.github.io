// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream', './VlqBase128Le'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'), require('./VlqBase128Le'));
  } else {
    factory(root.GoogleProtobuf || (root.GoogleProtobuf = {}), root.KaitaiStream, root.VlqBase128Le || (root.VlqBase128Le = {}));
  }
})(typeof self !== 'undefined' ? self : this, function (GoogleProtobuf_, KaitaiStream, VlqBase128Le_) {
/**
 * Google Protocol Buffers (AKA protobuf) is a popular data
 * serialization scheme used for communication protocols, data storage,
 * etc. There are implementations are available for almost every
 * popular language. The focus points of this scheme are brevity (data
 * is encoded in a very size-efficient manner) and extensibility (one
 * can add keys to the structure, while keeping it readable in previous
 * version of software).
 * 
 * Protobuf uses semi-self-describing encoding scheme for its
 * messages. It means that it is possible to parse overall structure of
 * the message (skipping over fields one can't understand), but to
 * fully understand the message, one needs a protocol definition file
 * (`.proto`). To be specific:
 * 
 * * "Keys" in key-value pairs provided in the message are identified
 *   only with an integer "field tag". `.proto` file provides info on
 *   which symbolic field names these field tags map to.
 * * "Keys" also provide something called "wire type". It's not a data
 *   type in its common sense (i.e. you can't, for example, distinguish
 *   `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
 *   it's enough information to determine how many bytes to
 *   parse. Interpretation of the value should be done according to the
 *   type specified in `.proto` file.
 * * There's no direct information on which fields are optional /
 *   required, which fields may be repeated or constitute a map, what
 *   restrictions are placed on fields usage in a single message, what
 *   are the fields' default values, etc, etc.
 * @see {@link https://protobuf.dev/programming-guides/encoding/|Source}
 */

var GoogleProtobuf = (function() {
  function GoogleProtobuf(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GoogleProtobuf.prototype._read = function() {
    this.pairs = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.pairs.push(new Pair(this._io, this, this._root));
      i++;
    }
  }

  var DelimitedBytes = GoogleProtobuf.DelimitedBytes = (function() {
    function DelimitedBytes(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    DelimitedBytes.prototype._read = function() {
      this.len = new VlqBase128Le_.VlqBase128Le(this._io, null, null);
      this.body = this._io.readBytes(this.len.value);
    }

    return DelimitedBytes;
  })();

  /**
   * Key-value pair
   */

  var Pair = GoogleProtobuf.Pair = (function() {
    Pair.WireTypes = Object.freeze({
      VARINT: 0,
      BIT_64: 1,
      LEN_DELIMITED: 2,
      GROUP_START: 3,
      GROUP_END: 4,
      BIT_32: 5,

      0: "VARINT",
      1: "BIT_64",
      2: "LEN_DELIMITED",
      3: "GROUP_START",
      4: "GROUP_END",
      5: "BIT_32",
    });

    function Pair(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Pair.prototype._read = function() {
      this.key = new VlqBase128Le_.VlqBase128Le(this._io, null, null);
      switch (this.wireType) {
      case GoogleProtobuf.Pair.WireTypes.BIT_32:
        this.value = this._io.readU4le();
        break;
      case GoogleProtobuf.Pair.WireTypes.BIT_64:
        this.value = this._io.readU8le();
        break;
      case GoogleProtobuf.Pair.WireTypes.LEN_DELIMITED:
        this.value = new DelimitedBytes(this._io, this, this._root);
        break;
      case GoogleProtobuf.Pair.WireTypes.VARINT:
        this.value = new VlqBase128Le_.VlqBase128Le(this._io, null, null);
        break;
      }
    }

    /**
     * Identifies a field of protocol. One can look up symbolic
     * field name in a `.proto` file by this field tag.
     */
    Object.defineProperty(Pair.prototype, 'fieldTag', {
      get: function() {
        if (this._m_fieldTag !== undefined)
          return this._m_fieldTag;
        this._m_fieldTag = this.key.value >>> 3;
        return this._m_fieldTag;
      }
    });

    /**
     * "Wire type" is a part of the "key" that carries enough
     * information to parse value from the wire, i.e. read correct
     * amount of bytes, but there's not enough informaton to
     * interprete in unambiguously. For example, one can't clearly
     * distinguish 64-bit fixed-sized integers from 64-bit floats,
     * signed zigzag-encoded varints from regular unsigned varints,
     * arbitrary bytes from UTF-8 encoded strings, etc.
     */
    Object.defineProperty(Pair.prototype, 'wireType', {
      get: function() {
        if (this._m_wireType !== undefined)
          return this._m_wireType;
        this._m_wireType = this.key.value & 7;
        return this._m_wireType;
      }
    });

    /**
     * Key is a bit-mapped variable-length integer: lower 3 bits
     * are used for "wire type", and everything higher designates
     * an integer "field tag".
     */

    /**
     * Value that corresponds to field identified by
     * `field_tag`. Type is determined approximately: there is
     * enough information to parse it unambiguously from a stream,
     * but further infromation from `.proto` file is required to
     * interprete it properly.
     */

    return Pair;
  })();

  /**
   * Key-value pairs which constitute a message
   */

  return GoogleProtobuf;
})();
GoogleProtobuf_.GoogleProtobuf = GoogleProtobuf;
});
