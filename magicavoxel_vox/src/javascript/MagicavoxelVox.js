// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.MagicavoxelVox = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * @see {@link https://github.com/ephtracy/voxel-model/blob/master/MagicaVoxel-file-format-vox.txt|Format Description}
 */

var MagicavoxelVox = (function() {
  MagicavoxelVox.ChunkType = Object.freeze({
    MAIN: 1296124238,
    MATT: 1296127060,
    PACK: 1346454347,
    RGBA: 1380401729,
    SIZE: 1397316165,
    XYZI: 1482250825,

    1296124238: "MAIN",
    1296127060: "MATT",
    1346454347: "PACK",
    1380401729: "RGBA",
    1397316165: "SIZE",
    1482250825: "XYZI",
  });

  MagicavoxelVox.MaterialType = Object.freeze({
    DIFFUSE: 0,
    METAL: 1,
    GLASS: 2,
    EMISSIVE: 3,

    0: "DIFFUSE",
    1: "METAL",
    2: "GLASS",
    3: "EMISSIVE",
  });

  MagicavoxelVox.PropertyBitsType = Object.freeze({
    PLASTIC: 1,
    ROUGHNESS: 2,
    SPECULAR: 4,
    IOR: 8,
    ATTENUATION: 16,
    POWER: 32,
    GLOW: 64,
    IS_TOTAL_POWER: 128,

    1: "PLASTIC",
    2: "ROUGHNESS",
    4: "SPECULAR",
    8: "IOR",
    16: "ATTENUATION",
    32: "POWER",
    64: "GLOW",
    128: "IS_TOTAL_POWER",
  });

  function MagicavoxelVox(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  MagicavoxelVox.prototype._read = function() {
    this.magic = this._io.ensureFixedContents([86, 79, 88, 32]);
    this.version = this._io.readU4le();
    this.main = new Chunk(this._io, this, this._root);
  }

  var Chunk = MagicavoxelVox.Chunk = (function() {
    function Chunk(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Chunk.prototype._read = function() {
      this.chunkId = this._io.readU4be();
      this.numBytesOfChunkContent = this._io.readU4le();
      this.numBytesOfChildrenChunks = this._io.readU4le();
      if (this.numBytesOfChunkContent != 0) {
        switch (this.chunkId) {
        case MagicavoxelVox.ChunkType.SIZE:
          this._raw_chunkContent = this._io.readBytes(this.numBytesOfChunkContent);
          var _io__raw_chunkContent = new KaitaiStream(this._raw_chunkContent);
          this.chunkContent = new Size(_io__raw_chunkContent, this, this._root);
          break;
        case MagicavoxelVox.ChunkType.MATT:
          this._raw_chunkContent = this._io.readBytes(this.numBytesOfChunkContent);
          var _io__raw_chunkContent = new KaitaiStream(this._raw_chunkContent);
          this.chunkContent = new Matt(_io__raw_chunkContent, this, this._root);
          break;
        case MagicavoxelVox.ChunkType.XYZI:
          this._raw_chunkContent = this._io.readBytes(this.numBytesOfChunkContent);
          var _io__raw_chunkContent = new KaitaiStream(this._raw_chunkContent);
          this.chunkContent = new Xyzi(_io__raw_chunkContent, this, this._root);
          break;
        case MagicavoxelVox.ChunkType.PACK:
          this._raw_chunkContent = this._io.readBytes(this.numBytesOfChunkContent);
          var _io__raw_chunkContent = new KaitaiStream(this._raw_chunkContent);
          this.chunkContent = new Pack(_io__raw_chunkContent, this, this._root);
          break;
        case MagicavoxelVox.ChunkType.RGBA:
          this._raw_chunkContent = this._io.readBytes(this.numBytesOfChunkContent);
          var _io__raw_chunkContent = new KaitaiStream(this._raw_chunkContent);
          this.chunkContent = new Rgba(_io__raw_chunkContent, this, this._root);
          break;
        default:
          this.chunkContent = this._io.readBytes(this.numBytesOfChunkContent);
          break;
        }
      }
      if (this.numBytesOfChildrenChunks != 0) {
        this.childrenChunks = [];
        var i = 0;
        while (!this._io.isEof()) {
          this.childrenChunks.push(new Chunk(this._io, this, this._root));
          i++;
        }
      }
    }

    return Chunk;
  })();

  var Size = MagicavoxelVox.Size = (function() {
    function Size(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Size.prototype._read = function() {
      this.sizeX = this._io.readU4le();
      this.sizeY = this._io.readU4le();
      this.sizeZ = this._io.readU4le();
    }

    return Size;
  })();

  var Rgba = MagicavoxelVox.Rgba = (function() {
    function Rgba(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Rgba.prototype._read = function() {
      this.colors = new Array(256);
      for (var i = 0; i < 256; i++) {
        this.colors[i] = new Color(this._io, this, this._root);
      }
    }

    return Rgba;
  })();

  var Pack = MagicavoxelVox.Pack = (function() {
    function Pack(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Pack.prototype._read = function() {
      this.numModels = this._io.readU4le();
    }

    return Pack;
  })();

  var Matt = MagicavoxelVox.Matt = (function() {
    function Matt(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Matt.prototype._read = function() {
      this.id = this._io.readU4le();
      this.materialType = this._io.readU4le();
      this.materialWeight = this._io.readF4le();
      this.propertyBits = this._io.readU4le();
      if (this.hasPlastic) {
        this.plastic = this._io.readF4le();
      }
      if (this.hasRoughness) {
        this.roughness = this._io.readF4le();
      }
      if (this.hasSpecular) {
        this.specular = this._io.readF4le();
      }
      if (this.hasIor) {
        this.ior = this._io.readF4le();
      }
      if (this.hasAttenuation) {
        this.attenuation = this._io.readF4le();
      }
      if (this.hasPower) {
        this.power = this._io.readF4le();
      }
      if (this.hasGlow) {
        this.glow = this._io.readF4le();
      }
      if (this.hasIsTotalPower) {
        this.isTotalPower = this._io.readF4le();
      }
    }
    Object.defineProperty(Matt.prototype, 'hasIsTotalPower', {
      get: function() {
        if (this._m_hasIsTotalPower !== undefined)
          return this._m_hasIsTotalPower;
        this._m_hasIsTotalPower = (this.propertyBits & 128) != 0;
        return this._m_hasIsTotalPower;
      }
    });
    Object.defineProperty(Matt.prototype, 'hasPlastic', {
      get: function() {
        if (this._m_hasPlastic !== undefined)
          return this._m_hasPlastic;
        this._m_hasPlastic = (this.propertyBits & 1) != 0;
        return this._m_hasPlastic;
      }
    });
    Object.defineProperty(Matt.prototype, 'hasAttenuation', {
      get: function() {
        if (this._m_hasAttenuation !== undefined)
          return this._m_hasAttenuation;
        this._m_hasAttenuation = (this.propertyBits & 16) != 0;
        return this._m_hasAttenuation;
      }
    });
    Object.defineProperty(Matt.prototype, 'hasPower', {
      get: function() {
        if (this._m_hasPower !== undefined)
          return this._m_hasPower;
        this._m_hasPower = (this.propertyBits & 32) != 0;
        return this._m_hasPower;
      }
    });
    Object.defineProperty(Matt.prototype, 'hasRoughness', {
      get: function() {
        if (this._m_hasRoughness !== undefined)
          return this._m_hasRoughness;
        this._m_hasRoughness = (this.propertyBits & 2) != 0;
        return this._m_hasRoughness;
      }
    });
    Object.defineProperty(Matt.prototype, 'hasSpecular', {
      get: function() {
        if (this._m_hasSpecular !== undefined)
          return this._m_hasSpecular;
        this._m_hasSpecular = (this.propertyBits & 4) != 0;
        return this._m_hasSpecular;
      }
    });
    Object.defineProperty(Matt.prototype, 'hasIor', {
      get: function() {
        if (this._m_hasIor !== undefined)
          return this._m_hasIor;
        this._m_hasIor = (this.propertyBits & 8) != 0;
        return this._m_hasIor;
      }
    });
    Object.defineProperty(Matt.prototype, 'hasGlow', {
      get: function() {
        if (this._m_hasGlow !== undefined)
          return this._m_hasGlow;
        this._m_hasGlow = (this.propertyBits & 64) != 0;
        return this._m_hasGlow;
      }
    });

    return Matt;
  })();

  var Xyzi = MagicavoxelVox.Xyzi = (function() {
    function Xyzi(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Xyzi.prototype._read = function() {
      this.numVoxels = this._io.readU4le();
      this.voxels = new Array(this.numVoxels);
      for (var i = 0; i < this.numVoxels; i++) {
        this.voxels[i] = new Voxel(this._io, this, this._root);
      }
    }

    return Xyzi;
  })();

  var Color = MagicavoxelVox.Color = (function() {
    function Color(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Color.prototype._read = function() {
      this.r = this._io.readU1();
      this.g = this._io.readU1();
      this.b = this._io.readU1();
      this.a = this._io.readU1();
    }

    return Color;
  })();

  var Voxel = MagicavoxelVox.Voxel = (function() {
    function Voxel(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Voxel.prototype._read = function() {
      this.x = this._io.readU1();
      this.y = this._io.readU1();
      this.z = this._io.readU1();
      this.colorIndex = this._io.readU1();
    }

    return Voxel;
  })();

  /**
   * 150 expected
   */

  return MagicavoxelVox;
})();
return MagicavoxelVox;
}));
