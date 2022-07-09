// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AndroidImg = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://source.android.com/devices/bootloader/boot-image-header|Source}
 */

var AndroidImg = (function() {
  function AndroidImg(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AndroidImg.prototype._read = function() {
    this.magic = this._io.readBytes(8);
    if (!((KaitaiStream.byteArrayCompare(this.magic, [65, 78, 68, 82, 79, 73, 68, 33]) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError([65, 78, 68, 82, 79, 73, 68, 33], this.magic, this._io, "/seq/0");
    }
    this.kernel = new Load(this._io, this, this._root);
    this.ramdisk = new Load(this._io, this, this._root);
    this.second = new Load(this._io, this, this._root);
    this.tagsLoad = this._io.readU4le();
    this.pageSize = this._io.readU4le();
    this.headerVersion = this._io.readU4le();
    this.osVersion = new OsVersion(this._io, this, this._root);
    this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(16), 0, false), "ASCII");
    this.cmdline = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(512), 0, false), "ASCII");
    this.sha = this._io.readBytes(32);
    this.extraCmdline = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(1024), 0, false), "ASCII");
    if (this.headerVersion > 0) {
      this.recoveryDtbo = new SizeOffset(this._io, this, this._root);
    }
    if (this.headerVersion > 0) {
      this.bootHeaderSize = this._io.readU4le();
    }
    if (this.headerVersion > 1) {
      this.dtb = new LoadLong(this._io, this, this._root);
    }
  }

  var Load = AndroidImg.Load = (function() {
    function Load(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Load.prototype._read = function() {
      this.size = this._io.readU4le();
      this.addr = this._io.readU4le();
    }

    return Load;
  })();

  var LoadLong = AndroidImg.LoadLong = (function() {
    function LoadLong(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LoadLong.prototype._read = function() {
      this.size = this._io.readU4le();
      this.addr = this._io.readU8le();
    }

    return LoadLong;
  })();

  var SizeOffset = AndroidImg.SizeOffset = (function() {
    function SizeOffset(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SizeOffset.prototype._read = function() {
      this.size = this._io.readU4le();
      this.offset = this._io.readU8le();
    }

    return SizeOffset;
  })();

  var OsVersion = AndroidImg.OsVersion = (function() {
    function OsVersion(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    OsVersion.prototype._read = function() {
      this.version = this._io.readU4le();
    }
    Object.defineProperty(OsVersion.prototype, 'month', {
      get: function() {
        if (this._m_month !== undefined)
          return this._m_month;
        this._m_month = (this.version & 15);
        return this._m_month;
      }
    });
    Object.defineProperty(OsVersion.prototype, 'patch', {
      get: function() {
        if (this._m_patch !== undefined)
          return this._m_patch;
        this._m_patch = ((this.version >>> 11) & 127);
        return this._m_patch;
      }
    });
    Object.defineProperty(OsVersion.prototype, 'year', {
      get: function() {
        if (this._m_year !== undefined)
          return this._m_year;
        this._m_year = (((this.version >>> 4) & 127) + 2000);
        return this._m_year;
      }
    });
    Object.defineProperty(OsVersion.prototype, 'major', {
      get: function() {
        if (this._m_major !== undefined)
          return this._m_major;
        this._m_major = ((this.version >>> 25) & 127);
        return this._m_major;
      }
    });
    Object.defineProperty(OsVersion.prototype, 'minor', {
      get: function() {
        if (this._m_minor !== undefined)
          return this._m_minor;
        this._m_minor = ((this.version >>> 18) & 127);
        return this._m_minor;
      }
    });

    return OsVersion;
  })();
  Object.defineProperty(AndroidImg.prototype, 'kernelImg', {
    get: function() {
      if (this._m_kernelImg !== undefined)
        return this._m_kernelImg;
      var _pos = this._io.pos;
      this._io.seek(this.pageSize);
      this._m_kernelImg = this._io.readBytes(this.kernel.size);
      this._io.seek(_pos);
      return this._m_kernelImg;
    }
  });

  /**
   * tags offset from base
   */
  Object.defineProperty(AndroidImg.prototype, 'tagsOffset', {
    get: function() {
      if (this._m_tagsOffset !== undefined)
        return this._m_tagsOffset;
      this._m_tagsOffset = (this.tagsLoad - this.base);
      return this._m_tagsOffset;
    }
  });

  /**
   * ramdisk offset from base
   */
  Object.defineProperty(AndroidImg.prototype, 'ramdiskOffset', {
    get: function() {
      if (this._m_ramdiskOffset !== undefined)
        return this._m_ramdiskOffset;
      this._m_ramdiskOffset = (this.ramdisk.addr > 0 ? (this.ramdisk.addr - this.base) : 0);
      return this._m_ramdiskOffset;
    }
  });

  /**
   * 2nd bootloader offset from base
   */
  Object.defineProperty(AndroidImg.prototype, 'secondOffset', {
    get: function() {
      if (this._m_secondOffset !== undefined)
        return this._m_secondOffset;
      this._m_secondOffset = (this.second.addr > 0 ? (this.second.addr - this.base) : 0);
      return this._m_secondOffset;
    }
  });

  /**
   * kernel offset from base
   */
  Object.defineProperty(AndroidImg.prototype, 'kernelOffset', {
    get: function() {
      if (this._m_kernelOffset !== undefined)
        return this._m_kernelOffset;
      this._m_kernelOffset = (this.kernel.addr - this.base);
      return this._m_kernelOffset;
    }
  });

  /**
   * dtb offset from base
   */
  Object.defineProperty(AndroidImg.prototype, 'dtbOffset', {
    get: function() {
      if (this._m_dtbOffset !== undefined)
        return this._m_dtbOffset;
      if (this.headerVersion > 1) {
        this._m_dtbOffset = (this.dtb.addr > 0 ? (this.dtb.addr - this.base) : 0);
      }
      return this._m_dtbOffset;
    }
  });
  Object.defineProperty(AndroidImg.prototype, 'dtbImg', {
    get: function() {
      if (this._m_dtbImg !== undefined)
        return this._m_dtbImg;
      if ( ((this.headerVersion > 1) && (this.dtb.size > 0)) ) {
        var _pos = this._io.pos;
        this._io.seek((Math.floor(((((((this.pageSize + this.kernel.size) + this.ramdisk.size) + this.second.size) + this.recoveryDtbo.size) + this.pageSize) - 1) / this.pageSize) * this.pageSize));
        this._m_dtbImg = this._io.readBytes(this.dtb.size);
        this._io.seek(_pos);
      }
      return this._m_dtbImg;
    }
  });
  Object.defineProperty(AndroidImg.prototype, 'ramdiskImg', {
    get: function() {
      if (this._m_ramdiskImg !== undefined)
        return this._m_ramdiskImg;
      if (this.ramdisk.size > 0) {
        var _pos = this._io.pos;
        this._io.seek((Math.floor((((this.pageSize + this.kernel.size) + this.pageSize) - 1) / this.pageSize) * this.pageSize));
        this._m_ramdiskImg = this._io.readBytes(this.ramdisk.size);
        this._io.seek(_pos);
      }
      return this._m_ramdiskImg;
    }
  });
  Object.defineProperty(AndroidImg.prototype, 'recoveryDtboImg', {
    get: function() {
      if (this._m_recoveryDtboImg !== undefined)
        return this._m_recoveryDtboImg;
      if ( ((this.headerVersion > 0) && (this.recoveryDtbo.size > 0)) ) {
        var _pos = this._io.pos;
        this._io.seek(this.recoveryDtbo.offset);
        this._m_recoveryDtboImg = this._io.readBytes(this.recoveryDtbo.size);
        this._io.seek(_pos);
      }
      return this._m_recoveryDtboImg;
    }
  });
  Object.defineProperty(AndroidImg.prototype, 'secondImg', {
    get: function() {
      if (this._m_secondImg !== undefined)
        return this._m_secondImg;
      if (this.second.size > 0) {
        var _pos = this._io.pos;
        this._io.seek((Math.floor(((((this.pageSize + this.kernel.size) + this.ramdisk.size) + this.pageSize) - 1) / this.pageSize) * this.pageSize));
        this._m_secondImg = this._io.readBytes(this.second.size);
        this._io.seek(_pos);
      }
      return this._m_secondImg;
    }
  });

  /**
   * base loading address
   */
  Object.defineProperty(AndroidImg.prototype, 'base', {
    get: function() {
      if (this._m_base !== undefined)
        return this._m_base;
      this._m_base = (this.kernel.addr - 32768);
      return this._m_base;
    }
  });

  return AndroidImg;
})();
return AndroidImg;
}));
