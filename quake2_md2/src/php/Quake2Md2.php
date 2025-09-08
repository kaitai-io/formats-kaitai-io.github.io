<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 */

namespace {
    class Quake2Md2 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(4);
            if (!($this->_m_magic == "\x49\x44\x50\x32")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x49\x44\x50\x32", $this->_m_magic, $this->_io, "/seq/0");
            }
            $this->_m_version = $this->_io->readU4le();
            if (!($this->_m_version == 8)) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError(8, $this->_m_version, $this->_io, "/seq/1");
            }
            $this->_m_skinWidthPx = $this->_io->readU4le();
            $this->_m_skinHeightPx = $this->_io->readU4le();
            $this->_m_bytesPerFrame = $this->_io->readU4le();
            $this->_m_numSkins = $this->_io->readU4le();
            $this->_m_verticesPerFrame = $this->_io->readU4le();
            $this->_m_numTexCoords = $this->_io->readU4le();
            $this->_m_numTriangles = $this->_io->readU4le();
            $this->_m_numGlCmds = $this->_io->readU4le();
            $this->_m_numFrames = $this->_io->readU4le();
            $this->_m_ofsSkins = $this->_io->readU4le();
            $this->_m_ofsTexCoords = $this->_io->readU4le();
            $this->_m_ofsTriangles = $this->_io->readU4le();
            $this->_m_ofsFrames = $this->_io->readU4le();
            $this->_m_ofsGlCmds = $this->_io->readU4le();
            $this->_m_ofsEof = $this->_io->readU4le();
        }
        protected $_m_animNames;
        public function animNames() {
            if ($this->_m_animNames !== null)
                return $this->_m_animNames;
            $this->_m_animNames = ["stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3"];
            return $this->_m_animNames;
        }
        protected $_m_animNumFrames;
        public function animNumFrames() {
            if ($this->_m_animNumFrames !== null)
                return $this->_m_animNumFrames;
            $this->_m_animNumFrames = "\x28\x06\x08\x04\x04\x04\x06\x0C\x0B\x11\x0B\x0C\x13\x06\x09\x04\x05\x06\x06\x08";
            return $this->_m_animNumFrames;
        }
        protected $_m_animStartIndices;
        public function animStartIndices() {
            if ($this->_m_animStartIndices !== null)
                return $this->_m_animStartIndices;
            $this->_m_animStartIndices = "\x00\x28\x2E\x36\x3A\x3E\x42\x48\x54\x5F\x70\x7B\x87\x9A\xA0\xA9\xAD\xB2\xB8\xBE";
            return $this->_m_animStartIndices;
        }
        protected $_m_anormsTable;
        public function anormsTable() {
            if ($this->_m_anormsTable !== null)
                return $this->_m_anormsTable;
            $this->_m_anormsTable = [[-0.525731, 0.000000, 0.850651], [-0.442863, 0.238856, 0.864188], [-0.295242, 0.000000, 0.955423], [-0.309017, 0.500000, 0.809017], [-0.162460, 0.262866, 0.951056], [0.000000, 0.000000, 1.000000], [0.000000, 0.850651, 0.525731], [-0.147621, 0.716567, 0.681718], [0.147621, 0.716567, 0.681718], [0.000000, 0.525731, 0.850651], [0.309017, 0.500000, 0.809017], [0.525731, 0.000000, 0.850651], [0.295242, 0.000000, 0.955423], [0.442863, 0.238856, 0.864188], [0.162460, 0.262866, 0.951056], [-0.681718, 0.147621, 0.716567], [-0.809017, 0.309017, 0.500000], [-0.587785, 0.425325, 0.688191], [-0.850651, 0.525731, 0.000000], [-0.864188, 0.442863, 0.238856], [-0.716567, 0.681718, 0.147621], [-0.688191, 0.587785, 0.425325], [-0.500000, 0.809017, 0.309017], [-0.238856, 0.864188, 0.442863], [-0.425325, 0.688191, 0.587785], [-0.716567, 0.681718, -0.147621], [-0.500000, 0.809017, -0.309017], [-0.525731, 0.850651, 0.000000], [0.000000, 0.850651, -0.525731], [-0.238856, 0.864188, -0.442863], [0.000000, 0.955423, -0.295242], [-0.262866, 0.951056, -0.162460], [0.000000, 1.000000, 0.000000], [0.000000, 0.955423, 0.295242], [-0.262866, 0.951056, 0.162460], [0.238856, 0.864188, 0.442863], [0.262866, 0.951056, 0.162460], [0.500000, 0.809017, 0.309017], [0.238856, 0.864188, -0.442863], [0.262866, 0.951056, -0.162460], [0.500000, 0.809017, -0.309017], [0.850651, 0.525731, 0.000000], [0.716567, 0.681718, 0.147621], [0.716567, 0.681718, -0.147621], [0.525731, 0.850651, 0.000000], [0.425325, 0.688191, 0.587785], [0.864188, 0.442863, 0.238856], [0.688191, 0.587785, 0.425325], [0.809017, 0.309017, 0.500000], [0.681718, 0.147621, 0.716567], [0.587785, 0.425325, 0.688191], [0.955423, 0.295242, 0.000000], [1.000000, 0.000000, 0.000000], [0.951056, 0.162460, 0.262866], [0.850651, -0.525731, 0.000000], [0.955423, -0.295242, 0.000000], [0.864188, -0.442863, 0.238856], [0.951056, -0.162460, 0.262866], [0.809017, -0.309017, 0.500000], [0.681718, -0.147621, 0.716567], [0.850651, 0.000000, 0.525731], [0.864188, 0.442863, -0.238856], [0.809017, 0.309017, -0.500000], [0.951056, 0.162460, -0.262866], [0.525731, 0.000000, -0.850651], [0.681718, 0.147621, -0.716567], [0.681718, -0.147621, -0.716567], [0.850651, 0.000000, -0.525731], [0.809017, -0.309017, -0.500000], [0.864188, -0.442863, -0.238856], [0.951056, -0.162460, -0.262866], [0.147621, 0.716567, -0.681718], [0.309017, 0.500000, -0.809017], [0.425325, 0.688191, -0.587785], [0.442863, 0.238856, -0.864188], [0.587785, 0.425325, -0.688191], [0.688191, 0.587785, -0.425325], [-0.147621, 0.716567, -0.681718], [-0.309017, 0.500000, -0.809017], [0.000000, 0.525731, -0.850651], [-0.525731, 0.000000, -0.850651], [-0.442863, 0.238856, -0.864188], [-0.295242, 0.000000, -0.955423], [-0.162460, 0.262866, -0.951056], [0.000000, 0.000000, -1.000000], [0.295242, 0.000000, -0.955423], [0.162460, 0.262866, -0.951056], [-0.442863, -0.238856, -0.864188], [-0.309017, -0.500000, -0.809017], [-0.162460, -0.262866, -0.951056], [0.000000, -0.850651, -0.525731], [-0.147621, -0.716567, -0.681718], [0.147621, -0.716567, -0.681718], [0.000000, -0.525731, -0.850651], [0.309017, -0.500000, -0.809017], [0.442863, -0.238856, -0.864188], [0.162460, -0.262866, -0.951056], [0.238856, -0.864188, -0.442863], [0.500000, -0.809017, -0.309017], [0.425325, -0.688191, -0.587785], [0.716567, -0.681718, -0.147621], [0.688191, -0.587785, -0.425325], [0.587785, -0.425325, -0.688191], [0.000000, -0.955423, -0.295242], [0.000000, -1.000000, 0.000000], [0.262866, -0.951056, -0.162460], [0.000000, -0.850651, 0.525731], [0.000000, -0.955423, 0.295242], [0.238856, -0.864188, 0.442863], [0.262866, -0.951056, 0.162460], [0.500000, -0.809017, 0.309017], [0.716567, -0.681718, 0.147621], [0.525731, -0.850651, 0.000000], [-0.238856, -0.864188, -0.442863], [-0.500000, -0.809017, -0.309017], [-0.262866, -0.951056, -0.162460], [-0.850651, -0.525731, 0.000000], [-0.716567, -0.681718, -0.147621], [-0.716567, -0.681718, 0.147621], [-0.525731, -0.850651, 0.000000], [-0.500000, -0.809017, 0.309017], [-0.238856, -0.864188, 0.442863], [-0.262866, -0.951056, 0.162460], [-0.864188, -0.442863, 0.238856], [-0.809017, -0.309017, 0.500000], [-0.688191, -0.587785, 0.425325], [-0.681718, -0.147621, 0.716567], [-0.442863, -0.238856, 0.864188], [-0.587785, -0.425325, 0.688191], [-0.309017, -0.500000, 0.809017], [-0.147621, -0.716567, 0.681718], [-0.425325, -0.688191, 0.587785], [-0.162460, -0.262866, 0.951056], [0.442863, -0.238856, 0.864188], [0.162460, -0.262866, 0.951056], [0.309017, -0.500000, 0.809017], [0.147621, -0.716567, 0.681718], [0.000000, -0.525731, 0.850651], [0.425325, -0.688191, 0.587785], [0.587785, -0.425325, 0.688191], [0.688191, -0.587785, 0.425325], [-0.955423, 0.295242, 0.000000], [-0.951056, 0.162460, 0.262866], [-1.000000, 0.000000, 0.000000], [-0.850651, 0.000000, 0.525731], [-0.955423, -0.295242, 0.000000], [-0.951056, -0.162460, 0.262866], [-0.864188, 0.442863, -0.238856], [-0.951056, 0.162460, -0.262866], [-0.809017, 0.309017, -0.500000], [-0.864188, -0.442863, -0.238856], [-0.951056, -0.162460, -0.262866], [-0.809017, -0.309017, -0.500000], [-0.681718, 0.147621, -0.716567], [-0.681718, -0.147621, -0.716567], [-0.850651, 0.000000, -0.525731], [-0.688191, 0.587785, -0.425325], [-0.587785, 0.425325, -0.688191], [-0.425325, 0.688191, -0.587785], [-0.425325, -0.688191, -0.587785], [-0.587785, -0.425325, -0.688191], [-0.688191, -0.587785, -0.425325]];
            return $this->_m_anormsTable;
        }
        protected $_m_frames;
        public function frames() {
            if ($this->_m_frames !== null)
                return $this->_m_frames;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsFrames());
            $this->_m__raw_frames = [];
            $this->_m_frames = [];
            $n = $this->numFrames();
            for ($i = 0; $i < $n; $i++) {
                $this->_m__raw_frames[] = $this->_io->readBytes($this->bytesPerFrame());
                $_io__raw_frames = new \Kaitai\Struct\Stream(end($this->_m__raw_frames));
                $this->_m_frames[] = new \Quake2Md2\Frame($_io__raw_frames, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_frames;
        }
        protected $_m_glCmds;
        public function glCmds() {
            if ($this->_m_glCmds !== null)
                return $this->_m_glCmds;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsGlCmds());
            $this->_m__raw_glCmds = $this->_io->readBytes(4 * $this->numGlCmds());
            $_io__raw_glCmds = new \Kaitai\Struct\Stream($this->_m__raw_glCmds);
            $this->_m_glCmds = new \Quake2Md2\GlCmdsList($_io__raw_glCmds, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_glCmds;
        }
        protected $_m_skins;
        public function skins() {
            if ($this->_m_skins !== null)
                return $this->_m_skins;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsSkins());
            $this->_m_skins = [];
            $n = $this->numSkins();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_skins[] = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(64), 0, false), "ASCII");
            }
            $this->_io->seek($_pos);
            return $this->_m_skins;
        }
        protected $_m_texCoords;
        public function texCoords() {
            if ($this->_m_texCoords !== null)
                return $this->_m_texCoords;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsTexCoords());
            $this->_m_texCoords = [];
            $n = $this->numTexCoords();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_texCoords[] = new \Quake2Md2\TexPoint($this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_texCoords;
        }
        protected $_m_triangles;
        public function triangles() {
            if ($this->_m_triangles !== null)
                return $this->_m_triangles;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->ofsTriangles());
            $this->_m_triangles = [];
            $n = $this->numTriangles();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_triangles[] = new \Quake2Md2\Triangle($this->_io, $this, $this->_root);
            }
            $this->_io->seek($_pos);
            return $this->_m_triangles;
        }
        protected $_m_magic;
        protected $_m_version;
        protected $_m_skinWidthPx;
        protected $_m_skinHeightPx;
        protected $_m_bytesPerFrame;
        protected $_m_numSkins;
        protected $_m_verticesPerFrame;
        protected $_m_numTexCoords;
        protected $_m_numTriangles;
        protected $_m_numGlCmds;
        protected $_m_numFrames;
        protected $_m_ofsSkins;
        protected $_m_ofsTexCoords;
        protected $_m_ofsTriangles;
        protected $_m_ofsFrames;
        protected $_m_ofsGlCmds;
        protected $_m_ofsEof;
        protected $_m__raw_frames;
        protected $_m__raw_glCmds;
        public function magic() { return $this->_m_magic; }
        public function version() { return $this->_m_version; }
        public function skinWidthPx() { return $this->_m_skinWidthPx; }
        public function skinHeightPx() { return $this->_m_skinHeightPx; }
        public function bytesPerFrame() { return $this->_m_bytesPerFrame; }
        public function numSkins() { return $this->_m_numSkins; }
        public function verticesPerFrame() { return $this->_m_verticesPerFrame; }
        public function numTexCoords() { return $this->_m_numTexCoords; }
        public function numTriangles() { return $this->_m_numTriangles; }
        public function numGlCmds() { return $this->_m_numGlCmds; }
        public function numFrames() { return $this->_m_numFrames; }
        public function ofsSkins() { return $this->_m_ofsSkins; }
        public function ofsTexCoords() { return $this->_m_ofsTexCoords; }
        public function ofsTriangles() { return $this->_m_ofsTriangles; }
        public function ofsFrames() { return $this->_m_ofsFrames; }
        public function ofsGlCmds() { return $this->_m_ofsGlCmds; }
        public function ofsEof() { return $this->_m_ofsEof; }
        public function _raw_frames() { return $this->_m__raw_frames; }
        public function _raw_glCmds() { return $this->_m__raw_glCmds; }
    }
}

