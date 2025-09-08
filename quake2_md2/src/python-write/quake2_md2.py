# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Quake2Md2(ReadWriteKaitaiStruct):
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

    class GlPrimitive(IntEnum):
        triangle_strip = 0
        triangle_fan = 1
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Quake2Md2, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_frames = False
        self.frames__enabled = True
        self._should_write_gl_cmds = False
        self.gl_cmds__enabled = True
        self._should_write_skins = False
        self.skins__enabled = True
        self._should_write_tex_coords = False
        self.tex_coords__enabled = True
        self._should_write_triangles = False
        self.triangles__enabled = True

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
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.frames
        if hasattr(self, '_m_frames'):
            pass
            for i in range(len(self._m_frames)):
                pass
                self._m_frames[i]._fetch_instances()


        _ = self.gl_cmds
        if hasattr(self, '_m_gl_cmds'):
            pass
            self._m_gl_cmds._fetch_instances()

        _ = self.skins
        if hasattr(self, '_m_skins'):
            pass
            for i in range(len(self._m_skins)):
                pass


        _ = self.tex_coords
        if hasattr(self, '_m_tex_coords'):
            pass
            for i in range(len(self._m_tex_coords)):
                pass
                self._m_tex_coords[i]._fetch_instances()


        _ = self.triangles
        if hasattr(self, '_m_triangles'):
            pass
            for i in range(len(self._m_triangles)):
                pass
                self._m_triangles[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(Quake2Md2, self)._write__seq(io)
        self._should_write_frames = self.frames__enabled
        self._should_write_gl_cmds = self.gl_cmds__enabled
        self._should_write_skins = self.skins__enabled
        self._should_write_tex_coords = self.tex_coords__enabled
        self._should_write_triangles = self.triangles__enabled
        self._io.write_bytes(self.magic)
        self._io.write_u4le(self.version)
        self._io.write_u4le(self.skin_width_px)
        self._io.write_u4le(self.skin_height_px)
        self._io.write_u4le(self.bytes_per_frame)
        self._io.write_u4le(self.num_skins)
        self._io.write_u4le(self.vertices_per_frame)
        self._io.write_u4le(self.num_tex_coords)
        self._io.write_u4le(self.num_triangles)
        self._io.write_u4le(self.num_gl_cmds)
        self._io.write_u4le(self.num_frames)
        self._io.write_u4le(self.ofs_skins)
        self._io.write_u4le(self.ofs_tex_coords)
        self._io.write_u4le(self.ofs_triangles)
        self._io.write_u4le(self.ofs_frames)
        self._io.write_u4le(self.ofs_gl_cmds)
        self._io.write_u4le(self.ofs_eof)


    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x49\x44\x50\x32":
            raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x50\x32", self.magic, None, u"/seq/0")
        if not self.version == 8:
            raise kaitaistruct.ValidationNotEqualError(8, self.version, None, u"/seq/1")
        if self.frames__enabled:
            pass
            if len(self._m_frames) != self.num_frames:
                raise kaitaistruct.ConsistencyError(u"frames", self.num_frames, len(self._m_frames))
            for i in range(len(self._m_frames)):
                pass
                if self._m_frames[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"frames", self._root, self._m_frames[i]._root)
                if self._m_frames[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"frames", self, self._m_frames[i]._parent)


        if self.gl_cmds__enabled:
            pass
            if self._m_gl_cmds._root != self._root:
                raise kaitaistruct.ConsistencyError(u"gl_cmds", self._root, self._m_gl_cmds._root)
            if self._m_gl_cmds._parent != self:
                raise kaitaistruct.ConsistencyError(u"gl_cmds", self, self._m_gl_cmds._parent)

        if self.skins__enabled:
            pass
            if len(self._m_skins) != self.num_skins:
                raise kaitaistruct.ConsistencyError(u"skins", self.num_skins, len(self._m_skins))
            for i in range(len(self._m_skins)):
                pass
                if len((self._m_skins[i]).encode(u"ASCII")) > 64:
                    raise kaitaistruct.ConsistencyError(u"skins", 64, len((self._m_skins[i]).encode(u"ASCII")))
                if KaitaiStream.byte_array_index_of((self._m_skins[i]).encode(u"ASCII"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"skins", -1, KaitaiStream.byte_array_index_of((self._m_skins[i]).encode(u"ASCII"), 0))


        if self.tex_coords__enabled:
            pass
            if len(self._m_tex_coords) != self.num_tex_coords:
                raise kaitaistruct.ConsistencyError(u"tex_coords", self.num_tex_coords, len(self._m_tex_coords))
            for i in range(len(self._m_tex_coords)):
                pass
                if self._m_tex_coords[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"tex_coords", self._root, self._m_tex_coords[i]._root)
                if self._m_tex_coords[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"tex_coords", self, self._m_tex_coords[i]._parent)


        if self.triangles__enabled:
            pass
            if len(self._m_triangles) != self.num_triangles:
                raise kaitaistruct.ConsistencyError(u"triangles", self.num_triangles, len(self._m_triangles))
            for i in range(len(self._m_triangles)):
                pass
                if self._m_triangles[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"triangles", self._root, self._m_triangles[i]._root)
                if self._m_triangles[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"triangles", self, self._m_triangles[i]._parent)


        self._dirty = False

    class CompressedVec(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.CompressedVec, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x_compressed = self._io.read_u1()
            self.y_compressed = self._io.read_u1()
            self.z_compressed = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Quake2Md2.CompressedVec, self)._write__seq(io)
            self._io.write_u1(self.x_compressed)
            self._io.write_u1(self.y_compressed)
            self._io.write_u1(self.z_compressed)


        def _check(self):
            self._dirty = False

        @property
        def x(self):
            if hasattr(self, '_m_x'):
                return self._m_x

            self._m_x = self.x_compressed * self._parent._parent.scale.x + self._parent._parent.translate.x
            return getattr(self, '_m_x', None)

        def _invalidate_x(self):
            del self._m_x
        @property
        def y(self):
            if hasattr(self, '_m_y'):
                return self._m_y

            self._m_y = self.y_compressed * self._parent._parent.scale.y + self._parent._parent.translate.y
            return getattr(self, '_m_y', None)

        def _invalidate_y(self):
            del self._m_y
        @property
        def z(self):
            if hasattr(self, '_m_z'):
                return self._m_z

            self._m_z = self.z_compressed * self._parent._parent.scale.z + self._parent._parent.translate.z
            return getattr(self, '_m_z', None)

        def _invalidate_z(self):
            del self._m_z

    class Frame(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.Frame, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.scale = Quake2Md2.Vec3f(self._io, self, self._root)
            self.scale._read()
            self.translate = Quake2Md2.Vec3f(self._io, self, self._root)
            self.translate._read()
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"ASCII")
            self.vertices = []
            for i in range(self._root.vertices_per_frame):
                _t_vertices = Quake2Md2.Vertex(self._io, self, self._root)
                try:
                    _t_vertices._read()
                finally:
                    self.vertices.append(_t_vertices)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.scale._fetch_instances()
            self.translate._fetch_instances()
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Quake2Md2.Frame, self)._write__seq(io)
            self.scale._write__seq(self._io)
            self.translate._write__seq(self._io)
            self._io.write_bytes_limit((self.name).encode(u"ASCII"), 16, 0, 0)
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._write__seq(self._io)



        def _check(self):
            if self.scale._root != self._root:
                raise kaitaistruct.ConsistencyError(u"scale", self._root, self.scale._root)
            if self.scale._parent != self:
                raise kaitaistruct.ConsistencyError(u"scale", self, self.scale._parent)
            if self.translate._root != self._root:
                raise kaitaistruct.ConsistencyError(u"translate", self._root, self.translate._root)
            if self.translate._parent != self:
                raise kaitaistruct.ConsistencyError(u"translate", self, self.translate._parent)
            if len((self.name).encode(u"ASCII")) > 16:
                raise kaitaistruct.ConsistencyError(u"name", 16, len((self.name).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
            if len(self.vertices) != self._root.vertices_per_frame:
                raise kaitaistruct.ConsistencyError(u"vertices", self._root.vertices_per_frame, len(self.vertices))
            for i in range(len(self.vertices)):
                pass
                if self.vertices[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vertices", self._root, self.vertices[i]._root)
                if self.vertices[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vertices", self, self.vertices[i]._parent)

            self._dirty = False


    class GlCmd(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.GlCmd, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.cmd_num_vertices = self._io.read_s4le()
            self.vertices = []
            for i in range(self.num_vertices):
                _t_vertices = Quake2Md2.GlVertex(self._io, self, self._root)
                try:
                    _t_vertices._read()
                finally:
                    self.vertices.append(_t_vertices)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Quake2Md2.GlCmd, self)._write__seq(io)
            self._io.write_s4le(self.cmd_num_vertices)
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._write__seq(self._io)



        def _check(self):
            if len(self.vertices) != self.num_vertices:
                raise kaitaistruct.ConsistencyError(u"vertices", self.num_vertices, len(self.vertices))
            for i in range(len(self.vertices)):
                pass
                if self.vertices[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vertices", self._root, self.vertices[i]._root)
                if self.vertices[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vertices", self, self.vertices[i]._parent)

            self._dirty = False

        @property
        def num_vertices(self):
            if hasattr(self, '_m_num_vertices'):
                return self._m_num_vertices

            self._m_num_vertices = (-(self.cmd_num_vertices) if self.cmd_num_vertices < 0 else self.cmd_num_vertices)
            return getattr(self, '_m_num_vertices', None)

        def _invalidate_num_vertices(self):
            del self._m_num_vertices
        @property
        def primitive(self):
            if hasattr(self, '_m_primitive'):
                return self._m_primitive

            self._m_primitive = (Quake2Md2.GlPrimitive.triangle_fan if self.cmd_num_vertices < 0 else Quake2Md2.GlPrimitive.triangle_strip)
            return getattr(self, '_m_primitive', None)

        def _invalidate_primitive(self):
            del self._m_primitive

    class GlCmdsList(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.GlCmdsList, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            if (not (self._io.is_eof())):
                pass
                self.items = []
                i = 0
                while True:
                    _t_items = Quake2Md2.GlCmd(self._io, self, self._root)
                    try:
                        _t_items._read()
                    finally:
                        _ = _t_items
                        self.items.append(_)
                    if _.cmd_num_vertices == 0:
                        break
                    i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            if (not (self._io.is_eof())):
                pass
                for i in range(len(self.items)):
                    pass
                    self.items[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(Quake2Md2.GlCmdsList, self)._write__seq(io)
            if (not (self._io.is_eof())):
                pass
                if len(self.items) == 0:
                    raise kaitaistruct.ConsistencyError(u"items", 0, len(self.items))
                for i in range(len(self.items)):
                    pass
                    if self.items[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"items", self._root, self.items[i]._root)
                    if self.items[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"items", self, self.items[i]._parent)
                    self.items[i]._write__seq(self._io)
                    _ = self.items[i]
                    if (_.cmd_num_vertices == 0) != (i == len(self.items) - 1):
                        raise kaitaistruct.ConsistencyError(u"items", i == len(self.items) - 1, _.cmd_num_vertices == 0)




        def _check(self):
            self._dirty = False


    class GlVertex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.GlVertex, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.tex_coords_normalized = []
            for i in range(2):
                self.tex_coords_normalized.append(self._io.read_f4le())

            self.vertex_index = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.tex_coords_normalized)):
                pass



        def _write__seq(self, io=None):
            super(Quake2Md2.GlVertex, self)._write__seq(io)
            for i in range(len(self.tex_coords_normalized)):
                pass
                self._io.write_f4le(self.tex_coords_normalized[i])

            self._io.write_u4le(self.vertex_index)


        def _check(self):
            if len(self.tex_coords_normalized) != 2:
                raise kaitaistruct.ConsistencyError(u"tex_coords_normalized", 2, len(self.tex_coords_normalized))
            for i in range(len(self.tex_coords_normalized)):
                pass

            self._dirty = False


    class TexPoint(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.TexPoint, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.s_px = self._io.read_u2le()
            self.t_px = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Quake2Md2.TexPoint, self)._write__seq(io)
            self._io.write_u2le(self.s_px)
            self._io.write_u2le(self.t_px)


        def _check(self):
            self._dirty = False

        @property
        def s_normalized(self):
            if hasattr(self, '_m_s_normalized'):
                return self._m_s_normalized

            self._m_s_normalized = (self.s_px + 0.0) / self._root.skin_width_px
            return getattr(self, '_m_s_normalized', None)

        def _invalidate_s_normalized(self):
            del self._m_s_normalized
        @property
        def t_normalized(self):
            if hasattr(self, '_m_t_normalized'):
                return self._m_t_normalized

            self._m_t_normalized = (self.t_px + 0.0) / self._root.skin_height_px
            return getattr(self, '_m_t_normalized', None)

        def _invalidate_t_normalized(self):
            del self._m_t_normalized

    class Triangle(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.Triangle, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.vertex_indices = []
            for i in range(3):
                self.vertex_indices.append(self._io.read_u2le())

            self.tex_point_indices = []
            for i in range(3):
                self.tex_point_indices.append(self._io.read_u2le())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.vertex_indices)):
                pass

            for i in range(len(self.tex_point_indices)):
                pass



        def _write__seq(self, io=None):
            super(Quake2Md2.Triangle, self)._write__seq(io)
            for i in range(len(self.vertex_indices)):
                pass
                self._io.write_u2le(self.vertex_indices[i])

            for i in range(len(self.tex_point_indices)):
                pass
                self._io.write_u2le(self.tex_point_indices[i])



        def _check(self):
            if len(self.vertex_indices) != 3:
                raise kaitaistruct.ConsistencyError(u"vertex_indices", 3, len(self.vertex_indices))
            for i in range(len(self.vertex_indices)):
                pass

            if len(self.tex_point_indices) != 3:
                raise kaitaistruct.ConsistencyError(u"tex_point_indices", 3, len(self.tex_point_indices))
            for i in range(len(self.tex_point_indices)):
                pass

            self._dirty = False


    class Vec3f(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.Vec3f, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Quake2Md2.Vec3f, self)._write__seq(io)
            self._io.write_f4le(self.x)
            self._io.write_f4le(self.y)
            self._io.write_f4le(self.z)


        def _check(self):
            self._dirty = False


    class Vertex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Quake2Md2.Vertex, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.position = Quake2Md2.CompressedVec(self._io, self, self._root)
            self.position._read()
            self.normal_index = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.position._fetch_instances()


        def _write__seq(self, io=None):
            super(Quake2Md2.Vertex, self)._write__seq(io)
            self.position._write__seq(self._io)
            self._io.write_u1(self.normal_index)


        def _check(self):
            if self.position._root != self._root:
                raise kaitaistruct.ConsistencyError(u"position", self._root, self.position._root)
            if self.position._parent != self:
                raise kaitaistruct.ConsistencyError(u"position", self, self.position._parent)
            self._dirty = False

        @property
        def normal(self):
            if hasattr(self, '_m_normal'):
                return self._m_normal

            self._m_normal = self._root.anorms_table[self.normal_index]
            return getattr(self, '_m_normal', None)

        def _invalidate_normal(self):
            del self._m_normal

    @property
    def anim_names(self):
        if hasattr(self, '_m_anim_names'):
            return self._m_anim_names

        self._m_anim_names = [u"stand", u"run", u"attack", u"pain1", u"pain2", u"pain3", u"jump", u"flip", u"salute", u"taunt", u"wave", u"point", u"crstnd", u"crwalk", u"crattak", u"crpain", u"crdeath", u"death1", u"death2", u"death3"]
        return getattr(self, '_m_anim_names', None)

    def _invalidate_anim_names(self):
        del self._m_anim_names
    @property
    def anim_num_frames(self):
        if hasattr(self, '_m_anim_num_frames'):
            return self._m_anim_num_frames

        self._m_anim_num_frames = b"\x28\x06\x08\x04\x04\x04\x06\x0C\x0B\x11\x0B\x0C\x13\x06\x09\x04\x05\x06\x06\x08"
        return getattr(self, '_m_anim_num_frames', None)

    def _invalidate_anim_num_frames(self):
        del self._m_anim_num_frames
    @property
    def anim_start_indices(self):
        if hasattr(self, '_m_anim_start_indices'):
            return self._m_anim_start_indices

        self._m_anim_start_indices = b"\x00\x28\x2E\x36\x3A\x3E\x42\x48\x54\x5F\x70\x7B\x87\x9A\xA0\xA9\xAD\xB2\xB8\xBE"
        return getattr(self, '_m_anim_start_indices', None)

    def _invalidate_anim_start_indices(self):
        del self._m_anim_start_indices
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

    def _invalidate_anorms_table(self):
        del self._m_anorms_table
    @property
    def frames(self):
        if self._should_write_frames:
            self._write_frames()
        if hasattr(self, '_m_frames'):
            return self._m_frames

        if not self.frames__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_frames)
        self._raw__m_frames = []
        self._m_frames = []
        for i in range(self.num_frames):
            self._raw__m_frames.append(self._io.read_bytes(self.bytes_per_frame))
            _io__raw__m_frames = KaitaiStream(BytesIO(self._raw__m_frames[i]))
            _t__m_frames = Quake2Md2.Frame(_io__raw__m_frames, self, self._root)
            try:
                _t__m_frames._read()
            finally:
                self._m_frames.append(_t__m_frames)

        self._io.seek(_pos)
        return getattr(self, '_m_frames', None)

    @frames.setter
    def frames(self, v):
        self._dirty = True
        self._m_frames = v

    def _write_frames(self):
        self._should_write_frames = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_frames)
        self._raw__m_frames = []
        for i in range(len(self._m_frames)):
            pass
            _io__raw__m_frames = KaitaiStream(BytesIO(bytearray(self.bytes_per_frame)))
            self._io.add_child_stream(_io__raw__m_frames)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.bytes_per_frame))
            def handler(parent, _io__raw__m_frames=_io__raw__m_frames, i=i):
                self._raw__m_frames.append(_io__raw__m_frames.to_byte_array())
                if len(self._raw__m_frames[i]) != self.bytes_per_frame:
                    raise kaitaistruct.ConsistencyError(u"raw(frames)", self.bytes_per_frame, len(self._raw__m_frames[i]))
                parent.write_bytes(self._raw__m_frames[i])
            _io__raw__m_frames.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_frames[i]._write__seq(_io__raw__m_frames)

        self._io.seek(_pos)

    @property
    def gl_cmds(self):
        if self._should_write_gl_cmds:
            self._write_gl_cmds()
        if hasattr(self, '_m_gl_cmds'):
            return self._m_gl_cmds

        if not self.gl_cmds__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_gl_cmds)
        self._raw__m_gl_cmds = self._io.read_bytes(4 * self.num_gl_cmds)
        _io__raw__m_gl_cmds = KaitaiStream(BytesIO(self._raw__m_gl_cmds))
        self._m_gl_cmds = Quake2Md2.GlCmdsList(_io__raw__m_gl_cmds, self, self._root)
        self._m_gl_cmds._read()
        self._io.seek(_pos)
        return getattr(self, '_m_gl_cmds', None)

    @gl_cmds.setter
    def gl_cmds(self, v):
        self._dirty = True
        self._m_gl_cmds = v

    def _write_gl_cmds(self):
        self._should_write_gl_cmds = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_gl_cmds)
        _io__raw__m_gl_cmds = KaitaiStream(BytesIO(bytearray(4 * self.num_gl_cmds)))
        self._io.add_child_stream(_io__raw__m_gl_cmds)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (4 * self.num_gl_cmds))
        def handler(parent, _io__raw__m_gl_cmds=_io__raw__m_gl_cmds):
            self._raw__m_gl_cmds = _io__raw__m_gl_cmds.to_byte_array()
            if len(self._raw__m_gl_cmds) != 4 * self.num_gl_cmds:
                raise kaitaistruct.ConsistencyError(u"raw(gl_cmds)", 4 * self.num_gl_cmds, len(self._raw__m_gl_cmds))
            parent.write_bytes(self._raw__m_gl_cmds)
        _io__raw__m_gl_cmds.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_gl_cmds._write__seq(_io__raw__m_gl_cmds)
        self._io.seek(_pos)

    @property
    def skins(self):
        if self._should_write_skins:
            self._write_skins()
        if hasattr(self, '_m_skins'):
            return self._m_skins

        if not self.skins__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_skins)
        self._m_skins = []
        for i in range(self.num_skins):
            self._m_skins.append((KaitaiStream.bytes_terminate(self._io.read_bytes(64), 0, False)).decode(u"ASCII"))

        self._io.seek(_pos)
        return getattr(self, '_m_skins', None)

    @skins.setter
    def skins(self, v):
        self._dirty = True
        self._m_skins = v

    def _write_skins(self):
        self._should_write_skins = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_skins)
        for i in range(len(self._m_skins)):
            pass
            self._io.write_bytes_limit((self._m_skins[i]).encode(u"ASCII"), 64, 0, 0)

        self._io.seek(_pos)

    @property
    def tex_coords(self):
        if self._should_write_tex_coords:
            self._write_tex_coords()
        if hasattr(self, '_m_tex_coords'):
            return self._m_tex_coords

        if not self.tex_coords__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_tex_coords)
        self._m_tex_coords = []
        for i in range(self.num_tex_coords):
            _t__m_tex_coords = Quake2Md2.TexPoint(self._io, self, self._root)
            try:
                _t__m_tex_coords._read()
            finally:
                self._m_tex_coords.append(_t__m_tex_coords)

        self._io.seek(_pos)
        return getattr(self, '_m_tex_coords', None)

    @tex_coords.setter
    def tex_coords(self, v):
        self._dirty = True
        self._m_tex_coords = v

    def _write_tex_coords(self):
        self._should_write_tex_coords = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_tex_coords)
        for i in range(len(self._m_tex_coords)):
            pass
            self._m_tex_coords[i]._write__seq(self._io)

        self._io.seek(_pos)

    @property
    def triangles(self):
        if self._should_write_triangles:
            self._write_triangles()
        if hasattr(self, '_m_triangles'):
            return self._m_triangles

        if not self.triangles__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_triangles)
        self._m_triangles = []
        for i in range(self.num_triangles):
            _t__m_triangles = Quake2Md2.Triangle(self._io, self, self._root)
            try:
                _t__m_triangles._read()
            finally:
                self._m_triangles.append(_t__m_triangles)

        self._io.seek(_pos)
        return getattr(self, '_m_triangles', None)

    @triangles.setter
    def triangles(self, v):
        self._dirty = True
        self._m_triangles = v

    def _write_triangles(self):
        self._should_write_triangles = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_triangles)
        for i in range(len(self._m_triangles)):
            pass
            self._m_triangles[i]._write__seq(self._io)

        self._io.seek(_pos)


