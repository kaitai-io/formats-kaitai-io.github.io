// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.BroadcomTrx = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * .trx file format is widely used for distribution of firmware
 * updates for Broadcom devices. The most well-known are ASUS routers.
 * 
 * Fundamentally, it includes a footer which acts as a safeguard
 * against installing a firmware package on a wrong hardware model or
 * version, and a header which list numerous partitions packaged inside
 * a single .trx file.
 * 
 * trx files not necessarily contain all these headers.
 * @see {@link https://github.com/openwrt/openwrt/blob/3f5619f/tools/firmware-utils/src/trx.c|Source}
 * @see {@link https://web.archive.org/web/20190127154419/https://openwrt.org/docs/techref/header|Source}
 * @see {@link https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/mtd/partitions/brcm,trx.txt|Source}
 */

var BroadcomTrx = (function() {
  function BroadcomTrx(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  BroadcomTrx.prototype._read = function() {
  }

  var Revision = BroadcomTrx.Revision = (function() {
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

  var Version = BroadcomTrx.Version = (function() {
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

  var Tail = BroadcomTrx.Tail = (function() {
    function Tail(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Tail.prototype._read = function() {
      this.version = new Version(this._io, this, this._root);
      this.productId = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(12), 0, false), "utf-8");
      this.compHw = [];
      for (var i = 0; i < 4; i++) {
        this.compHw.push(new HwCompInfo(this._io, this, this._root));
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

  var Header = BroadcomTrx.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.magic, [72, 68, 82, 48]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([72, 68, 82, 48], this.magic, this._io, "/types/header/seq/0");
      }
      this.len = this._io.readU4le();
      this.crc32 = this._io.readU4le();
      this.version = this._io.readU2le();
      this.flags = new Flags(this._io, this, this._root);
      this.partitions = [];
      var i = 0;
      do {
        var _ = new Partition(this._io, this, this._root, i);
        this.partitions.push(_);
        i++;
      } while (!( ((i >= 4) || (!(_.isPresent))) ));
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
        this.ofsBody = this._io.readU4le();
      }
      Object.defineProperty(Partition.prototype, 'isPresent', {
        get: function() {
          if (this._m_isPresent !== undefined)
            return this._m_isPresent;
          this._m_isPresent = this.ofsBody != 0;
          return this._m_isPresent;
        }
      });
      Object.defineProperty(Partition.prototype, 'isLast', {
        get: function() {
          if (this._m_isLast !== undefined)
            return this._m_isLast;
          if (this.isPresent) {
            this._m_isLast =  ((this.idx == (this._parent.partitions.length - 1)) || (!(this._parent.partitions[(this.idx + 1)].isPresent))) ;
          }
          return this._m_isLast;
        }
      });
      Object.defineProperty(Partition.prototype, 'lenBody', {
        get: function() {
          if (this._m_lenBody !== undefined)
            return this._m_lenBody;
          if (this.isPresent) {
            this._m_lenBody = (this.isLast ? (this._root._io.size - this.ofsBody) : this._parent.partitions[(this.idx + 1)].ofsBody);
          }
          return this._m_lenBody;
        }
      });
      Object.defineProperty(Partition.prototype, 'body', {
        get: function() {
          if (this._m_body !== undefined)
            return this._m_body;
          if (this.isPresent) {
            var io = this._root._io;
            var _pos = io.pos;
            io.seek(this.ofsBody);
            this._m_body = io.readBytes(this.lenBody);
            io.seek(_pos);
          }
          return this._m_body;
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
        this.flags = [];
        for (var i = 0; i < 16; i++) {
          this.flags.push(this._io.readBitsIntLe(1) != 0);
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
  Object.defineProperty(BroadcomTrx.prototype, 'header', {
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
  Object.defineProperty(BroadcomTrx.prototype, 'tail', {
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

  return BroadcomTrx;
})();
return BroadcomTrx;
}));
