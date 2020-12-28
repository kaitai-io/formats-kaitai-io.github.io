// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AsusTrx = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Header and a footer for stock firmwares used on some ASUS routers. trx files not necessarily contain these headers.
 * @see {@link https://github.com/openwrt/openwrt/blob/master/tools/firmware-utils/src/trx.c|Source}
 */

var AsusTrx = (function() {
  function AsusTrx(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AsusTrx.prototype._read = function() {
  }

  var Revision = AsusTrx.Revision = (function() {
    function Revision(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Revision.prototype._read = function() {
      this.major = this._io.readU1();
      this.minor = this._io.readU1();
    }

    return Revision;
  })();

  var Version = AsusTrx.Version = (function() {
    function Version(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Version.prototype._read = function() {
      this.major = this._io.readU1();
      this.minor = this._io.readU1();
      this.patch = this._io.readU1();
      this.tweak = this._io.readU1();
    }

    return Version;
  })();

  /**
   * A safeguard against installation of firmware to an incompatible device
   */

  var Tail = AsusTrx.Tail = (function() {
    function Tail(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Tail.prototype._read = function() {
      this.version = new Version(this._io, this, this._root);
      this.productId = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(12), 0, false), "utf-8");
      this.compHw = new Array(4);
      for (var i = 0; i < 4; i++) {
        this.compHw[i] = new HwCompInfo(this._io, this, this._root);
      }
      this.reserved = this._io.readBytes(32);
    }

    var HwCompInfo = Tail.HwCompInfo = (function() {
      function HwCompInfo(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      HwCompInfo.prototype._read = function() {
        this.min = new Revision(this._io, this, this._root);
        this.max = new Revision(this._io, this, this._root);
      }

      return HwCompInfo;
    })();

    /**
     * 1.9.2.7 by default
     */

    /**
     * 0.02 - 2.99
     */

    return Tail;
  })();

  var Header = AsusTrx.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.signature = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.signature, [72, 68, 82, 48]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([72, 68, 82, 48], this.signature, this._io, "/types/header/seq/0");
      }
      this.len = this._io.readU4le();
      this.crc32 = this._io.readU4le();
      this.version = this._io.readU2le();
      this.flags = new Flags(this._io, this, this._root);
      this.partitions = []
      var i = 0;
      do {
        var _ = new Partition(this._io, this, this._root, i);
        this.partitions.push(_);
        i++;
      } while (!( ((i >= 4) || (!(_.present))) ));
    }

    var Partition = Header.Partition = (function() {
      function Partition(_io, _parent, _root, idx) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;
        this.idx = idx;

        this._read();
      }
      Partition.prototype._read = function() {
        this.offset = this._io.readU4le();
      }
      Object.defineProperty(Partition.prototype, 'present', {
        get: function() {
          if (this._m_present !== undefined)
            return this._m_present;
          this._m_present = this.offset != 0;
          return this._m_present;
        }
      });
      Object.defineProperty(Partition.prototype, 'isLast', {
        get: function() {
          if (this._m_isLast !== undefined)
            return this._m_isLast;
          if (this.present) {
            this._m_isLast =  ((this.idx == (this._parent.partitions.length - 1)) || (!(this._parent.partitions[(this.idx + 1)].present))) ;
          }
          return this._m_isLast;
        }
      });
      Object.defineProperty(Partition.prototype, 'size', {
        get: function() {
          if (this._m_size !== undefined)
            return this._m_size;
          if (this.present) {
            this._m_size = (this.isLast ? (this._root._io.size - this.offset) : this._parent.partitions[(this.idx + 1)].offset);
          }
          return this._m_size;
        }
      });
      Object.defineProperty(Partition.prototype, 'partition', {
        get: function() {
          if (this._m_partition !== undefined)
            return this._m_partition;
          if (this.present) {
            var io = this._root._io;
            var _pos = io.pos;
            io.seek(this.offset);
            this._m_partition = io.readBytes(this.size);
            io.seek(_pos);
          }
          return this._m_partition;
        }
      });

      return Partition;
    })();

    var Flags = Header.Flags = (function() {
      function Flags(_io, _parent, _root) {
        this._io = _io;
        this._parent = _parent;
        this._root = _root || this;

        this._read();
      }
      Flags.prototype._read = function() {
        this.flags = new Array(16);
        for (var i = 0; i < 16; i++) {
          this.flags[i] = this._io.readBitsIntLe(1) != 0;
        }
      }

      return Flags;
    })();

    /**
     * Length of file including header
     */

    /**
     * CRC from `version` (??? todo: see the original and disambiguate) to end of file
     */

    /**
     * Offsets of partitions from start of header
     */

    return Header;
  })();
  Object.defineProperty(AsusTrx.prototype, 'header', {
    get: function() {
      if (this._m_header !== undefined)
        return this._m_header;
      var _pos = this._io.pos;
      this._io.seek(0);
      this._m_header = new Header(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_header;
    }
  });
  Object.defineProperty(AsusTrx.prototype, 'tail', {
    get: function() {
      if (this._m_tail !== undefined)
        return this._m_tail;
      var _pos = this._io.pos;
      this._io.seek((this._io.size - 64));
      this._m_tail = new Tail(this._io, this, this._root);
      this._io.seek(_pos);
      return this._m_tail;
    }
  });

  return AsusTrx;
})();
return AsusTrx;
}));
