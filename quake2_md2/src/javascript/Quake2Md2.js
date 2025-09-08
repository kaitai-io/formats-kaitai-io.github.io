// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['exports', 'kaitai-struct/KaitaiStream'], factory);
  } else if (typeof exports === 'object' && exports !== null && typeof exports.nodeType !== 'number') {
    factory(exports, require('kaitai-struct/KaitaiStream'));
  } else {
    factory(root.Quake2Md2 || (root.Quake2Md2 = {}), root.KaitaiStream);
  }
})(typeof self !== 'undefined' ? self : this, function (Quake2Md2_, KaitaiStream) {
/**
 * The MD2 format is used for 3D animated models in id Sofware's Quake II.
 * 
 * A model consists of named `frames`, each with the same number of `vertices`
 * (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
 * model space. Each vertex has the same topological "meaning" across frames, in
 * terms of triangle and texture info; it just varies in position and normal for
 * animation purposes.
 * 
 * How the vertices form triangles is defined via disjoint `triangles` or via
 * `gl_cmds` (which allows strip and fan topology). Each triangle contains three
 * `vertex_indices` into frame vertices, and three `tex_point_indices` into
 * global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
 * ranging from 0 to `skin_{width,height}_px` respectively, along with
 * `{s,t}_normalized` ranging from 0 to 1 for your convenience.
 * 
 * A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
 * with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
 * to 1, and a `vertex_index` into frame vertices.
 * 
 * A model may also contain `skins`, which are just file paths to PCX images.
 * However, this is empty for many models, in which case it is up to the client
 * (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
 * current directory).
 * 
 * There are 198 `frames` in total, partitioned into a fixed set of ranges used
 * for different animations. Each frame has a standard `name` for humans, but the
 * client just uses their index and the name can be arbitrary. The name, start
 * frame index and frame count of each animation can be looked up in the arrays
 * `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
 * information is summarized in the following table:
 * 
 * ```
 * |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
 * |:--------:|--------:|:-------|:-------------------------------------------------------|
 * |    0-39  |   stand | 01-40  | Idle animation                                         |
 * |   40-45  |     run | 1-6    | Full run cycle                                         |
 * |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
 * |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
 * |   58-61  |   pain2 | 01-04  |                                                        |
 * |   62-65  |   pain3 | 01-04  |                                                        |
 * |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
 * |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
 * |   84-94  |  salute | 01-11  |                                                        |
 * |   95-111 |   taunt | 01-17  |                                                        |
 * |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
 * |  123-134 |   point | 01-12  |                                                        |
 * |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
 * |  154-159 |  crwalk | 1-6    |                                                        |
 * |  160-168 | crattak | 1-9    |                                                        |
 * |  169-172 |  crpain | 1-4    |                                                        |
 * |  173-177 | crdeath | 1-5    |                                                        |
 * |  178-183 |  death1 | 01-06  |                                                        |
 * |  184-189 |  death2 | 01-06  |                                                        |
 * |  190-197 |  death3 | 01-08  |                                                        |
 * ```
 * 
 * The above are filled in for player models; for the separate weapon models,
 * the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
 * during death animations. `a_grenades.md2`, the handgrenade weapon model, is
 * the same except that the `wave` frames are blank (according to the default
 * female model files). This is likely due to its dual use as a grenade throw
 * animation where this model must leave the player's model.
 * @see {@link https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html|Source}
 * @see {@link http://tfc.duke.free.fr/coding/md2-specs-en.html|Source}
 * @see {@link http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html|Source}
 * @see {@link http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList|Source}
 */

var Quake2Md2 = (function() {
  Quake2Md2.GlPrimitive = Object.freeze({
    TRIANGLE_STRIP: 0,
    TRIANGLE_FAN: 1,

    0: "TRIANGLE_STRIP",
    1: "TRIANGLE_FAN",
  });

  function Quake2Md2(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  Quake2Md2.prototype._read = function() {
    this.magic = this._io.readBytes(4);
    if (!((KaitaiStream.byteArrayCompare(this.magic, new Uint8Array([73, 68, 80, 50])) == 0))) {
      throw new KaitaiStream.ValidationNotEqualError(new Uint8Array([73, 68, 80, 50]), this.magic, this._io, "/seq/0");
    }
    this.version = this._io.readU4le();
    if (!(this.version == 8)) {
      throw new KaitaiStream.ValidationNotEqualError(8, this.version, this._io, "/seq/1");
    }
    this.skinWidthPx = this._io.readU4le();
    this.skinHeightPx = this._io.readU4le();
    this.bytesPerFrame = this._io.readU4le();
    this.numSkins = this._io.readU4le();
    this.verticesPerFrame = this._io.readU4le();
    this.numTexCoords = this._io.readU4le();
    this.numTriangles = this._io.readU4le();
    this.numGlCmds = this._io.readU4le();
    this.numFrames = this._io.readU4le();
    this.ofsSkins = this._io.readU4le();
    this.ofsTexCoords = this._io.readU4le();
    this.ofsTriangles = this._io.readU4le();
    this.ofsFrames = this._io.readU4le();
    this.ofsGlCmds = this._io.readU4le();
    this.ofsEof = this._io.readU4le();
  }

  var CompressedVec = Quake2Md2.CompressedVec = (function() {
    function CompressedVec(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    CompressedVec.prototype._read = function() {
      this.xCompressed = this._io.readU1();
      this.yCompressed = this._io.readU1();
      this.zCompressed = this._io.readU1();
    }
    Object.defineProperty(CompressedVec.prototype, 'x', {
      get: function() {
        if (this._m_x !== undefined)
          return this._m_x;
        this._m_x = this.xCompressed * this._parent._parent.scale.x + this._parent._parent.translate.x;
        return this._m_x;
      }
    });
    Object.defineProperty(CompressedVec.prototype, 'y', {
      get: function() {
        if (this._m_y !== undefined)
          return this._m_y;
        this._m_y = this.yCompressed * this._parent._parent.scale.y + this._parent._parent.translate.y;
        return this._m_y;
      }
    });
    Object.defineProperty(CompressedVec.prototype, 'z', {
      get: function() {
        if (this._m_z !== undefined)
          return this._m_z;
        this._m_z = this.zCompressed * this._parent._parent.scale.z + this._parent._parent.translate.z;
        return this._m_z;
      }
    });

    return CompressedVec;
  })();

  var Frame = Quake2Md2.Frame = (function() {
    function Frame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Frame.prototype._read = function() {
      this.scale = new Vec3f(this._io, this, this._root);
      this.translate = new Vec3f(this._io, this, this._root);
      this.name = KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(16), 0, false), "ASCII");
      this.vertices = [];
      for (var i = 0; i < this._root.verticesPerFrame; i++) {
        this.vertices.push(new Vertex(this._io, this, this._root));
      }
    }

    return Frame;
  })();

  var GlCmd = Quake2Md2.GlCmd = (function() {
    function GlCmd(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    GlCmd.prototype._read = function() {
      this.cmdNumVertices = this._io.readS4le();
      this.vertices = [];
      for (var i = 0; i < this.numVertices; i++) {
        this.vertices.push(new GlVertex(this._io, this, this._root));
      }
    }
    Object.defineProperty(GlCmd.prototype, 'numVertices', {
      get: function() {
        if (this._m_numVertices !== undefined)
          return this._m_numVertices;
        this._m_numVertices = (this.cmdNumVertices < 0 ? -(this.cmdNumVertices) : this.cmdNumVertices);
        return this._m_numVertices;
      }
    });
    Object.defineProperty(GlCmd.prototype, 'primitive', {
      get: function() {
        if (this._m_primitive !== undefined)
          return this._m_primitive;
        this._m_primitive = (this.cmdNumVertices < 0 ? Quake2Md2.GlPrimitive.TRIANGLE_FAN : Quake2Md2.GlPrimitive.TRIANGLE_STRIP);
        return this._m_primitive;
      }
    });

    return GlCmd;
  })();

  var GlCmdsList = Quake2Md2.GlCmdsList = (function() {
    function GlCmdsList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    GlCmdsList.prototype._read = function() {
      if (!(this._io.isEof())) {
        this.items = [];
        var i = 0;
        do {
          var _ = new GlCmd(this._io, this, this._root);
          this.items.push(_);
          i++;
        } while (!(_.cmdNumVertices == 0));
      }
    }

    return GlCmdsList;
  })();

  var GlVertex = Quake2Md2.GlVertex = (function() {
    function GlVertex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    GlVertex.prototype._read = function() {
      this.texCoordsNormalized = [];
      for (var i = 0; i < 2; i++) {
        this.texCoordsNormalized.push(this._io.readF4le());
      }
      this.vertexIndex = this._io.readU4le();
    }

    /**
     * index to `_root.frames[i].vertices` (for each frame with index `i`)
     */

    return GlVertex;
  })();

  var TexPoint = Quake2Md2.TexPoint = (function() {
    function TexPoint(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    TexPoint.prototype._read = function() {
      this.sPx = this._io.readU2le();
      this.tPx = this._io.readU2le();
    }
    Object.defineProperty(TexPoint.prototype, 'sNormalized', {
      get: function() {
        if (this._m_sNormalized !== undefined)
          return this._m_sNormalized;
        this._m_sNormalized = (this.sPx + 0.0) / this._root.skinWidthPx;
        return this._m_sNormalized;
      }
    });
    Object.defineProperty(TexPoint.prototype, 'tNormalized', {
      get: function() {
        if (this._m_tNormalized !== undefined)
          return this._m_tNormalized;
        this._m_tNormalized = (this.tPx + 0.0) / this._root.skinHeightPx;
        return this._m_tNormalized;
      }
    });

    return TexPoint;
  })();

  var Triangle = Quake2Md2.Triangle = (function() {
    function Triangle(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Triangle.prototype._read = function() {
      this.vertexIndices = [];
      for (var i = 0; i < 3; i++) {
        this.vertexIndices.push(this._io.readU2le());
      }
      this.texPointIndices = [];
      for (var i = 0; i < 3; i++) {
        this.texPointIndices.push(this._io.readU2le());
      }
    }

    /**
     * indices to `_root.frames[i].vertices` (for each frame with index `i`)
     */

    /**
     * indices to `_root.tex_coords`
     */

    return Triangle;
  })();

  var Vec3f = Quake2Md2.Vec3f = (function() {
    function Vec3f(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Vec3f.prototype._read = function() {
      this.x = this._io.readF4le();
      this.y = this._io.readF4le();
      this.z = this._io.readF4le();
    }

    return Vec3f;
  })();

  var Vertex = Quake2Md2.Vertex = (function() {
    function Vertex(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root;

      this._read();
    }
    Vertex.prototype._read = function() {
      this.position = new CompressedVec(this._io, this, this._root);
      this.normalIndex = this._io.readU1();
    }
    Object.defineProperty(Vertex.prototype, 'normal', {
      get: function() {
        if (this._m_normal !== undefined)
          return this._m_normal;
        this._m_normal = this._root.anormsTable[this.normalIndex];
        return this._m_normal;
      }
    });

    return Vertex;
  })();
  Object.defineProperty(Quake2Md2.prototype, 'animNames', {
    get: function() {
      if (this._m_animNames !== undefined)
        return this._m_animNames;
      this._m_animNames = ["stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3"];
      return this._m_animNames;
    }
  });
  Object.defineProperty(Quake2Md2.prototype, 'animNumFrames', {
    get: function() {
      if (this._m_animNumFrames !== undefined)
        return this._m_animNumFrames;
      this._m_animNumFrames = new Uint8Array([40, 6, 8, 4, 4, 4, 6, 12, 11, 17, 11, 12, 19, 6, 9, 4, 5, 6, 6, 8]);
      return this._m_animNumFrames;
    }
  });
  Object.defineProperty(Quake2Md2.prototype, 'animStartIndices', {
    get: function() {
      if (this._m_animStartIndices !== undefined)
        return this._m_animStartIndices;
      this._m_animStartIndices = new Uint8Array([0, 40, 46, 54, 58, 62, 66, 72, 84, 95, 112, 123, 135, 154, 160, 169, 173, 178, 184, 190]);
      return this._m_animStartIndices;
    }
  });

  /**
   * @see {@link https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
   * from|Quake anorms.h}
   */
  Object.defineProperty(Quake2Md2.prototype, 'anormsTable', {
    get: function() {
      if (this._m_anormsTable !== undefined)
        return this._m_anormsTable;
      this._m_anormsTable = [[-0.525731, 0.000000, 0.850651], [-0.442863, 0.238856, 0.864188], [-0.295242, 0.000000, 0.955423], [-0.309017, 0.500000, 0.809017], [-0.162460, 0.262866, 0.951056], [0.000000, 0.000000, 1.000000], [0.000000, 0.850651, 0.525731], [-0.147621, 0.716567, 0.681718], [0.147621, 0.716567, 0.681718], [0.000000, 0.525731, 0.850651], [0.309017, 0.500000, 0.809017], [0.525731, 0.000000, 0.850651], [0.295242, 0.000000, 0.955423], [0.442863, 0.238856, 0.864188], [0.162460, 0.262866, 0.951056], [-0.681718, 0.147621, 0.716567], [-0.809017, 0.309017, 0.500000], [-0.587785, 0.425325, 0.688191], [-0.850651, 0.525731, 0.000000], [-0.864188, 0.442863, 0.238856], [-0.716567, 0.681718, 0.147621], [-0.688191, 0.587785, 0.425325], [-0.500000, 0.809017, 0.309017], [-0.238856, 0.864188, 0.442863], [-0.425325, 0.688191, 0.587785], [-0.716567, 0.681718, -0.147621], [-0.500000, 0.809017, -0.309017], [-0.525731, 0.850651, 0.000000], [0.000000, 0.850651, -0.525731], [-0.238856, 0.864188, -0.442863], [0.000000, 0.955423, -0.295242], [-0.262866, 0.951056, -0.162460], [0.000000, 1.000000, 0.000000], [0.000000, 0.955423, 0.295242], [-0.262866, 0.951056, 0.162460], [0.238856, 0.864188, 0.442863], [0.262866, 0.951056, 0.162460], [0.500000, 0.809017, 0.309017], [0.238856, 0.864188, -0.442863], [0.262866, 0.951056, -0.162460], [0.500000, 0.809017, -0.309017], [0.850651, 0.525731, 0.000000], [0.716567, 0.681718, 0.147621], [0.716567, 0.681718, -0.147621], [0.525731, 0.850651, 0.000000], [0.425325, 0.688191, 0.587785], [0.864188, 0.442863, 0.238856], [0.688191, 0.587785, 0.425325], [0.809017, 0.309017, 0.500000], [0.681718, 0.147621, 0.716567], [0.587785, 0.425325, 0.688191], [0.955423, 0.295242, 0.000000], [1.000000, 0.000000, 0.000000], [0.951056, 0.162460, 0.262866], [0.850651, -0.525731, 0.000000], [0.955423, -0.295242, 0.000000], [0.864188, -0.442863, 0.238856], [0.951056, -0.162460, 0.262866], [0.809017, -0.309017, 0.500000], [0.681718, -0.147621, 0.716567], [0.850651, 0.000000, 0.525731], [0.864188, 0.442863, -0.238856], [0.809017, 0.309017, -0.500000], [0.951056, 0.162460, -0.262866], [0.525731, 0.000000, -0.850651], [0.681718, 0.147621, -0.716567], [0.681718, -0.147621, -0.716567], [0.850651, 0.000000, -0.525731], [0.809017, -0.309017, -0.500000], [0.864188, -0.442863, -0.238856], [0.951056, -0.162460, -0.262866], [0.147621, 0.716567, -0.681718], [0.309017, 0.500000, -0.809017], [0.425325, 0.688191, -0.587785], [0.442863, 0.238856, -0.864188], [0.587785, 0.425325, -0.688191], [0.688191, 0.587785, -0.425325], [-0.147621, 0.716567, -0.681718], [-0.309017, 0.500000, -0.809017], [0.000000, 0.525731, -0.850651], [-0.525731, 0.000000, -0.850651], [-0.442863, 0.238856, -0.864188], [-0.295242, 0.000000, -0.955423], [-0.162460, 0.262866, -0.951056], [0.000000, 0.000000, -1.000000], [0.295242, 0.000000, -0.955423], [0.162460, 0.262866, -0.951056], [-0.442863, -0.238856, -0.864188], [-0.309017, -0.500000, -0.809017], [-0.162460, -0.262866, -0.951056], [0.000000, -0.850651, -0.525731], [-0.147621, -0.716567, -0.681718], [0.147621, -0.716567, -0.681718], [0.000000, -0.525731, -0.850651], [0.309017, -0.500000, -0.809017], [0.442863, -0.238856, -0.864188], [0.162460, -0.262866, -0.951056], [0.238856, -0.864188, -0.442863], [0.500000, -0.809017, -0.309017], [0.425325, -0.688191, -0.587785], [0.716567, -0.681718, -0.147621], [0.688191, -0.587785, -0.425325], [0.587785, -0.425325, -0.688191], [0.000000, -0.955423, -0.295242], [0.000000, -1.000000, 0.000000], [0.262866, -0.951056, -0.162460], [0.000000, -0.850651, 0.525731], [0.000000, -0.955423, 0.295242], [0.238856, -0.864188, 0.442863], [0.262866, -0.951056, 0.162460], [0.500000, -0.809017, 0.309017], [0.716567, -0.681718, 0.147621], [0.525731, -0.850651, 0.000000], [-0.238856, -0.864188, -0.442863], [-0.500000, -0.809017, -0.309017], [-0.262866, -0.951056, -0.162460], [-0.850651, -0.525731, 0.000000], [-0.716567, -0.681718, -0.147621], [-0.716567, -0.681718, 0.147621], [-0.525731, -0.850651, 0.000000], [-0.500000, -0.809017, 0.309017], [-0.238856, -0.864188, 0.442863], [-0.262866, -0.951056, 0.162460], [-0.864188, -0.442863, 0.238856], [-0.809017, -0.309017, 0.500000], [-0.688191, -0.587785, 0.425325], [-0.681718, -0.147621, 0.716567], [-0.442863, -0.238856, 0.864188], [-0.587785, -0.425325, 0.688191], [-0.309017, -0.500000, 0.809017], [-0.147621, -0.716567, 0.681718], [-0.425325, -0.688191, 0.587785], [-0.162460, -0.262866, 0.951056], [0.442863, -0.238856, 0.864188], [0.162460, -0.262866, 0.951056], [0.309017, -0.500000, 0.809017], [0.147621, -0.716567, 0.681718], [0.000000, -0.525731, 0.850651], [0.425325, -0.688191, 0.587785], [0.587785, -0.425325, 0.688191], [0.688191, -0.587785, 0.425325], [-0.955423, 0.295242, 0.000000], [-0.951056, 0.162460, 0.262866], [-1.000000, 0.000000, 0.000000], [-0.850651, 0.000000, 0.525731], [-0.955423, -0.295242, 0.000000], [-0.951056, -0.162460, 0.262866], [-0.864188, 0.442863, -0.238856], [-0.951056, 0.162460, -0.262866], [-0.809017, 0.309017, -0.500000], [-0.864188, -0.442863, -0.238856], [-0.951056, -0.162460, -0.262866], [-0.809017, -0.309017, -0.500000], [-0.681718, 0.147621, -0.716567], [-0.681718, -0.147621, -0.716567], [-0.850651, 0.000000, -0.525731], [-0.688191, 0.587785, -0.425325], [-0.587785, 0.425325, -0.688191], [-0.425325, 0.688191, -0.587785], [-0.425325, -0.688191, -0.587785], [-0.587785, -0.425325, -0.688191], [-0.688191, -0.587785, -0.425325]];
      return this._m_anormsTable;
    }
  });
  Object.defineProperty(Quake2Md2.prototype, 'frames', {
    get: function() {
      if (this._m_frames !== undefined)
        return this._m_frames;
      var _pos = this._io.pos;
      this._io.seek(this.ofsFrames);
      this._raw__m_frames = [];
      this._m_frames = [];
      for (var i = 0; i < this.numFrames; i++) {
        this._raw__m_frames.push(this._io.readBytes(this.bytesPerFrame));
        var _io__raw__m_frames = new KaitaiStream(this._raw__m_frames[i]);
        this._m_frames.push(new Frame(_io__raw__m_frames, this, this._root));
      }
      this._io.seek(_pos);
      return this._m_frames;
    }
  });
  Object.defineProperty(Quake2Md2.prototype, 'glCmds', {
    get: function() {
      if (this._m_glCmds !== undefined)
        return this._m_glCmds;
      var _pos = this._io.pos;
      this._io.seek(this.ofsGlCmds);
      this._raw__m_glCmds = this._io.readBytes(4 * this.numGlCmds);
      var _io__raw__m_glCmds = new KaitaiStream(this._raw__m_glCmds);
      this._m_glCmds = new GlCmdsList(_io__raw__m_glCmds, this, this._root);
      this._io.seek(_pos);
      return this._m_glCmds;
    }
  });
  Object.defineProperty(Quake2Md2.prototype, 'skins', {
    get: function() {
      if (this._m_skins !== undefined)
        return this._m_skins;
      var _pos = this._io.pos;
      this._io.seek(this.ofsSkins);
      this._m_skins = [];
      for (var i = 0; i < this.numSkins; i++) {
        this._m_skins.push(KaitaiStream.bytesToStr(KaitaiStream.bytesTerminate(this._io.readBytes(64), 0, false), "ASCII"));
      }
      this._io.seek(_pos);
      return this._m_skins;
    }
  });
  Object.defineProperty(Quake2Md2.prototype, 'texCoords', {
    get: function() {
      if (this._m_texCoords !== undefined)
        return this._m_texCoords;
      var _pos = this._io.pos;
      this._io.seek(this.ofsTexCoords);
      this._m_texCoords = [];
      for (var i = 0; i < this.numTexCoords; i++) {
        this._m_texCoords.push(new TexPoint(this._io, this, this._root));
      }
      this._io.seek(_pos);
      return this._m_texCoords;
    }
  });
  Object.defineProperty(Quake2Md2.prototype, 'triangles', {
    get: function() {
      if (this._m_triangles !== undefined)
        return this._m_triangles;
      var _pos = this._io.pos;
      this._io.seek(this.ofsTriangles);
      this._m_triangles = [];
      for (var i = 0; i < this.numTriangles; i++) {
        this._m_triangles.push(new Triangle(this._io, this, this._root));
      }
      this._io.seek(_pos);
      return this._m_triangles;
    }
  });

  return Quake2Md2;
})();
Quake2Md2_.Quake2Md2 = Quake2Md2;
});