namespace Quake2Md2 {
    class CompressedVec extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2\Vertex $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_xCompressed = $this->_io->readU1();
            $this->_m_yCompressed = $this->_io->readU1();
            $this->_m_zCompressed = $this->_io->readU1();
        }
        protected $_m_x;
        public function x() {
            if ($this->_m_x !== null)
                return $this->_m_x;
            $this->_m_x = $this->xCompressed() * $this->_parent()->_parent()->scale()->x() + $this->_parent()->_parent()->translate()->x();
            return $this->_m_x;
        }
        protected $_m_y;
        public function y() {
            if ($this->_m_y !== null)
                return $this->_m_y;
            $this->_m_y = $this->yCompressed() * $this->_parent()->_parent()->scale()->y() + $this->_parent()->_parent()->translate()->y();
            return $this->_m_y;
        }
        protected $_m_z;
        public function z() {
            if ($this->_m_z !== null)
                return $this->_m_z;
            $this->_m_z = $this->zCompressed() * $this->_parent()->_parent()->scale()->z() + $this->_parent()->_parent()->translate()->z();
            return $this->_m_z;
        }
        protected $_m_xCompressed;
        protected $_m_yCompressed;
        protected $_m_zCompressed;
        public function xCompressed() { return $this->_m_xCompressed; }
        public function yCompressed() { return $this->_m_yCompressed; }
        public function zCompressed() { return $this->_m_zCompressed; }
    }
}

