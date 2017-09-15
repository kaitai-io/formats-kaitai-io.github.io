// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var BlenderBlend = (function() {
  BlenderBlend.PtrSize = Object.freeze({
    BITS_64: 45,
    BITS_32: 95,

    45: "BITS_64",
    95: "BITS_32",
  });

  BlenderBlend.Endian = Object.freeze({
    BE: 86,
    LE: 118,

    86: "BE",
    118: "LE",
  });

  function BlenderBlend(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  BlenderBlend.prototype._read = function() {
    this.hdr = new Header(this._io, this, this._root);
    this.blocks = [];
    var i = 0;
    while (!this._io.isEof()) {
      this.blocks.push(new FileBlock(this._io, this, this._root));
      i++;
    }
  }

  var Header = BlenderBlend.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([66, 76, 69, 78, 68, 69, 82]);
      this.ptrSizeId = this._io.readU1();
      this.endian = this._io.readU1();
      this.version = KaitaiStream.bytesToStr(this._io.readBytes(3), "ASCII");
    }

    /**
     * Number of bytes that a pointer occupies
     */
    Object.defineProperty(Header.prototype, 'psize', {
      get: function() {
        if (this._m_psize !== undefined)
          return this._m_psize;
        this._m_psize = (this.ptrSizeId == BlenderBlend.PtrSize.BITS_64 ? 8 : 4);
        return this._m_psize;
      }
    });

    /**
     * Size of a pointer; all pointers in the file are stored in this format
     */

    /**
     * Type of byte ordering used
     */

    /**
     * Blender version used to save this file
     */

    return Header;
  })();

  var FileBlock = BlenderBlend.FileBlock = (function() {
    function FileBlock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileBlock.prototype._read = function() {
      this.code = KaitaiStream.bytesToStr(this._io.readBytes(4), "ASCII");
      this.size = this._io.readU4le();
      this.memAddr = this._io.readBytes(this._root.hdr.psize);
      this.sdnaIndex = this._io.readU4le();
      this.count = this._io.readU4le();
      this.body = this._io.readBytes(this.size);
    }

    /**
     * Identifier of the file block
     */

    /**
     * Total length of the data after the header of file block
     */

    /**
     * Memory address the structure was located when written to disk
     */

    /**
     * Index of the SDNA structure
     */

    /**
     * Number of structure located in this file-block
     */

    return FileBlock;
  })();

  return BlenderBlend;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('BlenderBlend', [], function() {
    return BlenderBlend;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = BlenderBlend;
}
