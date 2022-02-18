// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.Vdi = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * A native VirtualBox file format
 * Images for testing can be downloaded from
 *  * https://www.osboxes.org/virtualbox-images/
 *  * https://virtualboxes.org/images/
 * or you can convert images of other formats.
 * @see {@link https://github.com/qemu/qemu/blob/master/block/vdi.c|Source}
 */

var Vdi = (function() {
  Vdi.ImageType = Object.freeze({
    DYNAMIC: 1,
    STATIC: 2,
    UNDO: 3,
    DIFF: 4,

    1: "DYNAMIC",
    2: "STATIC",
    3: "UNDO",
    4: "DIFF",
  });

  function Vdi(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Vdi.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
  }

  var Header = Vdi.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.text = KaitaiStream.bytesToStr(this._io.readBytes(64), "utf-8");
      this.signature = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.signature, [127, 16, 218, 190]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([127, 16, 218, 190], this.signature, this._io, "/types/header/seq/1");
      }
      this.version = new Version(this._io, this, this._root);
      if (this.subheaderSizeIsDynamic) {
        this.headerSizeOptional = this._io.readU4le();
      }
      this._raw_headerMain = this._io.readBytes(this.headerSize);
      var _io__raw_headerMain = new KaitaiStream(this._raw_headerMain);
      this.headerMain = new HeaderMain(_io__raw_headerMain, this, this._root);
    }

    var Uuid = Header.Uuid = (function() {
      function Uuid(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Uuid.prototype._read = function() {
        this.uuid = this._io.readBytes(16);
      }

      return Uuid;
    })();

    var Version = Header.Version = (function() {
      function Version(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Version.prototype._read = function() {
        this.major = this._io.readU2le();
        this.minor = this._io.readU2le();
      }

      return Version;
    })();

    var HeaderMain = Header.HeaderMain = (function() {
      function HeaderMain(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      HeaderMain.prototype._read = function() {
        this.imageType = this._io.readU4le();
        this.imageFlags = new Flags(this._io, this, this._root);
        this.description = KaitaiStream.bytesToStr(this._io.readBytes(256), "utf-8");
        if (this._parent.version.major >= 1) {
          this.blocksMapOffset = this._io.readU4le();
        }
        if (this._parent.version.major >= 1) {
          this.offsetData = this._io.readU4le();
        }
        this.geometry = new Geometry(this._io, this, this._root);
        if (this._parent.version.major >= 1) {
          this.reserved1 = this._io.readU4le();
        }
        this.diskSize = this._io.readU8le();
        this.blockDataSize = this._io.readU4le();
        if (this._parent.version.major >= 1) {
          this.blockMetadataSize = this._io.readU4le();
        }
        this.blocksInImage = this._io.readU4le();
        this.blocksAllocated = this._io.readU4le();
        this.uuidImage = new Uuid(this._io, this, this._root);
        this.uuidLastSnap = new Uuid(this._io, this, this._root);
        this.uuidLink = new Uuid(this._io, this, this._root);
        if (this._parent.version.major >= 1) {
          this.uuidParent = new Uuid(this._io, this, this._root);
        }
        if ( ((this._parent.version.major >= 1) && ((this._io.pos + 16) <= this._io.size)) ) {
          this.lchcGeometry = new Geometry(this._io, this, this._root);
        }
      }

      var Geometry = HeaderMain.Geometry = (function() {
        function Geometry(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Geometry.prototype._read = function() {
          this.cylinders = this._io.readU4le();
          this.heads = this._io.readU4le();
          this.sectors = this._io.readU4le();
          this.sectorSize = this._io.readU4le();
        }

        return Geometry;
      })();

      var Flags = HeaderMain.Flags = (function() {
        function Flags(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Flags.prototype._read = function() {
          this.reserved0 = this._io.readBitsIntBe(15);
          this.zeroExpand = this._io.readBitsIntBe(1) != 0;
          this.reserved1 = this._io.readBitsIntBe(6);
          this.diff = this._io.readBitsIntBe(1) != 0;
          this.fixed = this._io.readBitsIntBe(1) != 0;
          this.reserved2 = this._io.readBitsIntBe(8);
        }

        return Flags;
      })();

      /**
       * Size of block (bytes).
       */

      return HeaderMain;
    })();
    Object.defineProperty(Header.prototype, 'headerSize', {
      get: function() {
        if (this._m_headerSize !== undefined)
          return this._m_headerSize;
        this._m_headerSize = (this.subheaderSizeIsDynamic ? this.headerSizeOptional : 336);
        return this._m_headerSize;
      }
    });
    Object.defineProperty(Header.prototype, 'blocksMapOffset', {
      get: function() {
        if (this._m_blocksMapOffset !== undefined)
          return this._m_blocksMapOffset;
        this._m_blocksMapOffset = this.headerMain.blocksMapOffset;
        return this._m_blocksMapOffset;
      }
    });
    Object.defineProperty(Header.prototype, 'subheaderSizeIsDynamic', {
      get: function() {
        if (this._m_subheaderSizeIsDynamic !== undefined)
          return this._m_subheaderSizeIsDynamic;
        this._m_subheaderSizeIsDynamic = this.version.major >= 1;
        return this._m_subheaderSizeIsDynamic;
      }
    });
    Object.defineProperty(Header.prototype, 'blocksOffset', {
      get: function() {
        if (this._m_blocksOffset !== undefined)
          return this._m_blocksOffset;
        this._m_blocksOffset = this.headerMain.offsetData;
        return this._m_blocksOffset;
      }
    });
    Object.defineProperty(Header.prototype, 'blockSize', {
      get: function() {
        if (this._m_blockSize !== undefined)
          return this._m_blockSize;
        this._m_blockSize = (this.headerMain.blockMetadataSize + this.headerMain.blockDataSize);
        return this._m_blockSize;
      }
    });
    Object.defineProperty(Header.prototype, 'blocksMapSize', {
      get: function() {
        if (this._m_blocksMapSize !== undefined)
          return this._m_blocksMapSize;
        this._m_blocksMapSize = (Math.floor((((this.headerMain.blocksInImage * 4) + this.headerMain.geometry.sectorSize) - 1) / this.headerMain.geometry.sectorSize) * this.headerMain.geometry.sectorSize);
        return this._m_blocksMapSize;
      }
    });

    return Header;
  })();

  var BlocksMap = Vdi.BlocksMap = (function() {
    function BlocksMap(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BlocksMap.prototype._read = function() {
      this.index = new Array(this._root.header.headerMain.blocksInImage);
      for (var i = 0; i < this._root.header.headerMain.blocksInImage; i++) {
        this.index[i] = new BlockIndex(this._io, this, this._root);
      }
    }

    var BlockIndex = BlocksMap.BlockIndex = (function() {
      function BlockIndex(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      BlockIndex.prototype._read = function() {
        this.index = this._io.readU4le();
      }
      Object.defineProperty(BlockIndex.prototype, 'isAllocated', {
        get: function() {
          if (this._m_isAllocated !== undefined)
            return this._m_isAllocated;
          this._m_isAllocated = this.index < this._root.blockDiscarded;
          return this._m_isAllocated;
        }
      });
      Object.defineProperty(BlockIndex.prototype, 'block', {
        get: function() {
          if (this._m_block !== undefined)
            return this._m_block;
          if (this.isAllocated) {
            this._m_block = this._root.disk.blocks[this.index];
          }
          return this._m_block;
        }
      });

      return BlockIndex;
    })();

    return BlocksMap;
  })();

  var Disk = Vdi.Disk = (function() {
    function Disk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Disk.prototype._read = function() {
      this.blocks = new Array(this._root.header.headerMain.blocksInImage);
      for (var i = 0; i < this._root.header.headerMain.blocksInImage; i++) {
        this.blocks[i] = new Block(this._io, this, this._root);
      }
    }

    var Block = Disk.Block = (function() {
      function Block(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Block.prototype._read = function() {
        this.metadata = this._io.readBytes(this._root.header.headerMain.blockMetadataSize);
        this._raw_data = [];
        this.data = [];
        var i = 0;
        while (!this._io.isEof()) {
          this._raw_data.push(this._io.readBytes(this._root.header.headerMain.blockDataSize));
          var _io__raw_data = new KaitaiStream(this._raw_data[this._raw_data.length - 1]);
          this.data.push(new Sector(_io__raw_data, this, this._root));
          i++;
        }
      }

      var Sector = Block.Sector = (function() {
        function Sector(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Sector.prototype._read = function() {
          this.data = this._io.readBytes(this._root.header.headerMain.geometry.sectorSize);
        }

        return Sector;
      })();

      return Block;
    })();

    return Disk;
  })();
  Object.defineProperty(Vdi.prototype, 'blockDiscarded', {
    get: function() {
      if (this._m_blockDiscarded !== undefined)
        return this._m_blockDiscarded;
      this._m_blockDiscarded = 4294967294;
      return this._m_blockDiscarded;
    }
  });
  Object.defineProperty(Vdi.prototype, 'blockUnallocated', {
    get: function() {
      if (this._m_blockUnallocated !== undefined)
        return this._m_blockUnallocated;
      this._m_blockUnallocated = 4294967295;
      return this._m_blockUnallocated;
    }
  });

  /**
   * block_index = offset_in_virtual_disk / block_size actual_data_offset = blocks_map[block_index]*block_size+metadata_size+offset_in_block
   * The blocks_map will take up blocks_in_image_max * sizeof(uint32_t) bytes; since the blocks_map is read and written in a single operation, its size needs to be limited to INT_MAX; furthermore, when opening an image, the blocks_map size is rounded up to be aligned on BDRV_SECTOR_SIZE. Therefore this should satisfy the following: blocks_in_image_max * sizeof(uint32_t) + BDRV_SECTOR_SIZE == INT_MAX + 1 (INT_MAX + 1 is the first value not representable as an int) This guarantees that any value below or equal to the constant will, when multiplied by sizeof(uint32_t) and rounded up to a BDRV_SECTOR_SIZE boundary, still be below or equal to INT_MAX.
   */
  Object.defineProperty(Vdi.prototype, 'blocksMap', {
    get: function() {
      if (this._m_blocksMap !== undefined)
        return this._m_blocksMap;
      var _pos = this._io.pos;
      this._io.seek(this.header.blocksMapOffset);
      this._raw__m_blocksMap = this._io.readBytes(this.header.blocksMapSize);
      var _io__raw__m_blocksMap = new KaitaiStream(this._raw__m_blocksMap);
      this._m_blocksMap = new BlocksMap(_io__raw__m_blocksMap, this, this._root);
      this._io.seek(_pos);
      return this._m_blocksMap;
    }
  });
  Object.defineProperty(Vdi.prototype, 'disk', {
    get: function() {
      if (this._m_disk !== undefined)
        return this._m_disk;
      var _pos = this._io.pos;
      this._io.seek(this.header.blocksOffset);
      this._m_disk = new Disk(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_disk;
    }
  });

  return Vdi;
})();
return Vdi;
}));