namespace Quake2Md2 {
    class Frame extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2 $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_scale = new \Quake2Md2\Vec3f($this->_io, $this, $this->_root);
            $this->_m_translate = new \Quake2Md2\Vec3f($this->_io, $this, $this->_root);
            $this->_m_name = \Kaitai\Struct\Stream::bytesToStr(\Kaitai\Struct\Stream::bytesTerminate($this->_io->readBytes(16), 0, false), "ASCII");
            $this->_m_vertices = [];
            $n = $this->_root()->verticesPerFrame();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_vertices[] = new \Quake2Md2\Vertex($this->_io, $this, $this->_root);
            }
        }
        protected $_m_scale;
        protected $_m_translate;
        protected $_m_name;
        protected $_m_vertices;
        public function scale() { return $this->_m_scale; }
        public function translate() { return $this->_m_translate; }
        public function name() { return $this->_m_name; }
        public function vertices() { return $this->_m_vertices; }
    }
}

namespace Quake2Md2 {
    class GlCmd extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2\GlCmdsList $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_cmdNumVertices = $this->_io->readS4le();
            $this->_m_vertices = [];
            $n = $this->numVertices();
            for ($i = 0; $i < $n; $i++) {
                $this->_m_vertices[] = new \Quake2Md2\GlVertex($this->_io, $this, $this->_root);
            }
        }
        protected $_m_numVertices;
        public function numVertices() {
            if ($this->_m_numVertices !== null)
                return $this->_m_numVertices;
            $this->_m_numVertices = ($this->cmdNumVertices() < 0 ? -($this->cmdNumVertices()) : $this->cmdNumVertices());
            return $this->_m_numVertices;
        }
        protected $_m_primitive;
        public function primitive() {
            if ($this->_m_primitive !== null)
                return $this->_m_primitive;
            $this->_m_primitive = ($this->cmdNumVertices() < 0 ? \Quake2Md2\GlPrimitive::TRIANGLE_FAN : \Quake2Md2\GlPrimitive::TRIANGLE_STRIP);
            return $this->_m_primitive;
        }
        protected $_m_cmdNumVertices;
        protected $_m_vertices;
        public function cmdNumVertices() { return $this->_m_cmdNumVertices; }
        public function vertices() { return $this->_m_vertices; }
    }
}

