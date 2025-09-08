// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Tsm || (root.Tsm = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Tsm_, KaitaiStream) {
/**
 * InfluxDB is a scalable database optimized for storage of time
 * series, real-time application metrics, operations monitoring events,
 * etc, written in Go.
 * 
 * Data is stored in .tsm files, which are kept pretty simple
 * conceptually. Each .tsm file contains a header and footer, which
 * stores offset to an index. Index is used to find a data block for a
 * requested time boundary.
 */

var Tsm = (function() {
  function Tsm(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Tsm.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
  }

  var Header = Tsm.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([22, 209, 22, 209])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([22, 209, 22, 209]), this.magic, this._io, "/types/header/seq/0");
      }
      this.version = this._io.readU1();
    }

    return Header;
  })();

  var Index = Tsm.Index = (function() {
    function Index(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Index.prototype._read = function() {
      this.offset = this._io.readU8be();
    }

    var IndexHeader = Index.IndexHeader = (function() {
      function IndexHeader(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root;

        this._read();
      }
      IndexHeader.prototype._read = function() {
        this.keyLen = this._io.readU2be();
        this.key = KaitaiStream.bytesToStr(this._io.readBytes(this.keyLen), "UTF-8");
        this.type = this._io.readU1();
        this.entryCount = this._io.readU2be();
        this.indexEntries = [];
        for (var i = 0; i < this.entryCount; i++) {
          this.indexEntries.push(new IndexEntry(this._io, this, this._root));
        }
      }

      var IndexEntry = IndexHeader.IndexEntry = (function() {
        function IndexEntry(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root;

          this._read();
        }
        IndexEntry.prototype._read = function() {
          this.minTime = this._io.readU8be();
          this.maxTime = this._io.readU8be();
          this.blockOffset = this._io.readU8be();
          this.blockSize = this._io.readU4be();
        }

        var BlockEntry = IndexEntry.BlockEntry = (function() {
          function BlockEntry(_io, _parent, _root) {
            this._io = _io;
            this._parent = _parent;
            this._root = _root;

            this._read();
          }
          BlockEntry.prototype._read = function() {
            this.crc32 = this._io.readU4be();
            this.data = this._io.readBytes(this._parent.blockSize - 4);
          }

          return BlockEntry;
        })();
        Object.defineProperty(IndexEntry.prototype, 'block', {
          get: function() {
            if (this._m_block !== undefined)
              return this._m_block;
            var io = this._root._io;
            var _pos = io.pos;
            io.seek(this.blockOffset);
            this._m_block = new BlockEntry(io, this, this._root);
            io.seek(_pos);
            return this._m_block;
          }
        });

        return IndexEntry;
      })();

      return IndexHeader;
    })();
    Object.defineProperty(Index.prototype, 'entries', {
      get: function() {
        if (this._m_entries !== undefined)
          return this._m_entries;
        var _pos = this._io.pos;
        this._io.seek(this.offset);
        this._m_entries = [];
        var i = 0;
        do {
          var _ = new IndexHeader(this._io, this, this._root);
          this._m_entries.push(_);
          i++;
        } while (!(this._io.pos == this._io.size - 8));
        this._io.seek(_pos);
        return this._m_entries;
      }
    });

    return Index;
  })();
  Object.defineProperty(Tsm.prototype, 'index', {
    get: function() {
      if (this._m_index !== undefined)
        return this._m_index;
      var _pos = this._io.pos;
      this._io.seek(this._io.size - 8);
      this._m_index = new Index(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_index;
    }
  });

  return Tsm;
})();
Tsm_.Tsm = Tsm;
});
