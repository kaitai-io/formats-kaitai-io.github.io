// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.HeapsPak = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Reader.hx|Source}
 */

var HeapsPak = (function() {
  function HeapsPak(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  HeapsPak.prototype._read = function() {
    this.header = new Header(this._io, this, this._root);
  }

  var Header = HeapsPak.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic1 = this._io.readBytes(3);
      if (!((KaitaiStream.byteArrayCompare(this.magic1, [80, 65, 75]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([80, 65, 75], this.magic1, this._io, "/types/header/seq/0");
      }
      this.version = this._io.readU1();
      this.lenHeader = this._io.readU4le();
      this.lenData = this._io.readU4le();
      this._raw_rootEntry = this._io.readBytes((this.lenHeader - 16));
      var _io__raw_rootEntry = new KaitaiStream(this._raw_rootEntry);
      this.rootEntry = new Entry(_io__raw_rootEntry, this, this._root);
      this.magic2 = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic2, [68, 65, 84, 65]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([68, 65, 84, 65], this.magic2, this._io, "/types/header/seq/5");
      }
    }

    /**
     * @see {@link https://github.com/HeapsIO/heaps/blob/2bbc2b386952dfd8856c04a854bb706a52cb4b58/hxd/fmt/pak/Data.hx|Source}
     */

    var Entry = Header.Entry = (function() {
      function Entry(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Entry.prototype._read = function() {
        this.lenName = this._io.readU1();
        this.name = KaitaiStream.bytesToStr(this._io.readBytes(this.lenName), "UTF-8");
        this.flags = new Flags(this._io, this, this._root);
        switch (this.flags.isDir) {
        case true:
          this.body = new Dir(this._io, this, this._root);
          break;
        case false:
          this.body = new File(this._io, this, this._root);
          break;
        }
      }

      var Flags = Entry.Flags = (function() {
        function Flags(_io, _parent, _root) {
          this._io = _io;
          this._parent = _parent;
          this._root = _root || this;

          this._read();
        }
        Flags.prototype._read = function() {
          this.unused = this._io.readBitsIntBe(7);
          this.isDir = this._io.readBitsIntBe(1) != 0;
        }

        return Flags;
      })();

      return Entry;
    })();

    var File = Header.File = (function() {
      function File(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      File.prototype._read = function() {
        this.ofsData = this._io.readU4le();
        this.lenData = this._io.readU4le();
        this.checksum = this._io.readBytes(4);
      }
      Object.defineProperty(File.prototype, 'data', {
        get: function() {
          if (this._m_data !== undefined)
            return this._m_data;
          var io = this._root._io;
          var _pos = io.pos;
          io.seek((this._root.header.lenHeader + this.ofsData));
          this._m_data = io.readBytes(this.lenData);
          io.seek(_pos);
          return this._m_data;
        }
      });

      return File;
    })();

    var Dir = Header.Dir = (function() {
      function Dir(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Dir.prototype._read = function() {
        this.numEntries = this._io.readU4le();
        this.entries = new Array(this.numEntries);
        for (var i = 0; i < this.numEntries; i++) {
          this.entries[i] = new Entry(this._io, this, this._root);
        }
      }

      return Dir;
    })();

    return Header;
  })();

  return HeapsPak;
})();
return HeapsPak;
}));
