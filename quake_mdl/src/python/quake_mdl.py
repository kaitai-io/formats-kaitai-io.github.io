# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class QuakeMdl(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = QuakeMdl.MdlHeader(self._io, self, self._root)
        self.skins = []
        for i in range(self.header.num_skins):
            self.skins.append(QuakeMdl.MdlSkin(self._io, self, self._root))

        self.texture_coordinates = []
        for i in range(self.header.num_verts):
            self.texture_coordinates.append(QuakeMdl.MdlTexcoord(self._io, self, self._root))

        self.triangles = []
        for i in range(self.header.num_tris):
            self.triangles.append(QuakeMdl.MdlTriangle(self._io, self, self._root))

        self.frames = []
        for i in range(self.header.num_frames):
            self.frames.append(QuakeMdl.MdlFrame(self._io, self, self._root))


    class MdlVertex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.values = []
            for i in range(3):
                self.values.append(self._io.read_u1())

            self.normal_index = self._io.read_u1()


    class MdlTexcoord(KaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L79-L83
        
        
        .. seealso::
           Source - https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD2
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.on_seam = self._io.read_s4le()
            self.s = self._io.read_s4le()
            self.t = self._io.read_s4le()


    class MdlHeader(KaitaiStruct):
        """
        .. seealso::
           Source - https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L59-L75
        
        
        .. seealso::
           Source - https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD0
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.ident = self._io.read_bytes(4)
            if not self.ident == b"\x49\x44\x50\x4F":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x50\x4F", self.ident, self._io, u"/types/mdl_header/seq/0")
            self.version = self._io.read_s4le()
            if not self.version == 6:
                raise kaitaistruct.ValidationNotEqualError(6, self.version, self._io, u"/types/mdl_header/seq/1")
            self.scale = QuakeMdl.Vec3(self._io, self, self._root)
            self.origin = QuakeMdl.Vec3(self._io, self, self._root)
            self.radius = self._io.read_f4le()
            self.eye_position = QuakeMdl.Vec3(self._io, self, self._root)
            self.num_skins = self._io.read_s4le()
            self.skin_width = self._io.read_s4le()
            self.skin_height = self._io.read_s4le()
            self.num_verts = self._io.read_s4le()
            self.num_tris = self._io.read_s4le()
            self.num_frames = self._io.read_s4le()
            self.synctype = self._io.read_s4le()
            self.flags = self._io.read_s4le()
            self.size = self._io.read_f4le()

        @property
        def skin_size(self):
            """Skin size in pixels.
            """
            if hasattr(self, '_m_skin_size'):
                return self._m_skin_size

            self._m_skin_size = (self.skin_width * self.skin_height)
            return getattr(self, '_m_skin_size', None)


    class MdlSkin(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.group = self._io.read_s4le()
            if self.group == 0:
                self.single_texture_data = self._io.read_bytes(self._root.header.skin_size)

            if self.group != 0:
                self.num_frames = self._io.read_u4le()

            if self.group != 0:
                self.frame_times = []
                for i in range(self.num_frames):
                    self.frame_times.append(self._io.read_f4le())


            if self.group != 0:
                self.group_texture_data = []
                for i in range(self.num_frames):
                    self.group_texture_data.append(self._io.read_bytes(self._root.header.skin_size))




    class MdlFrame(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.type = self._io.read_s4le()
            if self.type != 0:
                self.min = QuakeMdl.MdlVertex(self._io, self, self._root)

            if self.type != 0:
                self.max = QuakeMdl.MdlVertex(self._io, self, self._root)

            if self.type != 0:
                self.time = []
                for i in range(self.type):
                    self.time.append(self._io.read_f4le())


            self.frames = []
            for i in range(self.num_simple_frames):
                self.frames.append(QuakeMdl.MdlSimpleFrame(self._io, self, self._root))


        @property
        def num_simple_frames(self):
            if hasattr(self, '_m_num_simple_frames'):
                return self._m_num_simple_frames

            self._m_num_simple_frames = (1 if self.type == 0 else self.type)
            return getattr(self, '_m_num_simple_frames', None)


    class MdlSimpleFrame(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.bbox_min = QuakeMdl.MdlVertex(self._io, self, self._root)
            self.bbox_max = QuakeMdl.MdlVertex(self._io, self, self._root)
            self.name = (KaitaiStream.bytes_terminate(KaitaiStream.bytes_strip_right(self._io.read_bytes(16), 0), 0, False)).decode(u"ASCII")
            self.vertices = []
            for i in range(self._root.header.num_verts):
                self.vertices.append(QuakeMdl.MdlVertex(self._io, self, self._root))



    class MdlTriangle(KaitaiStruct):
        """Represents a triangular face, connecting 3 vertices, referenced
        by their indexes.
        
        .. seealso::
           Source - https://github.com/id-Software/Quake/blob/0023db327bc1db00068284b70e1db45857aeee35/WinQuake/modelgen.h#L85-L88
        
        
        .. seealso::
           Source - https://www.gamers.org/dEngine/quake/spec/quake-spec34/qkspec_5.htm#MD3
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.faces_front = self._io.read_s4le()
            self.vertices = []
            for i in range(3):
                self.vertices.append(self._io.read_s4le())



    class Vec3(KaitaiStruct):
        """Basic 3D vector (x, y, z) using single-precision floating point
        coordnates. Can be used to specify a point in 3D space,
        direction, scaling factor, etc.
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.x = self._io.read_f4le()
            self.y = self._io.read_f4le()
            self.z = self._io.read_f4le()



