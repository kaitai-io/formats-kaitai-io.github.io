# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class Quake2Md2(KaitaiStruct):
    """The MD2 format is used for 3D animated models in id Sofware's Quake II.
    
    A model consists of named `frames`, each with the same number of `vertices`
    (`vertices_per_frame`). Each such vertex has a `position` and `normal` in
    model space. Each vertex has the same topological "meaning" across frames, in
    terms of triangle and texture info; it just varies in position and normal for
    animation purposes.
    
    How the vertices form triangles is defined via disjoint `triangles` or via
    `gl_cmds` (which allows strip and fan topology). Each triangle contains three
    `vertex_indices` into frame vertices, and three `tex_point_indices` into
    global `tex_coords`. Each texture point has pixel coords `s_px` and `t_px`
    ranging from 0 to `skin_{width,height}_px` respectively, along with
    `{s,t}_normalized` ranging from 0 to 1 for your convenience.
    
    A GL command has a `primitive` type (`TRIANGLE_FAN` or `TRIANGLE_STRIP`) along
    with some `vertices`. Each GL vertex contains `tex_coords_normalized` from 0
    to 1, and a `vertex_index` into frame vertices.
    
    A model may also contain `skins`, which are just file paths to PCX images.
    However, this is empty for many models, in which case it is up to the client
    (e.g. Q2PRO) to offer skins some other way (e.g. by similar filename in the
    current directory).
    
    There are 198 `frames` in total, partitioned into a fixed set of ranges used
    for different animations. Each frame has a standard `name` for humans, but the
    client just uses their index and the name can be arbitrary. The name, start
    frame index and frame count of each animation can be looked up in the arrays
    `anim_names`, `anim_start_indices`, and `anim_num_frames` respectively. This
    information is summarized in the following table:
    
    ```
    |   INDEX  |    NAME | SUFFIX | NOTES                                                  |
    |:--------:|--------:|:-------|:-------------------------------------------------------|
    |    0-39  |   stand | 01-40  | Idle animation                                         |
    |   40-45  |     run | 1-6    | Full run cycle                                         |
    |   46-53  |  attack | 1-8    | Shoot, reload; some weapons just repeat 1st few frames |
    |   54-57  |   pain1 | 01-04  | Q2Pro also uses this for switching weapons             |
    |   58-61  |   pain2 | 01-04  |                                                        |
    |   62-65  |   pain3 | 01-04  |                                                        |
    |   66-71  |    jump | 1-6    | Starts at height and lands on feet                     |
    |   72-83  |    flip | 01-12  | Flipoff, i.e. middle finger                            |
    |   84-94  |  salute | 01-11  |                                                        |
    |   95-111 |   taunt | 01-17  |                                                        |
    |  112-122 |    wave | 01-11  | Q2Pro plays this backwards for a handgrenade toss      |
    |  123-134 |   point | 01-12  |                                                        |
    |  135-153 |  crstnd | 01-19  | Idle while crouching                                   |
    |  154-159 |  crwalk | 1-6    |                                                        |
    |  160-168 | crattak | 1-9    |                                                        |
    |  169-172 |  crpain | 1-4    |                                                        |
    |  173-177 | crdeath | 1-5    |                                                        |
    |  178-183 |  death1 | 01-06  |                                                        |
    |  184-189 |  death2 | 01-06  |                                                        |
    |  190-197 |  death3 | 01-08  |                                                        |
    ```
    
    The above are filled in for player models; for the separate weapon models,
    the final frame is 173 "g_view" (unknown purpose) since weapons aren't shown
    during death animations. `a_grenades.md2`, the handgrenade weapon model, is
    the same except that the `wave` frames are blank (according to the default
    female model files). This is likely due to its dual use as a grenade throw
    animation where this model must leave the player's model.
    
    .. seealso::
       Source - https://icculus.org/~phaethon/q3a/formats/md2-schoenblum.html
    
    
    .. seealso::
       Source - http://tfc.duke.free.fr/coding/md2-specs-en.html
    
    
    .. seealso::
       Source - http://tastyspleen.net/~panjoo/downloads/quake2_model_frames.html
    
    
    .. seealso::
       Source - http://wiki.polycount.com/wiki/OldSiteResourcesQuake2FramesList
    """

    class GlPrimitive(Enum):
        triangle_strip = 0
        triangle_fan = 1
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x49\x44\x50\x32":
            raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x50\x32", self.magic, self._io, u"/seq/0")
        self.version = self._io.read_u4le()
        if not self.version == 8:
            raise kaitaistruct.ValidationNotEqualError(8, self.version, self._io, u"/seq/1")
        self.skin_width_px = self._io.read_u4le()
        self.skin_height_px = self._io.read_u4le()
        self.bytes_per_frame = self._io.read_u4le()
        self.num_skins = self._io.read_u4le()
        self.vertices_per_frame = self._io.read_u4le()
        self.num_tex_coords = self._io.read_u4le()
        self.num_triangles = self._io.read_u4le()
        self.num_gl_cmds = self._io.read_u4le()
        self.num_frames = self._io.read_u4le()
        self.ofs_skins = self._io.read_u4le()
        self.ofs_tex_coords = self._io.read_u4le()
        self.ofs_triangles = self._io.read_u4le()
        self.ofs_frames = self._io.read_u4le()
        self.ofs_gl_cmds = self._io.read_u4le()
        self.ofs_eof = self._io.read_u4le()

    class Vertex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.position = Quake2Md2.CompressedVec(self._io, self, self._root)
            self.normal_index = self._io.read_u1()

        @property
        def normal(self):
            if hasattr(self, '_m_normal'):
                return self._m_normal

            self._m_normal = self._root.anorms_table[self.normal_index]
            return getattr(self, '_m_normal', None)


    class CompressedVec(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x_compressed = self._io.read_u1()
            self.y_compressed = self._io.read_u1()
            self.z_compressed = self._io.read_u1()

        @property
        def x(self):
            if hasattr(self, '_m_x'):
                return self._m_x

            self._m_x = ((self.x_compressed * self._parent._parent.scale.x) + self._parent._parent.translate.x)
            return getattr(self, '_m_x', None)

        @property
        def y(self):
            if hasattr(self, '_m_y'):
                return self._m_y

            self._m_y = ((self.y_compressed * self._parent._parent.scale.y) + self._parent._parent.translate.y)
            return getattr(self, '_m_y', None)

        @property
        def z(self):
            if hasattr(self, '_m_z'):
                return self._m_z

            self._m_z = ((self.z_compressed * self._parent._parent.scale.z) + self._parent._parent.translate.z)
            return getattr(self, '_m_z', None)


    class Triangle(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.vertex_indices = []
            for i in range(3):
                self.vertex_indices.append(self._io.read_u2le())

            self.tex_point_indices = []
            for i in range(3):
                self.tex_point_indices.append(self._io.read_u2le())



    class Frame(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.scale = Quake2Md2.Vec3f(self._io, self, self._root)
            self.translate = Quake2Md2.Vec3f(self._io, self, self._root)
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"ascii")
            self.vertices = []
            for i in range(self._root.vertices_per_frame):
                self.vertices.append(Quake2Md2.Vertex(self._io, self, self._root))



    class GlCmdsList(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            if not (self._io.is_eof()):
                self.items = []
                i = 0
                while True:
                    _ = Quake2Md2.GlCmd(self._io, self, self._root)
                    self.items.append(_)
                    if _.cmd_num_vertices == 0:
                        break
                    i += 1



    class TexPoint(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.s_px = self._io.read_u2le()
            self.t_px = self._io.read_u2le()

        @property
        def s_normalized(self):
            if hasattr(self, '_m_s_normalized'):
                return self._m_s_normalized

            self._m_s_normalized = ((self.s_px + 0.0) / self._root.skin_width_px)
            return getattr(self, '_m_s_normalized', None)

        @property
        def t_normalized(self):
            if hasattr(self, '_m_t_normalized'):
                return self._m_t_normalized

            self._m_t_normalized = ((self.t_px + 0.0) / self._root.skin_height_px)
            return getattr(self, '_m_t_normalized', None)


    class Vec3f(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()


    class GlVertex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.tex_coords_normalized = []
            for i in range(2):
                self.tex_coords_normalized.append(self._io.read_f4le())

            self.vertex_index = self._io.read_u4le()


    class GlCmd(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.cmd_num_vertices = self._io.read_s4le()
            self.vertices = []
            for i in range(self.num_vertices):
                self.vertices.append(Quake2Md2.GlVertex(self._io, self, self._root))


        @property
        def num_vertices(self):
            if hasattr(self, '_m_num_vertices'):
                return self._m_num_vertices

            self._m_num_vertices = (-(self.cmd_num_vertices) if self.cmd_num_vertices < 0 else self.cmd_num_vertices)
            return getattr(self, '_m_num_vertices', None)

        @property
        def primitive(self):
            if hasattr(self, '_m_primitive'):
                return self._m_primitive

            self._m_primitive = (Quake2Md2.GlPrimitive.triangle_fan if self.cmd_num_vertices < 0 else Quake2Md2.GlPrimitive.triangle_strip)
            return getattr(self, '_m_primitive', None)


    @property
    def anim_num_frames(self):
        if hasattr(self, '_m_anim_num_frames'):
            return self._m_anim_num_frames

        self._m_anim_num_frames = b"\x28\x06\x08\x04\x04\x04\x06\x0C\x0B\x11\x0B\x0C\x13\x06\x09\x04\x05\x06\x06\x08"
        return getattr(self, '_m_anim_num_frames', None)

    @property
    def anorms_table(self):
        """
        .. seealso::
           Quake anorms.h - https://github.com/skullernet/q2pro/blob/f4faabd/src/common/math.c#L80
           from
        """
        if hasattr(self, '_m_anorms_table'):
            return self._m_anorms_table

        self._m_anorms_table = [[-0.525731, 0.000000, 0.850651], [-0.442863, 0.238856, 0.864188], [-0.295242, 0.000000, 0.955423], [-0.309017, 0.500000, 0.809017], [-0.162460, 0.262866, 0.951056], [0.000000, 0.000000, 1.000000], [0.000000, 0.850651, 0.525731], [-0.147621, 0.716567, 0.681718], [0.147621, 0.716567, 0.681718], [0.000000, 0.525731, 0.850651], [0.309017, 0.500000, 0.809017], [0.525731, 0.000000, 0.850651], [0.295242, 0.000000, 0.955423], [0.442863, 0.238856, 0.864188], [0.162460, 0.262866, 0.951056], [-0.681718, 0.147621, 0.716567], [-0.809017, 0.309017, 0.500000], [-0.587785, 0.425325, 0.688191], [-0.850651, 0.525731, 0.000000], [-0.864188, 0.442863, 0.238856], [-0.716567, 0.681718, 0.147621], [-0.688191, 0.587785, 0.425325], [-0.500000, 0.809017, 0.309017], [-0.238856, 0.864188, 0.442863], [-0.425325, 0.688191, 0.587785], [-0.716567, 0.681718, -0.147621], [-0.500000, 0.809017, -0.309017], [-0.525731, 0.850651, 0.000000], [0.000000, 0.850651, -0.525731], [-0.238856, 0.864188, -0.442863], [0.000000, 0.955423, -0.295242], [-0.262866, 0.951056, -0.162460], [0.000000, 1.000000, 0.000000], [0.000000, 0.955423, 0.295242], [-0.262866, 0.951056, 0.162460], [0.238856, 0.864188, 0.442863], [0.262866, 0.951056, 0.162460], [0.500000, 0.809017, 0.309017], [0.238856, 0.864188, -0.442863], [0.262866, 0.951056, -0.162460], [0.500000, 0.809017, -0.309017], [0.850651, 0.525731, 0.000000], [0.716567, 0.681718, 0.147621], [0.716567, 0.681718, -0.147621], [0.525731, 0.850651, 0.000000], [0.425325, 0.688191, 0.587785], [0.864188, 0.442863, 0.238856], [0.688191, 0.587785, 0.425325], [0.809017, 0.309017, 0.500000], [0.681718, 0.147621, 0.716567], [0.587785, 0.425325, 0.688191], [0.955423, 0.295242, 0.000000], [1.000000, 0.000000, 0.000000], [0.951056, 0.162460, 0.262866], [0.850651, -0.525731, 0.000000], [0.955423, -0.295242, 0.000000], [0.864188, -0.442863, 0.238856], [0.951056, -0.162460, 0.262866], [0.809017, -0.309017, 0.500000], [0.681718, -0.147621, 0.716567], [0.850651, 0.000000, 0.525731], [0.864188, 0.442863, -0.238856], [0.809017, 0.309017, -0.500000], [0.951056, 0.162460, -0.262866], [0.525731, 0.000000, -0.850651], [0.681718, 0.147621, -0.716567], [0.681718, -0.147621, -0.716567], [0.850651, 0.000000, -0.525731], [0.809017, -0.309017, -0.500000], [0.864188, -0.442863, -0.238856], [0.951056, -0.162460, -0.262866], [0.147621, 0.716567, -0.681718], [0.309017, 0.500000, -0.809017], [0.425325, 0.688191, -0.587785], [0.442863, 0.238856, -0.864188], [0.587785, 0.425325, -0.688191], [0.688191, 0.587785, -0.425325], [-0.147621, 0.716567, -0.681718], [-0.309017, 0.500000, -0.809017], [0.000000, 0.525731, -0.850651], [-0.525731, 0.000000, -0.850651], [-0.442863, 0.238856, -0.864188], [-0.295242, 0.000000, -0.955423], [-0.162460, 0.262866, -0.951056], [0.000000, 0.000000, -1.000000], [0.295242, 0.000000, -0.955423], [0.162460, 0.262866, -0.951056], [-0.442863, -0.238856, -0.864188], [-0.309017, -0.500000, -0.809017], [-0.162460, -0.262866, -0.951056], [0.000000, -0.850651, -0.525731], [-0.147621, -0.716567, -0.681718], [0.147621, -0.716567, -0.681718], [0.000000, -0.525731, -0.850651], [0.309017, -0.500000, -0.809017], [0.442863, -0.238856, -0.864188], [0.162460, -0.262866, -0.951056], [0.238856, -0.864188, -0.442863], [0.500000, -0.809017, -0.309017], [0.425325, -0.688191, -0.587785], [0.716567, -0.681718, -0.147621], [0.688191, -0.587785, -0.425325], [0.587785, -0.425325, -0.688191], [0.000000, -0.955423, -0.295242], [0.000000, -1.000000, 0.000000], [0.262866, -0.951056, -0.162460], [0.000000, -0.850651, 0.525731], [0.000000, -0.955423, 0.295242], [0.238856, -0.864188, 0.442863], [0.262866, -0.951056, 0.162460], [0.500000, -0.809017, 0.309017], [0.716567, -0.681718, 0.147621], [0.525731, -0.850651, 0.000000], [-0.238856, -0.864188, -0.442863], [-0.500000, -0.809017, -0.309017], [-0.262866, -0.951056, -0.162460], [-0.850651, -0.525731, 0.000000], [-0.716567, -0.681718, -0.147621], [-0.716567, -0.681718, 0.147621], [-0.525731, -0.850651, 0.000000], [-0.500000, -0.809017, 0.309017], [-0.238856, -0.864188, 0.442863], [-0.262866, -0.951056, 0.162460], [-0.864188, -0.442863, 0.238856], [-0.809017, -0.309017, 0.500000], [-0.688191, -0.587785, 0.425325], [-0.681718, -0.147621, 0.716567], [-0.442863, -0.238856, 0.864188], [-0.587785, -0.425325, 0.688191], [-0.309017, -0.500000, 0.809017], [-0.147621, -0.716567, 0.681718], [-0.425325, -0.688191, 0.587785], [-0.162460, -0.262866, 0.951056], [0.442863, -0.238856, 0.864188], [0.162460, -0.262866, 0.951056], [0.309017, -0.500000, 0.809017], [0.147621, -0.716567, 0.681718], [0.000000, -0.525731, 0.850651], [0.425325, -0.688191, 0.587785], [0.587785, -0.425325, 0.688191], [0.688191, -0.587785, 0.425325], [-0.955423, 0.295242, 0.000000], [-0.951056, 0.162460, 0.262866], [-1.000000, 0.000000, 0.000000], [-0.850651, 0.000000, 0.525731], [-0.955423, -0.295242, 0.000000], [-0.951056, -0.162460, 0.262866], [-0.864188, 0.442863, -0.238856], [-0.951056, 0.162460, -0.262866], [-0.809017, 0.309017, -0.500000], [-0.864188, -0.442863, -0.238856], [-0.951056, -0.162460, -0.262866], [-0.809017, -0.309017, -0.500000], [-0.681718, 0.147621, -0.716567], [-0.681718, -0.147621, -0.716567], [-0.850651, 0.000000, -0.525731], [-0.688191, 0.587785, -0.425325], [-0.587785, 0.425325, -0.688191], [-0.425325, 0.688191, -0.587785], [-0.425325, -0.688191, -0.587785], [-0.587785, -0.425325, -0.688191], [-0.688191, -0.587785, -0.425325]]
        return getattr(self, '_m_anorms_table', None)

    @property
    def tex_coords(self):
        if hasattr(self, '_m_tex_coords'):
            return self._m_tex_coords

        _pos = self._io.pos()
        self._io.seek(self.ofs_tex_coords)
        self._m_tex_coords = []
        for i in range(self.num_tex_coords):
            self._m_tex_coords.append(Quake2Md2.TexPoint(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_tex_coords', None)

    @property
    def triangles(self):
        if hasattr(self, '_m_triangles'):
            return self._m_triangles

        _pos = self._io.pos()
        self._io.seek(self.ofs_triangles)
        self._m_triangles = []
        for i in range(self.num_triangles):
            self._m_triangles.append(Quake2Md2.Triangle(self._io, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_triangles', None)

    @property
    def frames(self):
        if hasattr(self, '_m_frames'):
            return self._m_frames

        _pos = self._io.pos()
        self._io.seek(self.ofs_frames)
        self._raw__m_frames = []
        self._m_frames = []
        for i in range(self.num_frames):
            self._raw__m_frames.append(self._io.read_bytes(self.bytes_per_frame))
            _io__raw__m_frames = KaitaiStream(BytesIO(self._raw__m_frames[i]))
            self._m_frames.append(Quake2Md2.Frame(_io__raw__m_frames, self, self._root))

        self._io.seek(_pos)
        return getattr(self, '_m_frames', None)

    @property
    def anim_names(self):
        if hasattr(self, '_m_anim_names'):
            return self._m_anim_names

        self._m_anim_names = [u"stand", u"run", u"attack", u"pain1", u"pain2", u"pain3", u"jump", u"flip", u"salute", u"taunt", u"wave", u"point", u"crstnd", u"crwalk", u"crattak", u"crpain", u"crdeath", u"death1", u"death2", u"death3"]
        return getattr(self, '_m_anim_names', None)

    @property
    def gl_cmds(self):
        if hasattr(self, '_m_gl_cmds'):
            return self._m_gl_cmds

        _pos = self._io.pos()
        self._io.seek(self.ofs_gl_cmds)
        self._raw__m_gl_cmds = self._io.read_bytes((4 * self.num_gl_cmds))
        _io__raw__m_gl_cmds = KaitaiStream(BytesIO(self._raw__m_gl_cmds))
        self._m_gl_cmds = Quake2Md2.GlCmdsList(_io__raw__m_gl_cmds, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_gl_cmds', None)

    @property
    def skins(self):
        if hasattr(self, '_m_skins'):
            return self._m_skins

        _pos = self._io.pos()
        self._io.seek(self.ofs_skins)
        self._m_skins = []
        for i in range(self.num_skins):
            self._m_skins.append((KaitaiStream.bytes_terminate(self._io.read_bytes(64), 0, False)).decode(u"ascii"))

        self._io.seek(_pos)
        return getattr(self, '_m_skins', None)

    @property
    def anim_start_indices(self):
        if hasattr(self, '_m_anim_start_indices'):
            return self._m_anim_start_indices

        self._m_anim_start_indices = b"\x00\x28\x2E\x36\x3A\x3E\x42\x48\x54\x5F\x70\x7B\x87\x9A\xA0\xA9\xAD\xB2\xB8\xBE"
        return getattr(self, '_m_anim_start_indices', None)


