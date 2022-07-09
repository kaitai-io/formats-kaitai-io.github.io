// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.DsStore = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * Apple macOS '.DS_Store' file format.
 * @see {@link https://en.wikipedia.org/wiki/.DS_Store
 * https://metacpan.org/pod/distribution/Mac-Finder-DSStore/DSStoreFormat.pod
 * https://0day.work/parsing-the-ds_store-file-format
 * |Source}
 */

var DsStore = (function() {
  function DsStore(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  DsStore.prototype._read = function() {
    this.alignmentHeader = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.alignmentHeader, [0, 0, 0, 1]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([0, 0, 0, 1], this.alignmentHeader, this._io, "/seq/0");
    }
    this.buddyAllocatorHeader = new BuddyAllocatorHeader(this._io, this, this._root);
  }

  var BuddyAllocatorHeader = DsStore.BuddyAllocatorHeader = (function() {
    function BuddyAllocatorHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BuddyAllocatorHeader.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [66, 117, 100, 49]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([66, 117, 100, 49], this.magic, this._io, "/types/buddy_allocator_header/seq/0");
      }
      this.ofsBookkeepingInfoBlock = this._io.readU4be();
      this.lenBookkeepingInfoBlock = this._io.readU4be();
      this.copyOfsBookkeepingInfoBlock = this._io.readU4be();
      this._unnamed4 = this._io.readBytes(16);
    }

    /**
     * Magic number 'Bud1'.
     */

    /**
     * Needs to match 'offset_bookkeeping_info_block'.
     */

    /**
     * Unused field which might simply be the unused space at the end of the block,
     * since the minimum allocation size is 32 bytes.
     */

    return BuddyAllocatorHeader;
  })();

  var BuddyAllocatorBody = DsStore.BuddyAllocatorBody = (function() {
    function BuddyAllocatorBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    BuddyAllocatorBody.prototype._read = function() {
      this.numBlocks = this._io.readU4be();
      this._unnamed1 = this._io.readBytes(4);
      this.blockAddresses = [];
      for (var i = 0; i < this.numBlockAddresses; i++) {
        this.blockAddresses.push(new BlockDescriptor(this._io, this, this._root));
      }
      this.numDirectories = this._io.readU4be();
      this.directoryEntries = [];
      for (var i = 0; i < this.numDirectories; i++) {
        this.directoryEntries.push(new DirectoryEntry(this._io, this, this._root));
      }
      this.freeLists = [];
      for (var i = 0; i < this.numFreeLists; i++) {
        this.freeLists.push(new FreeList(this._io, this, this._root));
      }
    }

    var BlockDescriptor = BuddyAllocatorBody.BlockDescriptor = (function() {
      function BlockDescriptor(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      BlockDescriptor.prototype._read = function() {
        this.addressRaw = this._io.readU4be();
      }
      Object.defineProperty(BlockDescriptor.prototype, 'offset', {
        get: function() {
          if (this._m_offset !== undefined)
            return this._m_offset;
          this._m_offset = ((this.addressRaw & ~(this._root.blockAddressMask)) + 4);
          return this._m_offset;
        }
      });
      Object.defineProperty(BlockDescriptor.prototype, 'size', {
        get: function() {
          if (this._m_size !== undefined)
            return this._m_size;
          this._m_size = ((1 << this.addressRaw) & this._root.blockAddressMask);
          return this._m_size;
        }
      });

      return BlockDescriptor;
    })();

    var DirectoryEntry = BuddyAllocatorBody.DirectoryEntry = (function() {
      function DirectoryEntry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      DirectoryEntry.prototype._read = function() {
        this.lenName = this._io.readU1();
        this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.lenName), "UTF-8");
        this.blockId = this._io.readU4be();
      }

      return DirectoryEntry;
    })();

    var FreeList = BuddyAllocatorBody.FreeList = (function() {
      function FreeList(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      FreeList.prototype._read = function() {
        this.counter = this._io.readU4be();
        this.offsets = [];
        for (var i = 0; i < this.counter; i++) {
          this.offsets.push(this._io.readU4be());
        }
      }

      return FreeList;
    })();
    Object.defineProperty(BuddyAllocatorBody.prototype, 'numBlockAddresses', {
      get: function() {
        if (this._m_numBlockAddresses !== undefined)
          return this._m_numBlockAddresses;
        this._m_numBlockAddresses = 256;
        return this._m_numBlockAddresses;
      }
    });
    Object.defineProperty(BuddyAllocatorBody.prototype, 'numFreeLists', {
      get: function() {
        if (this._m_numFreeLists !== undefined)
          return this._m_numFreeLists;
        this._m_numFreeLists = 32;
        return this._m_numFreeLists;
      }
    });

    /**
     * Master blocks of the different B-trees.
     */
    Object.defineProperty(BuddyAllocatorBody.prototype, 'directories', {
      get: function() {
        if (this._m_directories !== undefined)
          return this._m_directories;
        var io = this._root._io;
        this._m_directories = [];
        for (var i = 0; i < this.numDirectories; i++) {
          this._m_directories.push(new MasterBlockRef(io, this, this._root, i));
        }
        return this._m_directories;
      }
    });

    /**
     * Number of blocks in the allocated-blocks list.
     */

    /**
     * Unknown field which appears to always be 0.
     */

    /**
     * Addresses of the different blocks.
     */

    /**
     * Indicates the number of directory entries.
     */

    /**
     * Each directory is an independent B-tree.
     */

    return BuddyAllocatorBody;
  })();

  var MasterBlockRef = DsStore.MasterBlockRef = (function() {
    function MasterBlockRef(_io, _parent, _root, idx) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.idx = idx;

      this._read();
    }
    MasterBlockRef.prototype._read = function() {
    }

    var MasterBlock = MasterBlockRef.MasterBlock = (function() {
      function MasterBlock(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      MasterBlock.prototype._read = function() {
        this.blockId = this._io.readU4be();
        this.numInternalNodes = this._io.readU4be();
        this.numRecords = this._io.readU4be();
        this.numNodes = this._io.readU4be();
        this._unnamed4 = this._io.readU4be();
      }
      Object.defineProperty(MasterBlock.prototype, 'rootBlock', {
        get: function() {
          if (this._m_rootBlock !== undefined)
            return this._m_rootBlock;
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this._root.buddyAllocatorBody.blockAddresses[this.blockId].offset);
          this._m_rootBlock = new Block(io, this, this._root);
          io.seek(_pos);
          return this._m_rootBlock;
        }
      });

      /**
       * Block number of the B-tree's root node.
       */

      /**
       * Number of internal node levels.
       */

      /**
       * Number of records in the tree.
       */

      /**
       * Number of nodes in the tree.
       */

      /**
       * Always 0x1000, probably the B-tree node page size.
       */

      return MasterBlock;
    })();
    Object.defineProperty(MasterBlockRef.prototype, 'masterBlock', {
      get: function() {
        if (this._m_masterBlock !== undefined)
          return this._m_masterBlock;
        var _pos = this._io.pos;
        this._io.seek(this._parent.blockAddresses[this._parent.directoryEntries[this.idx].blockId].offset);
        this._raw__m_masterBlock = this._io.readBytes(this._parent.blockAddresses[this._parent.directoryEntries[this.idx].blockId].size);
        var _io__raw__m_masterBlock = new KaitaiStream(this._raw__m_masterBlock);
        this._m_masterBlock = new MasterBlock(_io__raw__m_masterBlock, this, this._root);
        this._io.seek(_pos);
        return this._m_masterBlock;
      }
    });

    return MasterBlockRef;
  })();

  var Block = DsStore.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.mode = this._io.readU4be();
      this.counter = this._io.readU4be();
      this.data = [];
      for (var i = 0; i < this.counter; i++) {
        this.data.push(new BlockData(this._io, this, this._root, this.mode));
      }
    }

    var BlockData = Block.BlockData = (function() {
      function BlockData(_io, _parent, _root, mode) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.mode = mode;

        this._read();
      }
      BlockData.prototype._read = function() {
        if (this.mode > 0) {
          this.blockId = this._io.readU4be();
        }
        this.record = new Record(this._io, this, this._root);
      }

      var Record = BlockData.Record = (function() {
        function Record(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Record.prototype._read = function() {
          this.filename = new Ustr(this._io, this, this._root);
          this.structureType = new FourCharCode(this._io, this, this._root);
          this.dataType = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
          switch (this.dataType) {
          case "long":
            this.value = this._io.readU4be();
            break;
          case "shor":
            this.value = this._io.readU4be();
            break;
          case "comp":
            this.value = this._io.readU8be();
            break;
          case "bool":
            this.value = this._io.readU1();
            break;
          case "ustr":
            this.value = new Ustr(this._io, this, this._root);
            break;
          case "dutc":
            this.value = this._io.readU8be();
            break;
          case "type":
            this.value = new FourCharCode(this._io, this, this._root);
            break;
          case "blob":
            this.value = new RecordBlob(this._io, this, this._root);
            break;
          }
        }

        var RecordBlob = Record.RecordBlob = (function() {
          function RecordBlob(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          RecordBlob.prototype._read = function() {
            this.length = this._io.readU4be();
            this.value = this._io.readBytes(this.length);
          }

          return RecordBlob;
        })();

        var Ustr = Record.Ustr = (function() {
          function Ustr(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          Ustr.prototype._read = function() {
            this.length = this._io.readU4be();
            this.value = KaitaiStream.bytesToStr(this._io.readBytes((2 * this.length)), "UTF-16BE");
          }

          return Ustr;
        })();

        var FourCharCode = Record.FourCharCode = (function() {
          function FourCharCode(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root || this;

            this._read();
          }
          FourCharCode.prototype._read = function() {
            this.value = KaitaiStream.bytesToStr(this._io.readBytes(4), "UTF-8");
          }

          return FourCharCode;
        })();

        /**
         * Description of the entry's property.
         */

        /**
         * Data type of the value.
         */

        return Record;
      })();
      Object.defineProperty(BlockData.prototype, 'block', {
        get: function() {
          if (this._m_block !== undefined)
            return this._m_block;
          if (this.mode > 0) {
            var io = this._root._io;
            var _pos = io.pos;
            io.seek(this._root.buddyAllocatorBody.blockAddresses[this.blockId].offset);
            this._m_block = new Block(io, this, this._root);
            io.seek(_pos);
          }
          return this._m_block;
        }
      });

      return BlockData;
    })();

    /**
     * Rightmost child block pointer.
     */
    Object.defineProperty(Block.prototype, 'rightmostBlock', {
      get: function() {
        if (this._m_rightmostBlock !== undefined)
          return this._m_rightmostBlock;
        if (this.mode > 0) {
          var io = this._root._io;
          var _pos = io.pos;
          io.seek(this._root.buddyAllocatorBody.blockAddresses[this.mode].offset);
          this._m_rightmostBlock = new Block(io, this, this._root);
          io.seek(_pos);
        }
        return this._m_rightmostBlock;
      }
    });

    /**
     * If mode is 0, this is a leaf node, otherwise it is an internal node.
     */

    /**
     * Number of records or number of block id + record pairs.
     */

    return Block;
  })();
  Object.defineProperty(DsStore.prototype, 'buddyAllocatorBody', {
    get: function() {
      if (this._m_buddyAllocatorBody !== undefined)
        return this._m_buddyAllocatorBody;
      var _pos = this._io.pos;
      this._io.seek((this.buddyAllocatorHeader.ofsBookkeepingInfoBlock + 4));
      this._raw__m_buddyAllocatorBody = this._io.readBytes(this.buddyAllocatorHeader.lenBookkeepingInfoBlock);
      var _io__raw__m_buddyAllocatorBody = new KaitaiStream(this._raw__m_buddyAllocatorBody);
      this._m_buddyAllocatorBody = new BuddyAllocatorBody(_io__raw__m_buddyAllocatorBody, this, this._root);
      this._io.seek(_pos);
      return this._m_buddyAllocatorBody;
    }
  });

  /**
   * Bitmask used to calculate the position and the size of each block
   * of the B-tree from the block addresses.
   */
  Object.defineProperty(DsStore.prototype, 'blockAddressMask', {
    get: function() {
      if (this._m_blockAddressMask !== undefined)
        return this._m_blockAddressMask;
      this._m_blockAddressMask = 31;
      return this._m_blockAddressMask;
    }
  });

  return DsStore;
})();
return DsStore;
}));
