// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Zisofs = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * zisofs is a compression format for files on ISO9660 file system. It has
 * limited support across operating systems, mainly Linux kernel. Typically a
 * directory tree is first preprocessed by mkzftree (from the zisofs-tools
 * package before being turned into an ISO9660 image by mkisofs, genisoimage
 * or similar tool. The data is zlib compressed.
 * 
 * The specification here describes the structure of a file that has been
 * preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
 * decompressed, as blocks with length 0 have a special meaning. Decompression
 * and deconstruction of this data should be done outside of Kaitai Struct.
 * @see {@link https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs|Source}
 */

var Zisofs = (function() {
  function Zisofs(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Zisofs.prototype._read = function() {
    this._raw_header = this._io.readBytes(16);
    var _io__raw_header = new KaitaiStream(this._raw_header);
    this.header = new Header(_io__raw_header, this, this._root);
    this.blockPointers = [];
    for (var i = 0; i < (this.header.numBlocks + 1); i++) {
      this.blockPointers.push(this._io.readU4le());
    }
  }

  var Header = Zisofs.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(8);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [55, 228, 83, 150, 201, 219, 214, 7]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([55, 228, 83, 150, 201, 219, 214, 7], this.magic, this._io, "/types/header/seq/0");
      }
      this.uncompressedSize = this._io.readU4le();
      this.lenHeader = this._io.readU1();
      if (!(this.lenHeader == 4)) {
        throw new KaitaiStream.ValidationNotEqualError(4, this.lenHeader, this._io, "/types/header/seq/2");
      }
      this.blockSizeLog2 = this._io.readU1();
      if (!( ((this.blockSizeLog2 == 15) || (this.blockSizeLog2 == 16) || (this.blockSizeLog2 == 17)) )) {
        throw new KaitaiStream.ValidationNotAnyOfError(this.blockSizeLog2, this._io, "/types/header/seq/3");
      }
      this.reserved = this._io.readBytes(2);
      if (!((KaitaiStream.byteArrayCompare(this.reserved, [0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([0, 0], this.reserved, this._io, "/types/header/seq/4");
      }
    }
    Object.defineProperty(Header.prototype, 'blockSize', {
      get: function() {
        if (this._m_blockSize !== undefined)
          return this._m_blockSize;
        this._m_blockSize = (1 << this.blockSizeLog2);
        return this._m_blockSize;
      }
    });

    /**
     * ceil(uncompressed_size / block_size)
     */
    Object.defineProperty(Header.prototype, 'numBlocks', {
      get: function() {
        if (this._m_numBlocks !== undefined)
          return this._m_numBlocks;
        this._m_numBlocks = (Math.floor(this.uncompressedSize / this.blockSize) + (KaitaiStream.mod(this.uncompressedSize, this.blockSize) != 0 ? 1 : 0));
        return this._m_numBlocks;
      }
    });

    /**
     * Size of the original uncompressed file
     */

    /**
     * header_size >> 2 (currently 4)
     */

    return Header;
  })();

  var Block = Zisofs.Block = (function() {
    function Block(_io, _parent, _root, ofsStart, ofsEnd) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.ofsStart = ofsStart;
      this.ofsEnd = ofsEnd;

      this._read();
    }
    Block.prototype._read = function() {
    }
    Object.defineProperty(Block.prototype, 'lenData', {
      get: function() {
        if (this._m_lenData !== undefined)
          return this._m_lenData;
        this._m_lenData = (this.ofsEnd - this.ofsStart);
        return this._m_lenData;
      }
    });
    Object.defineProperty(Block.prototype, 'data', {
      get: function() {
        if (this._m_data !== undefined)
          return this._m_data;
        var io = this._root._io;
        var _pos = io.pos;
        io.seek(this.ofsStart);
        this._m_data = io.readBytes(this.lenData);
        io.seek(_pos);
        return this._m_data;
      }
    });

    return Block;
  })();
  Object.defineProperty(Zisofs.prototype, 'blocks', {
    get: function() {
      if (this._m_blocks !== undefined)
        return this._m_blocks;
      this._m_blocks = [];
      for (var i = 0; i < this.header.numBlocks; i++) {
        this._m_blocks.push(new Block(this._io, this, this._root, this.blockPointers[i], this.blockPointers[(i + 1)]));
      }
      return this._m_blocks;
    }
  });

  /**
   * The final pointer (`block_pointers[header.num_blocks]`) indicates the end
   * of the last block. Typically this is also the end of the file data.
   */

  return Zisofs;
})();
return Zisofs;
}));
