# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class QuakeMdl(ReadWriteKaitaiStruct):
    """Quake 1 model format is used to store 3D models completely with
    textures and animations used in the game. Quake 1 engine
    (retroactively named "idtech2") is a popular 3D engine first used
    for Quake game by id Software in 1996.
    
    Model is constructed traditionally from vertices in 3D space, faces
    which connect vertices, textures ("skins", i.e. 2D bitmaps) and
    texture UV mapping information. As opposed to more modern,
    bones-based animation formats, Quake model was animated by changing
    locations of all vertices it included in 3D space, frame by frame.
    
    File format stores:
    
    * "Skins" — effectively 2D bitmaps which will be used as a
      texture. Every model can have multiple skins — e.g. these can be
      switched to depict various levels of damage to the
      monsters. Bitmaps are 8-bit-per-pixel, indexed in global Quake
      palette, subject to lighting and gamma adjustment when rendering
      in the game using colormap technique.
    * "Texture coordinates" — UV coordinates, mapping 3D vertices to
      skin coordinates.
    * "Triangles" — triangular faces connecting 3D vertices.
    * "Frames" — locations of vertices in 3D space; can include more
      than one frame, thus allowing representation of different frames
      for animation purposes.
    
    Originally, 3D geometry for models for Quake was designed in [Alias
    PowerAnimator](https://en.wikipedia.org/wiki/PowerAnimator),
    precursor of modern day Autodesk Maya and Autodesk Alias. Therefore,
    3D-related part of Quake model format followed closely Alias TRI
    format, and Quake development utilities included a converter from Alias
    TRI (`modelgen`).
    
    Skins (textures) where prepared as LBM bitmaps with the help from
    `texmap` utility in the same development utilities toolkit.
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(QuakeMdl, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = QuakeMdl.MdlHeader(self._io, self, self._root)
        self.header._read()
        self.skins = []
        for i in range(self.header.num_skins):
            _t_skins = QuakeMdl.MdlSkin(self._io, self, self._root)
            try:
                _t_skins._read()
            finally:
                self.skins.append(_t_skins)

        self.texture_coordinates = []
        for i in range(self.header.num_verts):
            _t_texture_coordinates = QuakeMdl.MdlTexcoord(self._io, self, self._root)
            try:
                _t_texture_coordinates._read()
            finally:
                self.texture_coordinates.append(_t_texture_coordinates)

        self.triangles = []
        for i in range(self.header.num_tris):
            _t_triangles = QuakeMdl.MdlTriangle(self._io, self, self._root)
            try:
                _t_triangles._read()
            finally:
                self.triangles.append(_t_triangles)

        self.frames = []
        for i in range(self.header.num_frames):
            _t_frames = QuakeMdl.MdlFrame(self._io, self, self._root)
            try:
                _t_frames._read()
            finally:
                self.frames.append(_t_frames)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.skins)):
            pass
            self.skins[i]._fetch_instances()

        for i in range(len(self.texture_coordinates)):
            pass
            self.texture_coordinates[i]._fetch_instances()

        for i in range(len(self.triangles)):
            pass
            self.triangles[i]._fetch_instances()

        for i in range(len(self.frames)):
            pass
            self.frames[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(QuakeMdl, self)._write__seq(io)
        self.header._write__seq(self._io)
        for i in range(len(self.skins)):
            pass
            self.skins[i]._write__seq(self._io)

        for i in range(len(self.texture_coordinates)):
            pass
            self.texture_coordinates[i]._write__seq(self._io)

        for i in range(len(self.triangles)):
            pass
            self.triangles[i]._write__seq(self._io)

        for i in range(len(self.frames)):
            pass
            self.frames[i]._write__seq(self._io)



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.skins) != self.header.num_skins:
            raise kaitaistruct.ConsistencyError(u"skins", self.header.num_skins, len(self.skins))
        for i in range(len(self.skins)):
            pass
            if self.skins[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"skins", self._root, self.skins[i]._root)
            if self.skins[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"skins", self, self.skins[i]._parent)

        if len(self.texture_coordinates) != self.header.num_verts:
            raise kaitaistruct.ConsistencyError(u"texture_coordinates", self.header.num_verts, len(self.texture_coordinates))
        for i in range(len(self.texture_coordinates)):
            pass
            if self.texture_coordinates[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"texture_coordinates", self._root, self.texture_coordinates[i]._root)
            if self.texture_coordinates[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"texture_coordinates", self, self.texture_coordinates[i]._parent)

        if len(self.triangles) != self.header.num_tris:
            raise kaitaistruct.ConsistencyError(u"triangles", self.header.num_tris, len(self.triangles))
        for i in range(len(self.triangles)):
            pass
            if self.triangles[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"triangles", self._root, self.triangles[i]._root)
            if self.triangles[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"triangles", self, self.triangles[i]._parent)

        if len(self.frames) != self.header.num_frames:
            raise kaitaistruct.ConsistencyError(u"frames", self.header.num_frames, len(self.frames))
        for i in range(len(self.frames)):
            pass
            if self.frames[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"frames", self._root, self.frames[i]._root)
            if self.frames[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"frames", self, self.frames[i]._parent)

        self._dirty = False

    class MdlFrame(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.MdlFrame, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.type = self._io.read_s4le()
            if self.type != 0:
                pass
                self.min = QuakeMdl.MdlVertex(self._io, self, self._root)
                self.min._read()

            if self.type != 0:
                pass
                self.max = QuakeMdl.MdlVertex(self._io, self, self._root)
                self.max._read()

            if self.type != 0:
                pass
                self.time = []
                for i in range(self.type):
                    self.time.append(self._io.read_f4le())


            self.frames = []
            for i in range(self.num_simple_frames):
                _t_frames = QuakeMdl.MdlSimpleFrame(self._io, self, self._root)
                try:
                    _t_frames._read()
                finally:
                    self.frames.append(_t_frames)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.type != 0:
                pass
                self.min._fetch_instances()

            if self.type != 0:
                pass
                self.max._fetch_instances()

            if self.type != 0:
                pass
                for i in range(len(self.time)):
                    pass


            for i in range(len(self.frames)):
                pass
                self.frames[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(QuakeMdl.MdlFrame, self)._write__seq(io)
            self._io.write_s4le(self.type)
            if self.type != 0:
                pass
                self.min._write__seq(self._io)

            if self.type != 0:
                pass
                self.max._write__seq(self._io)

            if self.type != 0:
                pass
                for i in range(len(self.time)):
                    pass
                    self._io.write_f4le(self.time[i])


            for i in range(len(self.frames)):
                pass
                self.frames[i]._write__seq(self._io)



        def _check(self):
            if self.type != 0:
                pass
                if self.min._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"min", self._root, self.min._root)
                if self.min._parent != self:
                    raise kaitaistruct.ConsistencyError(u"min", self, self.min._parent)

            if self.type != 0:
                pass
                if self.max._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"max", self._root, self.max._root)
                if self.max._parent != self:
                    raise kaitaistruct.ConsistencyError(u"max", self, self.max._parent)

            if self.type != 0:
                pass
                if len(self.time) != self.type:
                    raise kaitaistruct.ConsistencyError(u"time", self.type, len(self.time))
                for i in range(len(self.time)):
                    pass


            if len(self.frames) != self.num_simple_frames:
                raise kaitaistruct.ConsistencyError(u"frames", self.num_simple_frames, len(self.frames))
            for i in range(len(self.frames)):
                pass
                if self.frames[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"frames", self._root, self.frames[i]._root)
                if self.frames[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"frames", self, self.frames[i]._parent)

            self._dirty = False

        @property
        def num_simple_frames(self):
            if hasattr(self, '_m_num_simple_frames'):
                return self._m_num_simple_frames

            self._m_num_simple_frames = (1 if self.type == 0 else self.type)
            return getattr(self, '_m_num_simple_frames', None)

        def _invalidate_num_simple_frames(self):
            del self._m_num_simple_frames

    class MdlHeader(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75
        
        
        .. seealso::
           Source - https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.MdlHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.ident = self._io.read_bytes(4)
            if not self.ident == b"\x49\x44\x50\x4F":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x50\x4F", self.ident, self._io, u"/types/mdl_header/seq/0")
            self.version = self._io.read_s4le()
            if not self.version == 6:
                raise kaitaistruct.ValidationNotEqualError(6, self.version, self._io, u"/types/mdl_header/seq/1")
            self.scale = QuakeMdl.Vec3(self._io, self, self._root)
            self.scale._read()
            self.origin = QuakeMdl.Vec3(self._io, self, self._root)
            self.origin._read()
            self.radius = self._io.read_f4le()
            self.eye_position = QuakeMdl.Vec3(self._io, self, self._root)
            self.eye_position._read()
            self.num_skins = self._io.read_s4le()
            self.skin_width = self._io.read_s4le()
            self.skin_height = self._io.read_s4le()
            self.num_verts = self._io.read_s4le()
            self.num_tris = self._io.read_s4le()
            self.num_frames = self._io.read_s4le()
            self.synctype = self._io.read_s4le()
            self.flags = self._io.read_s4le()
            self.size = self._io.read_f4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.scale._fetch_instances()
            self.origin._fetch_instances()
            self.eye_position._fetch_instances()


        def _write__seq(self, io=None):
            super(QuakeMdl.MdlHeader, self)._write__seq(io)
            self._io.write_bytes(self.ident)
            self._io.write_s4le(self.version)
            self.scale._write__seq(self._io)
            self.origin._write__seq(self._io)
            self._io.write_f4le(self.radius)
            self.eye_position._write__seq(self._io)
            self._io.write_s4le(self.num_skins)
            self._io.write_s4le(self.skin_width)
            self._io.write_s4le(self.skin_height)
            self._io.write_s4le(self.num_verts)
            self._io.write_s4le(self.num_tris)
            self._io.write_s4le(self.num_frames)
            self._io.write_s4le(self.synctype)
            self._io.write_s4le(self.flags)
            self._io.write_f4le(self.size)


        def _check(self):
            if len(self.ident) != 4:
                raise kaitaistruct.ConsistencyError(u"ident", 4, len(self.ident))
            if not self.ident == b"\x49\x44\x50\x4F":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x50\x4F", self.ident, None, u"/types/mdl_header/seq/0")
            if not self.version == 6:
                raise kaitaistruct.ValidationNotEqualError(6, self.version, None, u"/types/mdl_header/seq/1")
            if self.scale._root != self._root:
                raise kaitaistruct.ConsistencyError(u"scale", self._root, self.scale._root)
            if self.scale._parent != self:
                raise kaitaistruct.ConsistencyError(u"scale", self, self.scale._parent)
            if self.origin._root != self._root:
                raise kaitaistruct.ConsistencyError(u"origin", self._root, self.origin._root)
            if self.origin._parent != self:
                raise kaitaistruct.ConsistencyError(u"origin", self, self.origin._parent)
            if self.eye_position._root != self._root:
                raise kaitaistruct.ConsistencyError(u"eye_position", self._root, self.eye_position._root)
            if self.eye_position._parent != self:
                raise kaitaistruct.ConsistencyError(u"eye_position", self, self.eye_position._parent)
            self._dirty = False

        @property
        def skin_size(self):
            """Skin size in pixels.
            """
            if hasattr(self, '_m_skin_size'):
                return self._m_skin_size

            self._m_skin_size = self.skin_width * self.skin_height
            return getattr(self, '_m_skin_size', None)

        def _invalidate_skin_size(self):
            del self._m_skin_size

    class MdlSimpleFrame(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.MdlSimpleFrame, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bbox_min = QuakeMdl.MdlVertex(self._io, self, self._root)
            self.bbox_min._read()
            self.bbox_max = QuakeMdl.MdlVertex(self._io, self, self._root)
            self.bbox_max._read()
            self.name = (KaitaiStream.bytes_terminate(self._io.read_bytes(16), 0, False)).decode(u"ASCII")
            self.vertices = []
            for i in range(self._root.header.num_verts):
                _t_vertices = QuakeMdl.MdlVertex(self._io, self, self._root)
                try:
                    _t_vertices._read()
                finally:
                    self.vertices.append(_t_vertices)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.bbox_min._fetch_instances()
            self.bbox_max._fetch_instances()
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(QuakeMdl.MdlSimpleFrame, self)._write__seq(io)
            self.bbox_min._write__seq(self._io)
            self.bbox_max._write__seq(self._io)
            self._io.write_bytes_limit((self.name).encode(u"ASCII"), 16, 0, 0)
            for i in range(len(self.vertices)):
                pass
                self.vertices[i]._write__seq(self._io)



        def _check(self):
            if self.bbox_min._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bbox_min", self._root, self.bbox_min._root)
            if self.bbox_min._parent != self:
                raise kaitaistruct.ConsistencyError(u"bbox_min", self, self.bbox_min._parent)
            if self.bbox_max._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bbox_max", self._root, self.bbox_max._root)
            if self.bbox_max._parent != self:
                raise kaitaistruct.ConsistencyError(u"bbox_max", self, self.bbox_max._parent)
            if len((self.name).encode(u"ASCII")) > 16:
                raise kaitaistruct.ConsistencyError(u"name", 16, len((self.name).encode(u"ASCII")))
            if KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of((self.name).encode(u"ASCII"), 0))
            if len(self.vertices) != self._root.header.num_verts:
                raise kaitaistruct.ConsistencyError(u"vertices", self._root.header.num_verts, len(self.vertices))
            for i in range(len(self.vertices)):
                pass
                if self.vertices[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vertices", self._root, self.vertices[i]._root)
                if self.vertices[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vertices", self, self.vertices[i]._parent)

            self._dirty = False


    class MdlSkin(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.MdlSkin, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.group = self._io.read_s4le()
            if self.group == 0:
                pass
                self.single_texture_data = self._io.read_bytes(self._root.header.skin_size)

            if self.group != 0:
                pass
                self.num_frames = self._io.read_u4le()

            if self.group != 0:
                pass
                self.frame_times = []
                for i in range(self.num_frames):
                    self.frame_times.append(self._io.read_f4le())


            if self.group != 0:
                pass
                self.group_texture_data = []
                for i in range(self.num_frames):
                    self.group_texture_data.append(self._io.read_bytes(self._root.header.skin_size))


            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.group == 0:
                pass

            if self.group != 0:
                pass

            if self.group != 0:
                pass
                for i in range(len(self.frame_times)):
                    pass


            if self.group != 0:
                pass
                for i in range(len(self.group_texture_data)):
                    pass




        def _write__seq(self, io=None):
            super(QuakeMdl.MdlSkin, self)._write__seq(io)
            self._io.write_s4le(self.group)
            if self.group == 0:
                pass
                self._io.write_bytes(self.single_texture_data)

            if self.group != 0:
                pass
                self._io.write_u4le(self.num_frames)

            if self.group != 0:
                pass
                for i in range(len(self.frame_times)):
                    pass
                    self._io.write_f4le(self.frame_times[i])


            if self.group != 0:
                pass
                for i in range(len(self.group_texture_data)):
                    pass
                    self._io.write_bytes(self.group_texture_data[i])




        def _check(self):
            if self.group == 0:
                pass
                if len(self.single_texture_data) != self._root.header.skin_size:
                    raise kaitaistruct.ConsistencyError(u"single_texture_data", self._root.header.skin_size, len(self.single_texture_data))

            if self.group != 0:
                pass

            if self.group != 0:
                pass
                if len(self.frame_times) != self.num_frames:
                    raise kaitaistruct.ConsistencyError(u"frame_times", self.num_frames, len(self.frame_times))
                for i in range(len(self.frame_times)):
                    pass


            if self.group != 0:
                pass
                if len(self.group_texture_data) != self.num_frames:
                    raise kaitaistruct.ConsistencyError(u"group_texture_data", self.num_frames, len(self.group_texture_data))
                for i in range(len(self.group_texture_data)):
                    pass
                    if len(self.group_texture_data[i]) != self._root.header.skin_size:
                        raise kaitaistruct.ConsistencyError(u"group_texture_data", self._root.header.skin_size, len(self.group_texture_data[i]))


            self._dirty = False


    class MdlTexcoord(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83
        
        
        .. seealso::
           Source - https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.MdlTexcoord, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.on_seam = self._io.read_s4le()
            self.s = self._io.read_s4le()
            self.t = self._io.read_s4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(QuakeMdl.MdlTexcoord, self)._write__seq(io)
            self._io.write_s4le(self.on_seam)
            self._io.write_s4le(self.s)
            self._io.write_s4le(self.t)


        def _check(self):
            self._dirty = False


    class MdlTriangle(ReadWriteKaitaiStruct):
        """Represents a triangular face, connecting 3 vertices, referenced
        by their indexes.
        
        .. seealso::
           Source - https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88
        
        
        .. seealso::
           Source - https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.MdlTriangle, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.faces_front = self._io.read_s4le()
            self.vertices = []
            for i in range(3):
                self.vertices.append(self._io.read_s4le())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.vertices)):
                pass



        def _write__seq(self, io=None):
            super(QuakeMdl.MdlTriangle, self)._write__seq(io)
            self._io.write_s4le(self.faces_front)
            for i in range(len(self.vertices)):
                pass
                self._io.write_s4le(self.vertices[i])



        def _check(self):
            if len(self.vertices) != 3:
                raise kaitaistruct.ConsistencyError(u"vertices", 3, len(self.vertices))
            for i in range(len(self.vertices)):
                pass

            self._dirty = False


    class MdlVertex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.MdlVertex, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.values = []
            for i in range(3):
                self.values.append(self._io.read_u1())

            self.normal_index = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.values)):
                pass



        def _write__seq(self, io=None):
            super(QuakeMdl.MdlVertex, self)._write__seq(io)
            for i in range(len(self.values)):
                pass
                self._io.write_u1(self.values[i])

            self._io.write_u1(self.normal_index)


        def _check(self):
            if len(self.values) != 3:
                raise kaitaistruct.ConsistencyError(u"values", 3, len(self.values))
            for i in range(len(self.values)):
                pass

            self._dirty = False


    class Vec3(ReadWriteKaitaiStruct):
        """Basic 3D vector (x, y, z) using single-precision floating point
        coordnates. Can be used to specify a point in 3D space,
        direction, scaling factor, etc.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(QuakeMdl.Vec3, self).__init__(_io)
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
            super(QuakeMdl.Vec3, self)._write__seq(io)
            self._io.write_f4le(self.x)
            self._io.write_f4le(self.y)
            self._io.write_f4le(self.z)


        def _check(self):
            self._dirty = False



