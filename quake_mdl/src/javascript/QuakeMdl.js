// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.QuakeMdl = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
var QuakeMdl = (function() {
  function QuakeMdl(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  QuakeMdl.prototype._read = function() {
    this.header = new MdlHeader(this._io, this, this._root);
    this.skins = [];
    for (var i = 0; i < this.header.numSkins; i++) {
      this.skins.push(new MdlSkin(this._io, this, this._root));
    }
    this.textureCoordinates = [];
    for (var i = 0; i < this.header.numVerts; i++) {
      this.textureCoordinates.push(new MdlTexcoord(this._io, this, this._root));
    }
    this.triangles = [];
    for (var i = 0; i < this.header.numTris; i++) {
      this.triangles.push(new MdlTriangle(this._io, this, this._root));
    }
    this.frames = [];
    for (var i = 0; i < this.header.numFrames; i++) {
      this.frames.push(new MdlFrame(this._io, this, this._root));
    }
  }

  var MdlVertex = QuakeMdl.MdlVertex = (function() {
    function MdlVertex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MdlVertex.prototype._read = function() {
      this.values = [];
      for (var i = 0; i < 3; i++) {
        this.values.push(this._io.readU1());
      }
      this.normalIndex = this._io.readU1();
    }

    return MdlVertex;
  })();

  var MdlTexcoord = QuakeMdl.MdlTexcoord = (function() {
    function MdlTexcoord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MdlTexcoord.prototype._read = function() {
      this.onSeam = this._io.readS4le();
      this.s = this._io.readS4le();
      this.t = this._io.readS4le();
    }

    return MdlTexcoord;
  })();

  var MdlHeader = QuakeMdl.MdlHeader = (function() {
    function MdlHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MdlHeader.prototype._read = function() {
      this.ident = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.ident, [73, 68, 80, 79]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([73, 68, 80, 79], this.ident, this._io, "/types/mdl_header/seq/0");
      }
      this.versionMustBe6 = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.versionMustBe6, [6, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([6, 0, 0, 0], this.versionMustBe6, this._io, "/types/mdl_header/seq/1");
      }
      this.scale = new Vec3(this._io, this, this._root);
      this.origin = new Vec3(this._io, this, this._root);
      this.radius = this._io.readF4le();
      this.eyePosition = new Vec3(this._io, this, this._root);
      this.numSkins = this._io.readS4le();
      this.skinWidth = this._io.readS4le();
      this.skinHeight = this._io.readS4le();
      this.numVerts = this._io.readS4le();
      this.numTris = this._io.readS4le();
      this.numFrames = this._io.readS4le();
      this.synctype = this._io.readS4le();
      this.flags = this._io.readS4le();
      this.size = this._io.readF4le();
    }
    Object.defineProperty(MdlHeader.prototype, 'version', {
      get: function() {
        if (this._m_version !== undefined)
          return this._m_version;
        this._m_version = 6;
        return this._m_version;
      }
    });
    Object.defineProperty(MdlHeader.prototype, 'skinSize', {
      get: function() {
        if (this._m_skinSize !== undefined)
          return this._m_skinSize;
        this._m_skinSize = (this.skinWidth * this.skinHeight);
        return this._m_skinSize;
      }
    });

    return MdlHeader;
  })();

  var MdlSkin = QuakeMdl.MdlSkin = (function() {
    function MdlSkin(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MdlSkin.prototype._read = function() {
      this.group = this._io.readS4le();
      if (this.group == 0) {
        this.singleTextureData = this._io.readBytes(this._root.header.skinSize);
      }
      if (this.group != 0) {
        this.numFrames = this._io.readU4le();
      }
      if (this.group != 0) {
        this.frameTimes = [];
        for (var i = 0; i < this.numFrames; i++) {
          this.frameTimes.push(this._io.readF4le());
        }
      }
      if (this.group != 0) {
        this.groupTextureData = [];
        for (var i = 0; i < this.numFrames; i++) {
          this.groupTextureData.push(this._io.readBytes(this._root.header.skinSize));
        }
      }
    }

    return MdlSkin;
  })();

  var MdlFrame = QuakeMdl.MdlFrame = (function() {
    function MdlFrame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MdlFrame.prototype._read = function() {
      this.type = this._io.readS4le();
      if (this.type != 0) {
        this.min = new MdlVertex(this._io, this, this._root);
      }
      if (this.type != 0) {
        this.max = new MdlVertex(this._io, this, this._root);
      }
      if (this.type != 0) {
        this.time = [];
        for (var i = 0; i < this.type; i++) {
          this.time.push(this._io.readF4le());
        }
      }
      this.frames = [];
      for (var i = 0; i < this.numSimpleFrames; i++) {
        this.frames.push(new MdlSimpleFrame(this._io, this, this._root));
      }
    }
    Object.defineProperty(MdlFrame.prototype, 'numSimpleFrames', {
      get: function() {
        if (this._m_numSimpleFrames !== undefined)
          return this._m_numSimpleFrames;
        this._m_numSimpleFrames = (this.type == 0 ? 1 : this.type);
        return this._m_numSimpleFrames;
      }
    });

    return MdlFrame;
  })();

  var MdlSimpleFrame = QuakeMdl.MdlSimpleFrame = (function() {
    function MdlSimpleFrame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MdlSimpleFrame.prototype._read = function() {
      this.bboxMin = new MdlVertex(this._io, this, this._root);
      this.bboxMax = new MdlVertex(this._io, this, this._root);
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(KaitaiStream.bytesStripRight(this._io.readBytes(16), 0), 0, false), "ASCII");
      this.vertices = [];
      for (var i = 0; i < this._root.header.numVerts; i++) {
        this.vertices.push(new MdlVertex(this._io, this, this._root));
      }
    }

    return MdlSimpleFrame;
  })();

  var MdlTriangle = QuakeMdl.MdlTriangle = (function() {
    function MdlTriangle(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MdlTriangle.prototype._read = function() {
      this.facesFront = this._io.readS4le();
      this.vertices = [];
      for (var i = 0; i < 3; i++) {
        this.vertices.push(this._io.readS4le());
      }
    }

    return MdlTriangle;
  })();

  var Vec3 = QuakeMdl.Vec3 = (function() {
    function Vec3(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Vec3.prototype._read = function() {
      this.x = this._io.readF4le();
      this.y = this._io.readF4le();
      this.z = this._io.readF4le();
    }

    return Vec3;
  })();

  return QuakeMdl;
})();
return QuakeMdl;
}));