namespace Quake2Md2 {
    class GlCmdsList extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2 $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            if (!($this->_io()->isEof())) {
                $this->_m_items = [];
                $i = 0;
                do {
                    $_ = new \Quake2Md2\GlCmd($this->_io, $this, $this->_root);
                    $this->_m_items[] = $_;
                    $i++;
                } while (!($_->cmdNumVertices() == 0));
            }
        }
        protected $_m_items;
        public function items() { return $this->_m_items; }
    }
}

namespace Quake2Md2 {
    class GlVertex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2\GlCmd $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_texCoordsNormalized = [];
            $n = 2;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_texCoordsNormalized[] = $this->_io->readF4le();
            }
            $this->_m_vertexIndex = $this->_io->readU4le();
        }
        protected $_m_texCoordsNormalized;
        protected $_m_vertexIndex;
        public function texCoordsNormalized() { return $this->_m_texCoordsNormalized; }

        /**
         * index to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        public function vertexIndex() { return $this->_m_vertexIndex; }
    }
}

namespace Quake2Md2 {
    class TexPoint extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2 $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_sPx = $this->_io->readU2le();
            $this->_m_tPx = $this->_io->readU2le();
        }
        protected $_m_sNormalized;
        public function sNormalized() {
            if ($this->_m_sNormalized !== null)
                return $this->_m_sNormalized;
            $this->_m_sNormalized = ($this->sPx() + 0.0) / $this->_root()->skinWidthPx();
            return $this->_m_sNormalized;
        }
        protected $_m_tNormalized;
        public function tNormalized() {
            if ($this->_m_tNormalized !== null)
                return $this->_m_tNormalized;
            $this->_m_tNormalized = ($this->tPx() + 0.0) / $this->_root()->skinHeightPx();
            return $this->_m_tNormalized;
        }
        protected $_m_sPx;
        protected $_m_tPx;
        public function sPx() { return $this->_m_sPx; }
        public function tPx() { return $this->_m_tPx; }
    }
}

namespace Quake2Md2 {
    class Triangle extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2 $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_vertexIndices = [];
            $n = 3;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_vertexIndices[] = $this->_io->readU2le();
            }
            $this->_m_texPointIndices = [];
            $n = 3;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_texPointIndices[] = $this->_io->readU2le();
            }
        }
        protected $_m_vertexIndices;
        protected $_m_texPointIndices;

        /**
         * indices to `_root.frames[i].vertices` (for each frame with index `i`)
         */
        public function vertexIndices() { return $this->_m_vertexIndices; }

        /**
         * indices to `_root.tex_coords`
         */
        public function texPointIndices() { return $this->_m_texPointIndices; }
    }
}

