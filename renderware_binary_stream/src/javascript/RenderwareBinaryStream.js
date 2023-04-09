// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.RenderwareBinaryStream = factory(root.KaitaiStream);
  }
}(typeof self !== 'undefined' ? self : this, function (KaitaiStream) {
/**
 * @see {@link https://gtamods.com/wiki/RenderWare_binary_stream_file|Source}
 */

var RenderwareBinaryStream = (function() {
  RenderwareBinaryStream.Sections = Object.freeze({
    STRUCT: 1,
    STRING: 2,
    EXTENSION: 3,
    CAMERA: 5,
    TEXTURE: 6,
    MATERIAL: 7,
    MATERIAL_LIST: 8,
    ATOMIC_SECTION: 9,
    PLANE_SECTION: 10,
    WORLD: 11,
    SPLINE: 12,
    MATRIX: 13,
    FRAME_LIST: 14,
    GEOMETRY: 15,
    CLUMP: 16,
    LIGHT: 18,
    UNICODE_STRING: 19,
    ATOMIC: 20,
    TEXTURE_NATIVE: 21,
    TEXTURE_DICTIONARY: 22,
    ANIMATION_DATABASE: 23,
    IMAGE: 24,
    SKIN_ANIMATION: 25,
    GEOMETRY_LIST: 26,
    ANIM_ANIMATION: 27,
    TEAM: 28,
    CROWD: 29,
    DELTA_MORPH_ANIMATION: 30,
    RIGHT_TO_RENDER: 31,
    MULTITEXTURE_EFFECT_NATIVE: 32,
    MULTITEXTURE_EFFECT_DICTIONARY: 33,
    TEAM_DICTIONARY: 34,
    PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY: 35,
    TABLE_OF_CONTENTS: 36,
    PARTICLE_STANDARD_GLOBAL_DATA: 37,
    ALTPIPE: 38,
    PLATFORM_INDEPENDENT_PEDS: 39,
    PATCH_MESH: 40,
    CHUNK_GROUP_START: 41,
    CHUNK_GROUP_END: 42,
    UV_ANIMATION_DICTIONARY: 43,
    COLL_TREE: 44,
    METRICS_PLG: 257,
    SPLINE_PLG: 258,
    STEREO_PLG: 259,
    VRML_PLG: 260,
    MORPH_PLG: 261,
    PVS_PLG: 262,
    MEMORY_LEAK_PLG: 263,
    ANIMATION_PLG: 264,
    GLOSS_PLG: 265,
    LOGO_PLG: 266,
    MEMORY_INFO_PLG: 267,
    RANDOM_PLG: 268,
    PNG_IMAGE_PLG: 269,
    BONE_PLG: 270,
    VRML_ANIM_PLG: 271,
    SKY_MIPMAP_VAL: 272,
    MRM_PLG: 273,
    LOD_ATOMIC_PLG: 274,
    ME_PLG: 275,
    LIGHTMAP_PLG: 276,
    REFINE_PLG: 277,
    SKIN_PLG: 278,
    LABEL_PLG: 279,
    PARTICLES_PLG: 280,
    GEOMTX_PLG: 281,
    SYNTH_CORE_PLG: 282,
    STQPP_PLG: 283,
    PART_PP_PLG: 284,
    COLLISION_PLG: 285,
    HANIM_PLG: 286,
    USER_DATA_PLG: 287,
    MATERIAL_EFFECTS_PLG: 288,
    PARTICLE_SYSTEM_PLG: 289,
    DELTA_MORPH_PLG: 290,
    PATCH_PLG: 291,
    TEAM_PLG: 292,
    CROWD_PP_PLG: 293,
    MIP_SPLIT_PLG: 294,
    ANISOTROPY_PLG: 295,
    GCN_MATERIAL_PLG: 297,
    GEOMETRIC_PVS_PLG: 298,
    XBOX_MATERIAL_PLG: 299,
    MULTI_TEXTURE_PLG: 300,
    CHAIN_PLG: 301,
    TOON_PLG: 302,
    PTANK_PLG: 303,
    PARTICLE_STANDARD_PLG: 304,
    PDS_PLG: 305,
    PRTADV_PLG: 306,
    NORMAL_MAP_PLG: 307,
    ADC_PLG: 308,
    UV_ANIMATION_PLG: 309,
    CHARACTER_SET_PLG: 384,
    NOHS_WORLD_PLG: 385,
    IMPORT_UTIL_PLG: 386,
    SLERP_PLG: 387,
    OPTIM_PLG: 388,
    TL_WORLD_PLG: 389,
    DATABASE_PLG: 390,
    RAYTRACE_PLG: 391,
    RAY_PLG: 392,
    LIBRARY_PLG: 393,
    PLG_2D: 400,
    TILE_RENDER_PLG: 401,
    JPEG_IMAGE_PLG: 402,
    TGA_IMAGE_PLG: 403,
    GIF_IMAGE_PLG: 404,
    QUAT_PLG: 405,
    SPLINE_PVS_PLG: 406,
    MIPMAP_PLG: 407,
    MIPMAPK_PLG: 408,
    FONT_2D: 409,
    INTERSECTION_PLG: 410,
    TIFF_IMAGE_PLG: 411,
    PICK_PLG: 412,
    BMP_IMAGE_PLG: 413,
    RAS_IMAGE_PLG: 414,
    SKIN_FX_PLG: 415,
    VCAT_PLG: 416,
    PATH_2D: 417,
    BRUSH_2D: 418,
    OBJECT_2D: 419,
    SHAPE_2D: 420,
    SCENE_2D: 421,
    PICK_REGION_2D: 422,
    OBJECT_STRING_2D: 423,
    ANIMATION_PLG_2D: 424,
    ANIMATION_2D: 425,
    KEYFRAME_2D: 432,
    MAESTRO_2D: 433,
    BARYCENTRIC: 434,
    PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY_TK: 435,
    TOC_TK: 436,
    TPL_TK: 437,
    ALTPIPE_TK: 438,
    ANIMATION_TK: 439,
    SKIN_SPLIT_TOOKIT: 440,
    COMPRESSED_KEY_TK: 441,
    GEOMETRY_CONDITIONING_PLG: 442,
    WING_PLG: 443,
    GENERIC_PIPELINE_TK: 444,
    LIGHTMAP_CONVERSION_TK: 445,
    FILESYSTEM_PLG: 446,
    DICTIONARY_TK: 447,
    UV_ANIMATION_LINEAR: 448,
    UV_ANIMATION_PARAMETER: 449,
    BIN_MESH_PLG: 1294,
    NATIVE_DATA_PLG: 1296,
    ZMODELER_LOCK: 61982,
    ATOMIC_VISIBILITY_DISTANCE: 39055872,
    CLUMP_VISIBILITY_DISTANCE: 39055873,
    FRAME_VISIBILITY_DISTANCE: 39055874,
    PIPELINE_SET: 39056115,
    UNUSED_5: 39056116,
    TEXDICTIONARY_LINK: 39056117,
    SPECULAR_MATERIAL: 39056118,
    UNUSED_8: 39056119,
    EFFECT_2D: 39056120,
    EXTRA_VERT_COLOUR: 39056121,
    COLLISION_MODEL: 39056122,
    GTA_HANIM: 39056123,
    REFLECTION_MATERIAL: 39056124,
    BREAKABLE: 39056125,
    FRAME: 39056126,
    UNUSED_16: 39056127,

    1: "STRUCT",
    2: "STRING",
    3: "EXTENSION",
    5: "CAMERA",
    6: "TEXTURE",
    7: "MATERIAL",
    8: "MATERIAL_LIST",
    9: "ATOMIC_SECTION",
    10: "PLANE_SECTION",
    11: "WORLD",
    12: "SPLINE",
    13: "MATRIX",
    14: "FRAME_LIST",
    15: "GEOMETRY",
    16: "CLUMP",
    18: "LIGHT",
    19: "UNICODE_STRING",
    20: "ATOMIC",
    21: "TEXTURE_NATIVE",
    22: "TEXTURE_DICTIONARY",
    23: "ANIMATION_DATABASE",
    24: "IMAGE",
    25: "SKIN_ANIMATION",
    26: "GEOMETRY_LIST",
    27: "ANIM_ANIMATION",
    28: "TEAM",
    29: "CROWD",
    30: "DELTA_MORPH_ANIMATION",
    31: "RIGHT_TO_RENDER",
    32: "MULTITEXTURE_EFFECT_NATIVE",
    33: "MULTITEXTURE_EFFECT_DICTIONARY",
    34: "TEAM_DICTIONARY",
    35: "PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY",
    36: "TABLE_OF_CONTENTS",
    37: "PARTICLE_STANDARD_GLOBAL_DATA",
    38: "ALTPIPE",
    39: "PLATFORM_INDEPENDENT_PEDS",
    40: "PATCH_MESH",
    41: "CHUNK_GROUP_START",
    42: "CHUNK_GROUP_END",
    43: "UV_ANIMATION_DICTIONARY",
    44: "COLL_TREE",
    257: "METRICS_PLG",
    258: "SPLINE_PLG",
    259: "STEREO_PLG",
    260: "VRML_PLG",
    261: "MORPH_PLG",
    262: "PVS_PLG",
    263: "MEMORY_LEAK_PLG",
    264: "ANIMATION_PLG",
    265: "GLOSS_PLG",
    266: "LOGO_PLG",
    267: "MEMORY_INFO_PLG",
    268: "RANDOM_PLG",
    269: "PNG_IMAGE_PLG",
    270: "BONE_PLG",
    271: "VRML_ANIM_PLG",
    272: "SKY_MIPMAP_VAL",
    273: "MRM_PLG",
    274: "LOD_ATOMIC_PLG",
    275: "ME_PLG",
    276: "LIGHTMAP_PLG",
    277: "REFINE_PLG",
    278: "SKIN_PLG",
    279: "LABEL_PLG",
    280: "PARTICLES_PLG",
    281: "GEOMTX_PLG",
    282: "SYNTH_CORE_PLG",
    283: "STQPP_PLG",
    284: "PART_PP_PLG",
    285: "COLLISION_PLG",
    286: "HANIM_PLG",
    287: "USER_DATA_PLG",
    288: "MATERIAL_EFFECTS_PLG",
    289: "PARTICLE_SYSTEM_PLG",
    290: "DELTA_MORPH_PLG",
    291: "PATCH_PLG",
    292: "TEAM_PLG",
    293: "CROWD_PP_PLG",
    294: "MIP_SPLIT_PLG",
    295: "ANISOTROPY_PLG",
    297: "GCN_MATERIAL_PLG",
    298: "GEOMETRIC_PVS_PLG",
    299: "XBOX_MATERIAL_PLG",
    300: "MULTI_TEXTURE_PLG",
    301: "CHAIN_PLG",
    302: "TOON_PLG",
    303: "PTANK_PLG",
    304: "PARTICLE_STANDARD_PLG",
    305: "PDS_PLG",
    306: "PRTADV_PLG",
    307: "NORMAL_MAP_PLG",
    308: "ADC_PLG",
    309: "UV_ANIMATION_PLG",
    384: "CHARACTER_SET_PLG",
    385: "NOHS_WORLD_PLG",
    386: "IMPORT_UTIL_PLG",
    387: "SLERP_PLG",
    388: "OPTIM_PLG",
    389: "TL_WORLD_PLG",
    390: "DATABASE_PLG",
    391: "RAYTRACE_PLG",
    392: "RAY_PLG",
    393: "LIBRARY_PLG",
    400: "PLG_2D",
    401: "TILE_RENDER_PLG",
    402: "JPEG_IMAGE_PLG",
    403: "TGA_IMAGE_PLG",
    404: "GIF_IMAGE_PLG",
    405: "QUAT_PLG",
    406: "SPLINE_PVS_PLG",
    407: "MIPMAP_PLG",
    408: "MIPMAPK_PLG",
    409: "FONT_2D",
    410: "INTERSECTION_PLG",
    411: "TIFF_IMAGE_PLG",
    412: "PICK_PLG",
    413: "BMP_IMAGE_PLG",
    414: "RAS_IMAGE_PLG",
    415: "SKIN_FX_PLG",
    416: "VCAT_PLG",
    417: "PATH_2D",
    418: "BRUSH_2D",
    419: "OBJECT_2D",
    420: "SHAPE_2D",
    421: "SCENE_2D",
    422: "PICK_REGION_2D",
    423: "OBJECT_STRING_2D",
    424: "ANIMATION_PLG_2D",
    425: "ANIMATION_2D",
    432: "KEYFRAME_2D",
    433: "MAESTRO_2D",
    434: "BARYCENTRIC",
    435: "PLATFORM_INDEPENDENT_TEXTURE_DICTIONARY_TK",
    436: "TOC_TK",
    437: "TPL_TK",
    438: "ALTPIPE_TK",
    439: "ANIMATION_TK",
    440: "SKIN_SPLIT_TOOKIT",
    441: "COMPRESSED_KEY_TK",
    442: "GEOMETRY_CONDITIONING_PLG",
    443: "WING_PLG",
    444: "GENERIC_PIPELINE_TK",
    445: "LIGHTMAP_CONVERSION_TK",
    446: "FILESYSTEM_PLG",
    447: "DICTIONARY_TK",
    448: "UV_ANIMATION_LINEAR",
    449: "UV_ANIMATION_PARAMETER",
    1294: "BIN_MESH_PLG",
    1296: "NATIVE_DATA_PLG",
    61982: "ZMODELER_LOCK",
    39055872: "ATOMIC_VISIBILITY_DISTANCE",
    39055873: "CLUMP_VISIBILITY_DISTANCE",
    39055874: "FRAME_VISIBILITY_DISTANCE",
    39056115: "PIPELINE_SET",
    39056116: "UNUSED_5",
    39056117: "TEXDICTIONARY_LINK",
    39056118: "SPECULAR_MATERIAL",
    39056119: "UNUSED_8",
    39056120: "EFFECT_2D",
    39056121: "EXTRA_VERT_COLOUR",
    39056122: "COLLISION_MODEL",
    39056123: "GTA_HANIM",
    39056124: "REFLECTION_MATERIAL",
    39056125: "BREAKABLE",
    39056126: "FRAME",
    39056127: "UNUSED_16",
  });

  function RenderwareBinaryStream(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  RenderwareBinaryStream.prototype._read = function() {
    this.code = this._io.readU4le();
    this.size = this._io.readU4le();
    this.libraryIdStamp = this._io.readU4le();
    switch (this.code) {
    case RenderwareBinaryStream.Sections.ATOMIC:
      this._raw_body = this._io.readBytes(this.size);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new ListWithHeader(_io__raw_body, this, this._root);
      break;
    case RenderwareBinaryStream.Sections.GEOMETRY:
      this._raw_body = this._io.readBytes(this.size);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new ListWithHeader(_io__raw_body, this, this._root);
      break;
    case RenderwareBinaryStream.Sections.TEXTURE_DICTIONARY:
      this._raw_body = this._io.readBytes(this.size);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new ListWithHeader(_io__raw_body, this, this._root);
      break;
    case RenderwareBinaryStream.Sections.GEOMETRY_LIST:
      this._raw_body = this._io.readBytes(this.size);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new ListWithHeader(_io__raw_body, this, this._root);
      break;
    case RenderwareBinaryStream.Sections.TEXTURE_NATIVE:
      this._raw_body = this._io.readBytes(this.size);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new ListWithHeader(_io__raw_body, this, this._root);
      break;
    case RenderwareBinaryStream.Sections.CLUMP:
      this._raw_body = this._io.readBytes(this.size);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new ListWithHeader(_io__raw_body, this, this._root);
      break;
    case RenderwareBinaryStream.Sections.FRAME_LIST:
      this._raw_body = this._io.readBytes(this.size);
      var _io__raw_body = new KaitaiStream(this._raw_body);
      this.body = new ListWithHeader(_io__raw_body, this, this._root);
      break;
    default:
      this.body = this._io.readBytes(this.size);
      break;
    }
  }

  /**
   * @see {@link https://gtamods.com/wiki/RpClump|Source}
   */

  var StructClump = RenderwareBinaryStream.StructClump = (function() {
    function StructClump(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StructClump.prototype._read = function() {
      this.numAtomics = this._io.readU4le();
      if (this._parent.version >= 208896) {
        this.numLights = this._io.readU4le();
      }
      if (this._parent.version >= 208896) {
        this.numCameras = this._io.readU4le();
      }
    }

    return StructClump;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/RpGeometry|Source}
   */

  var StructGeometry = RenderwareBinaryStream.StructGeometry = (function() {
    function StructGeometry(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StructGeometry.prototype._read = function() {
      this.format = this._io.readU4le();
      this.numTriangles = this._io.readU4le();
      this.numVertices = this._io.readU4le();
      this.numMorphTargets = this._io.readU4le();
      if (this._parent.version < 212992) {
        this.surfProp = new SurfaceProperties(this._io, this, this._root);
      }
      if (!(this.isNative)) {
        this.geometry = new GeometryNonNative(this._io, this, this._root);
      }
      this.morphTargets = [];
      for (var i = 0; i < this.numMorphTargets; i++) {
        this.morphTargets.push(new MorphTarget(this._io, this, this._root));
      }
    }
    Object.defineProperty(StructGeometry.prototype, 'numUvLayersRaw', {
      get: function() {
        if (this._m_numUvLayersRaw !== undefined)
          return this._m_numUvLayersRaw;
        this._m_numUvLayersRaw = ((this.format & 16711680) >>> 16);
        return this._m_numUvLayersRaw;
      }
    });
    Object.defineProperty(StructGeometry.prototype, 'isTextured', {
      get: function() {
        if (this._m_isTextured !== undefined)
          return this._m_isTextured;
        this._m_isTextured = (this.format & 4) != 0;
        return this._m_isTextured;
      }
    });
    Object.defineProperty(StructGeometry.prototype, 'isNative', {
      get: function() {
        if (this._m_isNative !== undefined)
          return this._m_isNative;
        this._m_isNative = (this.format & 16777216) != 0;
        return this._m_isNative;
      }
    });
    Object.defineProperty(StructGeometry.prototype, 'numUvLayers', {
      get: function() {
        if (this._m_numUvLayers !== undefined)
          return this._m_numUvLayers;
        this._m_numUvLayers = (this.numUvLayersRaw == 0 ? (this.isTextured2 ? 2 : (this.isTextured ? 1 : 0)) : this.numUvLayersRaw);
        return this._m_numUvLayers;
      }
    });
    Object.defineProperty(StructGeometry.prototype, 'isTextured2', {
      get: function() {
        if (this._m_isTextured2 !== undefined)
          return this._m_isTextured2;
        this._m_isTextured2 = (this.format & 128) != 0;
        return this._m_isTextured2;
      }
    });
    Object.defineProperty(StructGeometry.prototype, 'isPrelit', {
      get: function() {
        if (this._m_isPrelit !== undefined)
          return this._m_isPrelit;
        this._m_isPrelit = (this.format & 8) != 0;
        return this._m_isPrelit;
      }
    });

    return StructGeometry;
  })();

  var GeometryNonNative = RenderwareBinaryStream.GeometryNonNative = (function() {
    function GeometryNonNative(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    GeometryNonNative.prototype._read = function() {
      if (this._parent.isPrelit) {
        this.prelitColors = [];
        for (var i = 0; i < this._parent.numVertices; i++) {
          this.prelitColors.push(new Rgba(this._io, this, this._root));
        }
      }
      this.uvLayers = [];
      for (var i = 0; i < this._parent.numUvLayers; i++) {
        this.uvLayers.push(new UvLayer(this._io, this, this._root, this._parent.numVertices));
      }
      this.triangles = [];
      for (var i = 0; i < this._parent.numTriangles; i++) {
        this.triangles.push(new Triangle(this._io, this, this._root));
      }
    }

    return GeometryNonNative;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/Geometry_List_(RW_Section)#Structure|Source}
   */

  var StructGeometryList = RenderwareBinaryStream.StructGeometryList = (function() {
    function StructGeometryList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StructGeometryList.prototype._read = function() {
      this.numGeometries = this._io.readU4le();
    }

    return StructGeometryList;
  })();

  var Rgba = RenderwareBinaryStream.Rgba = (function() {
    function Rgba(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Rgba.prototype._read = function() {
      this.r = this._io.readU1();
      this.g = this._io.readU1();
      this.b = this._io.readU1();
      this.a = this._io.readU1();
    }

    return Rgba;
  })();

  var Sphere = RenderwareBinaryStream.Sphere = (function() {
    function Sphere(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Sphere.prototype._read = function() {
      this.x = this._io.readF4le();
      this.y = this._io.readF4le();
      this.z = this._io.readF4le();
      this.radius = this._io.readF4le();
    }

    return Sphere;
  })();

  var MorphTarget = RenderwareBinaryStream.MorphTarget = (function() {
    function MorphTarget(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    MorphTarget.prototype._read = function() {
      this.boundingSphere = new Sphere(this._io, this, this._root);
      this.hasVertices = this._io.readU4le();
      this.hasNormals = this._io.readU4le();
      if (this.hasVertices != 0) {
        this.vertices = [];
        for (var i = 0; i < this._parent.numVertices; i++) {
          this.vertices.push(new Vector3d(this._io, this, this._root));
        }
      }
      if (this.hasNormals != 0) {
        this.normals = [];
        for (var i = 0; i < this._parent.numVertices; i++) {
          this.normals.push(new Vector3d(this._io, this, this._root));
        }
      }
    }

    return MorphTarget;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/Atomic_(RW_Section)#Structure|Source}
   */

  var StructAtomic = RenderwareBinaryStream.StructAtomic = (function() {
    function StructAtomic(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StructAtomic.prototype._read = function() {
      this.frameIndex = this._io.readU4le();
      this.geometryIndex = this._io.readU4le();
      this.flagRender = this._io.readBitsIntLe(1) != 0;
      this._unnamed3 = this._io.readBitsIntLe(1) != 0;
      this.flagCollisionTest = this._io.readBitsIntLe(1) != 0;
      this._unnamed5 = this._io.readBitsIntLe(29);
      this._io.alignToByte();
      this.unused = this._io.readU4le();
    }

    return StructAtomic;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/RpGeometry|Source}
   */

  var SurfaceProperties = RenderwareBinaryStream.SurfaceProperties = (function() {
    function SurfaceProperties(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    SurfaceProperties.prototype._read = function() {
      this.ambient = this._io.readF4le();
      this.specular = this._io.readF4le();
      this.diffuse = this._io.readF4le();
    }

    return SurfaceProperties;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure|Source}
   */

  var StructFrameList = RenderwareBinaryStream.StructFrameList = (function() {
    function StructFrameList(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StructFrameList.prototype._read = function() {
      this.numFrames = this._io.readU4le();
      this.frames = [];
      for (var i = 0; i < this.numFrames; i++) {
        this.frames.push(new Frame(this._io, this, this._root));
      }
    }

    return StructFrameList;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure|Source}
   */

  var Matrix = RenderwareBinaryStream.Matrix = (function() {
    function Matrix(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Matrix.prototype._read = function() {
      this.entries = [];
      for (var i = 0; i < 3; i++) {
        this.entries.push(new Vector3d(this._io, this, this._root));
      }
    }

    return Matrix;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure|Source}
   */

  var Vector3d = RenderwareBinaryStream.Vector3d = (function() {
    function Vector3d(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Vector3d.prototype._read = function() {
      this.x = this._io.readF4le();
      this.y = this._io.readF4le();
      this.z = this._io.readF4le();
    }

    return Vector3d;
  })();

  /**
   * Typical structure used by many data types in RenderWare binary
   * stream. Substream contains a list of binary stream entries,
   * first entry always has type "struct" and carries some specific
   * binary data it in, determined by the type of parent. All other
   * entries, beside the first one, are normal, self-describing
   * records.
   */

  var ListWithHeader = RenderwareBinaryStream.ListWithHeader = (function() {
    function ListWithHeader(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ListWithHeader.prototype._read = function() {
      this.code = this._io.readBytes(4);
      if (!((KaitaiStream.byteArrayCompare(this.code, [1, 0, 0, 0]) == 0))) {
        throw new KaitaiStream.ValidationNotEqualError([1, 0, 0, 0], this.code, this._io, "/types/list_with_header/seq/0");
      }
      this.headerSize = this._io.readU4le();
      this.libraryIdStamp = this._io.readU4le();
      switch (this._parent.code) {
      case RenderwareBinaryStream.Sections.ATOMIC:
        this._raw_header = this._io.readBytes(this.headerSize);
        var _io__raw_header = new KaitaiStream(this._raw_header);
        this.header = new StructAtomic(_io__raw_header, this, this._root);
        break;
      case RenderwareBinaryStream.Sections.GEOMETRY:
        this._raw_header = this._io.readBytes(this.headerSize);
        var _io__raw_header = new KaitaiStream(this._raw_header);
        this.header = new StructGeometry(_io__raw_header, this, this._root);
        break;
      case RenderwareBinaryStream.Sections.TEXTURE_DICTIONARY:
        this._raw_header = this._io.readBytes(this.headerSize);
        var _io__raw_header = new KaitaiStream(this._raw_header);
        this.header = new StructTextureDictionary(_io__raw_header, this, this._root);
        break;
      case RenderwareBinaryStream.Sections.GEOMETRY_LIST:
        this._raw_header = this._io.readBytes(this.headerSize);
        var _io__raw_header = new KaitaiStream(this._raw_header);
        this.header = new StructGeometryList(_io__raw_header, this, this._root);
        break;
      case RenderwareBinaryStream.Sections.CLUMP:
        this._raw_header = this._io.readBytes(this.headerSize);
        var _io__raw_header = new KaitaiStream(this._raw_header);
        this.header = new StructClump(_io__raw_header, this, this._root);
        break;
      case RenderwareBinaryStream.Sections.FRAME_LIST:
        this._raw_header = this._io.readBytes(this.headerSize);
        var _io__raw_header = new KaitaiStream(this._raw_header);
        this.header = new StructFrameList(_io__raw_header, this, this._root);
        break;
      default:
        this.header = this._io.readBytes(this.headerSize);
        break;
      }
      this.entries = [];
      var i = 0;
      while (!this._io.isEof()) {
        this.entries.push(new RenderwareBinaryStream(this._io, this, null));
        i++;
      }
    }
    Object.defineProperty(ListWithHeader.prototype, 'version', {
      get: function() {
        if (this._m_version !== undefined)
          return this._m_version;
        this._m_version = ((this.libraryIdStamp & 4294901760) != 0 ? ((((this.libraryIdStamp >>> 14) & 261888) + 196608) | ((this.libraryIdStamp >>> 16) & 63)) : (this.libraryIdStamp << 8));
        return this._m_version;
      }
    });

    return ListWithHeader;
  })();

  var Triangle = RenderwareBinaryStream.Triangle = (function() {
    function Triangle(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Triangle.prototype._read = function() {
      this.vertex2 = this._io.readU2le();
      this.vertex1 = this._io.readU2le();
      this.materialId = this._io.readU2le();
      this.vertex3 = this._io.readU2le();
    }

    return Triangle;
  })();

  /**
   * @see {@link https://gtamods.com/wiki/Frame_List_(RW_Section)#Structure|Source}
   */

  var Frame = RenderwareBinaryStream.Frame = (function() {
    function Frame(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    Frame.prototype._read = function() {
      this.rotationMatrix = new Matrix(this._io, this, this._root);
      this.position = new Vector3d(this._io, this, this._root);
      this.curFrameIdx = this._io.readS4le();
      this.matrixCreationFlags = this._io.readU4le();
    }

    return Frame;
  })();

  var TexCoord = RenderwareBinaryStream.TexCoord = (function() {
    function TexCoord(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    TexCoord.prototype._read = function() {
      this.u = this._io.readF4le();
      this.v = this._io.readF4le();
    }

    return TexCoord;
  })();

  var UvLayer = RenderwareBinaryStream.UvLayer = (function() {
    function UvLayer(_io, _parent, _root, numVertices) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;
      this.numVertices = numVertices;

      this._read();
    }
    UvLayer.prototype._read = function() {
      this.texCoords = [];
      for (var i = 0; i < this.numVertices; i++) {
        this.texCoords.push(new TexCoord(this._io, this, this._root));
      }
    }

    return UvLayer;
  })();

  var StructTextureDictionary = RenderwareBinaryStream.StructTextureDictionary = (function() {
    function StructTextureDictionary(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    StructTextureDictionary.prototype._read = function() {
      this.numTextures = this._io.readU4le();
    }

    return StructTextureDictionary;
  })();
  Object.defineProperty(RenderwareBinaryStream.prototype, 'version', {
    get: function() {
      if (this._m_version !== undefined)
        return this._m_version;
      this._m_version = ((this.libraryIdStamp & 4294901760) != 0 ? ((((this.libraryIdStamp >>> 14) & 261888) + 196608) | ((this.libraryIdStamp >>> 16) & 63)) : (this.libraryIdStamp << 8));
      return this._m_version;
    }
  });

  return RenderwareBinaryStream;
})();
return RenderwareBinaryStream;
}));
