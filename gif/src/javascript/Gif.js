// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

var Gif = (function() {
  Gif.BlockType = Object.freeze({
    EXTENSION: 33,
    LOCAL_IMAGE_DESCRIPTOR: 44,
    END_OF_FILE: 59,

    33: "EXTENSION",
    44: "LOCAL_IMAGE_DESCRIPTOR",
    59: "END_OF_FILE",
  });

  Gif.ExtensionLabel = Object.freeze({
    GRAPHIC_CONTROL: 249,
    COMMENT: 254,
    APPLICATION: 255,

    249: "GRAPHIC_CONTROL",
    254: "COMMENT",
    255: "APPLICATION",
  });

  function Gif(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Gif.prototype._read = function() {
    this.hdr = new Header(this._io, this, this._root);
    this.logicalScreenDescriptor = new LogicalScreenDescriptorStruct(this._io, this, this._root);
    if (this.logicalScreenDescriptor.hasColorTable) {
      this._raw_globalColorTable = this._io.readBytes((this.logicalScreenDescriptor.colorTableSize * 3));
      var _io__raw_globalColorTable = new KaitaiStream(this._raw_globalColorTable);
      this.globalColorTable = new ColorTable(_io__raw_globalColorTable, this, this._root);
    }
    this.blocks = [];
    while (!this._io.isEof()) {
      this.blocks.push(new Block(this._io, this, this._root));
    }
  }

  var ImageData = Gif.ImageData = (function() {
    function ImageData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ImageData.prototype._read = function() {
      this.lzwMinCodeSize = this._io.readU1();
      this.subblocks = new Subblocks(this._io, this, this._root);
    }

    return ImageData;
  })();

  var ColorTableEntry = Gif.ColorTableEntry = (function() {
    function ColorTableEntry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ColorTableEntry.prototype._read = function() {
      this.red = this._io.readU1();
      this.green = this._io.readU1();
      this.blue = this._io.readU1();
    }

    return ColorTableEntry;
  })();

  var LogicalScreenDescriptorStruct = Gif.LogicalScreenDescriptorStruct = (function() {
    function LogicalScreenDescriptorStruct(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LogicalScreenDescriptorStruct.prototype._read = function() {
      this.screenWidth = this._io.readU2le();
      this.screenHeight = this._io.readU2le();
      this.flags = this._io.readU1();
      this.bgColorIndex = this._io.readU1();
      this.pixelAspectRatio = this._io.readU1();
    }
    Object.defineProperty(LogicalScreenDescriptorStruct.prototype, 'hasColorTable', {
      get: function() {
        if (this._m_hasColorTable !== undefined)
          return this._m_hasColorTable;
        this._m_hasColorTable = (this.flags & 128) != 0;
        return this._m_hasColorTable;
      }
    });
    Object.defineProperty(LogicalScreenDescriptorStruct.prototype, 'colorTableSize', {
      get: function() {
        if (this._m_colorTableSize !== undefined)
          return this._m_colorTableSize;
        this._m_colorTableSize = (2 << (this.flags & 7));
        return this._m_colorTableSize;
      }
    });

    return LogicalScreenDescriptorStruct;
  })();

  var LocalImageDescriptor = Gif.LocalImageDescriptor = (function() {
    function LocalImageDescriptor(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    LocalImageDescriptor.prototype._read = function() {
      this.left = this._io.readU2le();
      this.top = this._io.readU2le();
      this.width = this._io.readU2le();
      this.height = this._io.readU2le();
      this.flags = this._io.readU1();
      if (this.hasColorTable) {
        this._raw_localColorTable = this._io.readBytes((this.colorTableSize * 3));
        var _io__raw_localColorTable = new KaitaiStream(this._raw_localColorTable);
        this.localColorTable = new ColorTable(_io__raw_localColorTable, this, this._root);
      }
      this.imageData = new ImageData(this._io, this, this._root);
    }
    Object.defineProperty(LocalImageDescriptor.prototype, 'hasColorTable', {
      get: function() {
        if (this._m_hasColorTable !== undefined)
          return this._m_hasColorTable;
        this._m_hasColorTable = (this.flags & 128) != 0;
        return this._m_hasColorTable;
      }
    });
    Object.defineProperty(LocalImageDescriptor.prototype, 'hasInterlace', {
      get: function() {
        if (this._m_hasInterlace !== undefined)
          return this._m_hasInterlace;
        this._m_hasInterlace = (this.flags & 64) != 0;
        return this._m_hasInterlace;
      }
    });
    Object.defineProperty(LocalImageDescriptor.prototype, 'hasSortedColorTable', {
      get: function() {
        if (this._m_hasSortedColorTable !== undefined)
          return this._m_hasSortedColorTable;
        this._m_hasSortedColorTable = (this.flags & 32) != 0;
        return this._m_hasSortedColorTable;
      }
    });
    Object.defineProperty(LocalImageDescriptor.prototype, 'colorTableSize', {
      get: function() {
        if (this._m_colorTableSize !== undefined)
          return this._m_colorTableSize;
        this._m_colorTableSize = (2 << (this.flags & 7));
        return this._m_colorTableSize;
      }
    });

    return LocalImageDescriptor;
  })();

  var Block = Gif.Block = (function() {
    function Block(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Block.prototype._read = function() {
      this.blockType = this._io.readU1();
      switch (this.blockType) {
      case Gif.BlockType.EXTENSION:
        this.body = new Extension(this._io, this, this._root);
        break;
      case Gif.BlockType.LOCAL_IMAGE_DESCRIPTOR:
        this.body = new LocalImageDescriptor(this._io, this, this._root);
        break;
      }
    }

    return Block;
  })();

  var ColorTable = Gif.ColorTable = (function() {
    function ColorTable(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ColorTable.prototype._read = function() {
      this.entries = [];
      while (!this._io.isEof()) {
        this.entries.push(new ColorTableEntry(this._io, this, this._root));
      }
    }

    return ColorTable;
  })();

  var Header = Gif.Header = (function() {
    function Header(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Header.prototype._read = function() {
      this.magic = this._io.ensureFixedContents([71, 73, 70]);
      this.version = KaitaiStream.bytesToStr(this._io.readBytes(3), "ASCII");
    }

    return Header;
  })();

  var ExtGraphicControl = Gif.ExtGraphicControl = (function() {
    function ExtGraphicControl(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExtGraphicControl.prototype._read = function() {
      this.blockSize = this._io.ensureFixedContents([4]);
      this.flags = this._io.readU1();
      this.delayTime = this._io.readU2le();
      this.transparentIdx = this._io.readU1();
      this.terminator = this._io.ensureFixedContents([0]);
    }
    Object.defineProperty(ExtGraphicControl.prototype, 'transparentColorFlag', {
      get: function() {
        if (this._m_transparentColorFlag !== undefined)
          return this._m_transparentColorFlag;
        this._m_transparentColorFlag = (this.flags & 1) != 0;
        return this._m_transparentColorFlag;
      }
    });
    Object.defineProperty(ExtGraphicControl.prototype, 'userInputFlag', {
      get: function() {
        if (this._m_userInputFlag !== undefined)
          return this._m_userInputFlag;
        this._m_userInputFlag = (this.flags & 2) != 0;
        return this._m_userInputFlag;
      }
    });

    return ExtGraphicControl;
  })();

  var Subblock = Gif.Subblock = (function() {
    function Subblock(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Subblock.prototype._read = function() {
      this.numBytes = this._io.readU1();
      this.bytes = this._io.readBytes(this.numBytes);
    }

    return Subblock;
  })();

  var ExtApplication = Gif.ExtApplication = (function() {
    function ExtApplication(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ExtApplication.prototype._read = function() {
      this.applicationId = new Subblock(this._io, this, this._root);
      this.subblocks = []
      do {
        var _ = new Subblock(this._io, this, this._root);
        this.subblocks.push(_);
      } while (!(_.numBytes == 0));
    }

    return ExtApplication;
  })();

  var Subblocks = Gif.Subblocks = (function() {
    function Subblocks(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Subblocks.prototype._read = function() {
      this.entries = []
      do {
        var _ = new Subblock(this._io, this, this._root);
        this.entries.push(_);
      } while (!(_.numBytes == 0));
    }

    return Subblocks;
  })();

  var Extension = Gif.Extension = (function() {
    function Extension(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Extension.prototype._read = function() {
      this.label = this._io.readU1();
      switch (this.label) {
      case Gif.ExtensionLabel.APPLICATION:
        this.body = new ExtApplication(this._io, this, this._root);
        break;
      case Gif.ExtensionLabel.COMMENT:
        this.body = new Subblocks(this._io, this, this._root);
        break;
      case Gif.ExtensionLabel.GRAPHIC_CONTROL:
        this.body = new ExtGraphicControl(this._io, this, this._root);
        break;
      default:
        this.body = new Subblocks(this._io, this, this._root);
        break;
      }
    }

    return Extension;
  })();

  return Gif;
})();

// Export for amd environments
if (typeof define === 'function' && define.amd) {
  define('Gif', [], function() {
    return Gif;
  });
}

// Export for CommonJS
if (typeof module === 'object' && module && module.exports) {
  module.exports = Gif;
}
