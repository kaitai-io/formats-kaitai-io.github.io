# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class BlenderBlend(KaitaiStruct):
    """Blender is an open source suite for 3D modelling, sculpting,
    animation, compositing, rendering, preparation of assets for its own
    game engine and exporting to others, etc. `.blend` is its own binary
    format that saves whole state of suite: current scene, animations,
    all software settings, extensions, etc.
    
    Internally, .blend format is a hybrid semi-self-descriptive
    format. On top level, it contains a simple header and a sequence of
    file blocks, which more or less follow typical [TLV
    pattern](https://en.wikipedia.org/wiki/Type-length-value). Pre-last
    block would be a structure with code `DNA1`, which is a essentially
    a machine-readable schema of all other structures used in this file.
    """

    class Endian(IntEnum):
        be = 86
        le = 118

    class PtrSize(IntEnum):
        bits_64 = 45
        bits_32 = 95
    def __init__(self, _io, _parent=None, _root=None):
        super(BlenderBlend, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.hdr = BlenderBlend.Header(self._io, self, self._root)
        self.blocks = []
        i = 0
        while not self._io.is_eof():
            self.blocks.append(BlenderBlend.FileBlock(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        self.hdr._fetch_instances()
        for i in range(len(self.blocks)):
            pass
            self.blocks[i]._fetch_instances()


    class Dna1Body(KaitaiStruct):
        """DNA1, also known as "Structure DNA", is a special block in
        .blend file, which contains machine-readable specifications of
        all other structures used in this .blend file.
        
        Effectively, this block contains:
        
        * a sequence of "names" (strings which represent field names)
        * a sequence of "types" (strings which represent type name)
        * a sequence of "type lengths"
        * a sequence of "structs" (which describe contents of every
          structure, referring to types and names by index)
        
        .. seealso::
           Source - https://archive.blender.org/wiki/index.php/Dev:Source/Architecture/File_Format/#Structure_DNA
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(BlenderBlend.Dna1Body, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = self._io.read_bytes(4)
            if not self.id == b"\x53\x44\x4E\x41":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x44\x4E\x41", self.id, self._io, u"/types/dna1_body/seq/0")
            self.name_magic = self._io.read_bytes(4)
            if not self.name_magic == b"\x4E\x41\x4D\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E\x41\x4D\x45", self.name_magic, self._io, u"/types/dna1_body/seq/1")
            self.num_names = self._io.read_u4le()
            self.names = []
            for i in range(self.num_names):
                self.names.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))

            self.padding_1 = self._io.read_bytes((4 - self._io.pos()) % 4)
            self.type_magic = self._io.read_bytes(4)
            if not self.type_magic == b"\x54\x59\x50\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x54\x59\x50\x45", self.type_magic, self._io, u"/types/dna1_body/seq/5")
            self.num_types = self._io.read_u4le()
            self.types = []
            for i in range(self.num_types):
                self.types.append((self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8"))

            self.padding_2 = self._io.read_bytes((4 - self._io.pos()) % 4)
            self.tlen_magic = self._io.read_bytes(4)
            if not self.tlen_magic == b"\x54\x4C\x45\x4E":
                raise kaitaistruct.ValidationNotEqualError(b"\x54\x4C\x45\x4E", self.tlen_magic, self._io, u"/types/dna1_body/seq/9")
            self.lengths = []
            for i in range(self.num_types):
                self.lengths.append(self._io.read_u2le())

            self.padding_3 = self._io.read_bytes((4 - self._io.pos()) % 4)
            self.strc_magic = self._io.read_bytes(4)
            if not self.strc_magic == b"\x53\x54\x52\x43":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x54\x52\x43", self.strc_magic, self._io, u"/types/dna1_body/seq/12")
            self.num_structs = self._io.read_u4le()
            self.structs = []
            for i in range(self.num_structs):
                self.structs.append(BlenderBlend.DnaStruct(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.names)):
                pass

            for i in range(len(self.types)):
                pass

            for i in range(len(self.lengths)):
                pass

            for i in range(len(self.structs)):
                pass
                self.structs[i]._fetch_instances()



    class DnaField(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(BlenderBlend.DnaField, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.idx_type = self._io.read_u2le()
            self.idx_name = self._io.read_u2le()


        def _fetch_instances(self):
            pass

        @property
        def name(self):
            if hasattr(self, '_m_name'):
                return self._m_name

            self._m_name = self._parent._parent.names[self.idx_name]
            return getattr(self, '_m_name', None)

        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = self._parent._parent.types[self.idx_type]
            return getattr(self, '_m_type', None)


    class DnaStruct(KaitaiStruct):
        """DNA struct contains a `type` (type name), which is specified as
        an index in types table, and sequence of fields.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(BlenderBlend.DnaStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.idx_type = self._io.read_u2le()
            self.num_fields = self._io.read_u2le()
            self.fields = []
            for i in range(self.num_fields):
                self.fields.append(BlenderBlend.DnaField(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.fields)):
                pass
                self.fields[i]._fetch_instances()


        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = self._parent.types[self.idx_type]
            return getattr(self, '_m_type', None)


    class FileBlock(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(BlenderBlend.FileBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.code = (self._io.read_bytes(4)).decode(u"ASCII")
            self.len_body = self._io.read_u4le()
            self.mem_addr = self._io.read_bytes(self._root.hdr.psize)
            self.sdna_index = self._io.read_u4le()
            self.count = self._io.read_u4le()
            _on = self.code
            if _on == u"DNA1":
                pass
                self._raw_body = self._io.read_bytes(self.len_body)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = BlenderBlend.Dna1Body(_io__raw_body, self, self._root)
            else:
                pass
                self.body = self._io.read_bytes(self.len_body)


        def _fetch_instances(self):
            pass
            _on = self.code
            if _on == u"DNA1":
                pass
                self.body._fetch_instances()
            else:
                pass

        @property
        def sdna_struct(self):
            if hasattr(self, '_m_sdna_struct'):
                return self._m_sdna_struct

            if self.sdna_index != 0:
                pass
                self._m_sdna_struct = self._root.sdna_structs[self.sdna_index]

            return getattr(self, '_m_sdna_struct', None)


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(BlenderBlend.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(7)
            if not self.magic == b"\x42\x4C\x45\x4E\x44\x45\x52":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x4C\x45\x4E\x44\x45\x52", self.magic, self._io, u"/types/header/seq/0")
            self.ptr_size_id = KaitaiStream.resolve_enum(BlenderBlend.PtrSize, self._io.read_u1())
            self.endian = KaitaiStream.resolve_enum(BlenderBlend.Endian, self._io.read_u1())
            self.version = (self._io.read_bytes(3)).decode(u"ASCII")


        def _fetch_instances(self):
            pass

        @property
        def psize(self):
            """Number of bytes that a pointer occupies."""
            if hasattr(self, '_m_psize'):
                return self._m_psize

            self._m_psize = (8 if self.ptr_size_id == BlenderBlend.PtrSize.bits_64 else 4)
            return getattr(self, '_m_psize', None)


    @property
    def sdna_structs(self):
        if hasattr(self, '_m_sdna_structs'):
            return self._m_sdna_structs

        self._m_sdna_structs = self.blocks[len(self.blocks) - 2].body.structs
        return getattr(self, '_m_sdna_structs', None)