namespace Quake2Md2 {
    class Vec3f extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2\Frame $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_x = $this->_io->readF4le();
            $this->_m_y = $this->_io->readF4le();
            $this->_m_z = $this->_io->readF4le();
        }
        protected $_m_x;
        protected $_m_y;
        protected $_m_z;
        public function x() { return $this->_m_x; }
        public function y() { return $this->_m_y; }
        public function z() { return $this->_m_z; }
    }
}

namespace Quake2Md2 {
    class Vertex extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Quake2Md2\Frame $_parent = null, ?\Quake2Md2 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_position = new \Quake2Md2\CompressedVec($this->_io, $this, $this->_root);
            $this->_m_normalIndex = $this->_io->readU1();
        }
        protected $_m_normal;
        public function normal() {
            if ($this->_m_normal !== null)
                return $this->_m_normal;
            $this->_m_normal = $this->_root()->anormsTable()[$this->normalIndex()];
            return $this->_m_normal;
        }
        protected $_m_position;
        protected $_m_normalIndex;
        public function position() { return $this->_m_position; }
        public function normalIndex() { return $this->_m_normalIndex; }
    }
}

namespace Quake2Md2 {
    class GlPrimitive {
        const TRIANGLE_STRIP = 0;
        const TRIANGLE_FAN = 1;

        private const _VALUES = [0 => true, 1 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
