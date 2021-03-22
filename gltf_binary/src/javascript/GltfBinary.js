// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.GltfBinary = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * glTF is a format for distribution of 3D models optimized for being used in software
 * @see {@link https://github.com/KhronosGroup/glTF/tree/2354846/specification/2.0#binary-gltf-layout|Source}
 */

var GltfBinary = (function() {
  GltfBinary.ChunkType = Object.freeze({
    BIN: 5130562,
    JSON: 1313821514,

    5130562: "BIN",
    1313821514: "JSON",
  });

  function GltfBinary(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  GltfBinary.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
    this.chunks = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.chunks.push(new Chunk(this._io, this, this._root));
      i++;
    }
  }

  var Header = GltfBinary.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [103, 108, 84, 70]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([103, 108, 84, 70], this.magic, this._io, "/types/header/seq/0");
      }
      this.version = this._io.readU4le();
      this.length = this._io.readU4le();
    }

    /**
     * Indicates the version of the Binary glTF container format.
     * For this specification, should be set to 2.
     */

    /**
     * Total length of the Binary glTF, including Header and all Chunks, in bytes.
     */

    return Header;
  })();

  var Chunk = GltfBinary.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.lenData = this._io.readU4le();
      this.type = this._io.readU4le();
      switch (this.type) {
      case GltfBinary.ChunkType.JSON:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Json(_io__raw_data, this, this._root);
        break;
      case GltfBinary.ChunkType.BIN:
        this._raw_data = this._io.readBytes(this.lenData);
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new Bin(_io__raw_data, this, this._root);
        break;
      default:
        this.data = this._io.readBytes(this.lenData);
        break;
      }
    }

    return Chunk;
  })();

  var Json = GltfBinary.Json = (function() {
    function Json(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Json.prototype._read = function() {
      this.data = KaitaiStream.bytesToStr(this._io.readBytesFull(), "UTF-8");
    }

    /**
     * This is where GLB deviates from being an elegant format.
     * To parse the rest of the file, you have to parse the JSON first.
     */

    return Json;
  })();

  var Bin = GltfBinary.Bin = (function() {
    function Bin(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Bin.prototype._read = function() {
      this.data = this._io.readBytesFull();
    }

    return Bin;
  })();

  return GltfBinary;
})();
return GltfBinary;
}));
