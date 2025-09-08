// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.QuakeMdl || (root.QuakeMdl = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (QuakeMdl_, KaitaiStream) {
/**
 * Quake 1 model format is used to store 3D models completely with
 * textures and animations used in the game. Quake 1 engine
 * (retroactively named "idtech2") is a popular 3D engine first used
 * for Quake game by id Software in 1996.
 * 
 * Model is constructed traditionally from vertices in 3D space, faces
 * which connect vertices, textures ("skins", i.e. 2D bitmaps) and
 * texture UV mapping information. As opposed to more modern,
 * bones-based animation formats, Quake model was animated by changing
 * locations of all vertices it included in 3D space, frame by frame.
 * 
 * File format stores:
 * 
 * * "Skins" — effectively 2D bitmaps which will be used as a
 *   texture. Every model can have multiple skins — e.g. these can be
 *   switched to depict various levels of damage to the
 *   monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
 *   palette, subject to lighting and gamma adjustment when rendering
 *   in the game using colormap technique.
 * * "Texture coordinates" — UV coordinates, mapping 3D vertices to
 *   skin coordinates.
 * * "Triangles" — triangular faces connecting 3D vertices.
 * * "Frames" — locations of vertices in 3D space; can include more
 *   than one frame, thus allowing representation of different frames
 *   for animation purposes.
 * 
 * Originally, 3D geometry for models for Quake was designed in [Alias
 * PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
 * precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
 * 3D-related part of Quake model format followed closely Alias TRI
 * format, and Quake development utilities included a converter from Alias
 * TRI (`modelgen`).
 * 
 * Skins (textures) where prepared as LBM bitmaps with the help from
 * `texmap` utility in the same development utilities toolkit.
 */

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

  var MdlFrame = QuakeMdl.MdlFrame = (function() {
    function MdlFrame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

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

  /**
   * @see {@link https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75|Source}
   * @see {@link https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0|Source}
   */

  var MdlHeader = QuakeMdl.MdlHeader = (function() {
    function MdlHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MdlHeader.prototype._read = function() {
      this.ident = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.ident, new Uint8Array([73, 68, 80, 79])) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([73, 68, 80, 79]), this.ident, this._io, "/types/mdl_header/seq/0");
      }
      this.version = this._io.readS4le();
      if (!(this.version == 6)) {
        throw new KaitaiStream.ValidationNotEqualError(6, this.version, this._io, "/types/mdl_header/seq/1");
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

    /**
     * Skin size in pixels.
     */
    Object.defineProperty(MdlHeader.prototype, 'skinSize', {
      get: function() {
        if (this._m_skinSize !== undefined)
          return this._m_skinSize;
        this._m_skinSize = this.skinWidth * this.skinHeight;
        return this._m_skinSize;
      }
    });

    /**
     * Magic signature bytes that every Quake model must
     * have. "IDPO" is short for "IDPOLYHEADER".
     * @see {@link https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L132-L133|Source}
     */

    /**
     * Global scaling factors in 3 dimensions for whole model. When
     * represented in 3D world, this model local coordinates will
     * be multiplied by these factors.
     */

    /**
     * Number of skins (=texture bitmaps) included in this model.
     */

    /**
     * Width (U coordinate max) of every skin (=texture) in pixels.
     */

    /**
     * Height (V coordinate max) of every skin (=texture) in
     * pixels.
     */

    /**
     * Number of vertices in this model. Note that this is constant
     * for all the animation frames and all textures.
     */

    /**
     * Number of triangles (=triangular faces) in this model.
     */

    /**
     * Number of animation frames included in this model.
     */

    return MdlHeader;
  })();

  var MdlSimpleFrame = QuakeMdl.MdlSimpleFrame = (function() {
    function MdlSimpleFrame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

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

  var MdlSkin = QuakeMdl.MdlSkin = (function() {
    function MdlSkin(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

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

  /**
   * @see {@link https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83|Source}
   * @see {@link https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2|Source}
   */

  var MdlTexcoord = QuakeMdl.MdlTexcoord = (function() {
    function MdlTexcoord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    MdlTexcoord.prototype._read = function() {
      this.onSeam = this._io.readS4le();
      this.s = this._io.readS4le();
      this.t = this._io.readS4le();
    }

    return MdlTexcoord;
  })();

  /**
   * Represents a triangular face, connecting 3 vertices, referenced
   * by their indexes.
   * @see {@link https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88|Source}
   * @see {@link https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3|Source}
   */

  var MdlTriangle = QuakeMdl.MdlTriangle = (function() {
    function MdlTriangle(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

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

  var MdlVertex = QuakeMdl.MdlVertex = (function() {
    function MdlVertex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

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

  /**
   * Basic 3D vector (x, y, z) using single-precision floating point
   * coordnates. Can be used to specify a point in 3D space,
   * direction, scaling factor, etc.
   */

  var Vec3 = QuakeMdl.Vec3 = (function() {
    function Vec3(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

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
QuakeMdl_.QuakeMdl = QuakeMdl;
});
