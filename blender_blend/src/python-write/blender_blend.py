# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class BlenderBlend(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(BlenderBlend, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.hdr = BlenderBlend.Header(self._io, self, self._root)
        self.hdr._read()
        self.blocks = []
        i = 0
        while not self._io.is_eof():
            _t_blocks = BlenderBlend.FileBlock(self._io, self, self._root)
            try:
                _t_blocks._read()
            finally:
                self.blocks.append(_t_blocks)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.hdr._fetch_instances()
        for i in range(len(self.blocks)):
            pass
            self.blocks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(BlenderBlend, self)._write__seq(io)
        self.hdr._write__seq(self._io)
        for i in range(len(self.blocks)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())
            self.blocks[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())


    def _check(self):
        if self.hdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"hdr", self._root, self.hdr._root)
        if self.hdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"hdr", self, self.hdr._parent)
        for i in range(len(self.blocks)):
            pass
            if self.blocks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"blocks", self._root, self.blocks[i]._root)
            if self.blocks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"blocks", self, self.blocks[i]._parent)

        self._dirty = False

    class Dna1Body(ReadWriteKaitaiStruct):
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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BlenderBlend.Dna1Body, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
                _t_structs = BlenderBlend.DnaStruct(self._io, self, self._root)
                try:
                    _t_structs._read()
                finally:
                    self.structs.append(_t_structs)

            self._dirty = False


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



        def _write__seq(self, io=None):
            super(BlenderBlend.Dna1Body, self)._write__seq(io)
            self._io.write_bytes(self.id)
            self._io.write_bytes(self.name_magic)
            self._io.write_u4le(self.num_names)
            for i in range(len(self.names)):
                pass
                self._io.write_bytes((self.names[i]).encode(u"UTF-8"))
                self._io.write_u1(0)

            if len(self.padding_1) != (4 - self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"padding_1", (4 - self._io.pos()) % 4, len(self.padding_1))
            self._io.write_bytes(self.padding_1)
            self._io.write_bytes(self.type_magic)
            self._io.write_u4le(self.num_types)
            for i in range(len(self.types)):
                pass
                self._io.write_bytes((self.types[i]).encode(u"UTF-8"))
                self._io.write_u1(0)

            if len(self.padding_2) != (4 - self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"padding_2", (4 - self._io.pos()) % 4, len(self.padding_2))
            self._io.write_bytes(self.padding_2)
            self._io.write_bytes(self.tlen_magic)
            for i in range(len(self.lengths)):
                pass
                self._io.write_u2le(self.lengths[i])

            if len(self.padding_3) != (4 - self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"padding_3", (4 - self._io.pos()) % 4, len(self.padding_3))
            self._io.write_bytes(self.padding_3)
            self._io.write_bytes(self.strc_magic)
            self._io.write_u4le(self.num_structs)
            for i in range(len(self.structs)):
                pass
                self.structs[i]._write__seq(self._io)



        def _check(self):
            if len(self.id) != 4:
                raise kaitaistruct.ConsistencyError(u"id", 4, len(self.id))
            if not self.id == b"\x53\x44\x4E\x41":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x44\x4E\x41", self.id, None, u"/types/dna1_body/seq/0")
            if len(self.name_magic) != 4:
                raise kaitaistruct.ConsistencyError(u"name_magic", 4, len(self.name_magic))
            if not self.name_magic == b"\x4E\x41\x4D\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x4E\x41\x4D\x45", self.name_magic, None, u"/types/dna1_body/seq/1")
            if len(self.names) != self.num_names:
                raise kaitaistruct.ConsistencyError(u"names", self.num_names, len(self.names))
            for i in range(len(self.names)):
                pass
                if KaitaiStream.byte_array_index_of((self.names[i]).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"names", -1, KaitaiStream.byte_array_index_of((self.names[i]).encode(u"UTF-8"), 0))

            if len(self.type_magic) != 4:
                raise kaitaistruct.ConsistencyError(u"type_magic", 4, len(self.type_magic))
            if not self.type_magic == b"\x54\x59\x50\x45":
                raise kaitaistruct.ValidationNotEqualError(b"\x54\x59\x50\x45", self.type_magic, None, u"/types/dna1_body/seq/5")
            if len(self.types) != self.num_types:
                raise kaitaistruct.ConsistencyError(u"types", self.num_types, len(self.types))
            for i in range(len(self.types)):
                pass
                if KaitaiStream.byte_array_index_of((self.types[i]).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"types", -1, KaitaiStream.byte_array_index_of((self.types[i]).encode(u"UTF-8"), 0))

            if len(self.tlen_magic) != 4:
                raise kaitaistruct.ConsistencyError(u"tlen_magic", 4, len(self.tlen_magic))
            if not self.tlen_magic == b"\x54\x4C\x45\x4E":
                raise kaitaistruct.ValidationNotEqualError(b"\x54\x4C\x45\x4E", self.tlen_magic, None, u"/types/dna1_body/seq/9")
            if len(self.lengths) != self.num_types:
                raise kaitaistruct.ConsistencyError(u"lengths", self.num_types, len(self.lengths))
            for i in range(len(self.lengths)):
                pass

            if len(self.strc_magic) != 4:
                raise kaitaistruct.ConsistencyError(u"strc_magic", 4, len(self.strc_magic))
            if not self.strc_magic == b"\x53\x54\x52\x43":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\x54\x52\x43", self.strc_magic, None, u"/types/dna1_body/seq/12")
            if len(self.structs) != self.num_structs:
                raise kaitaistruct.ConsistencyError(u"structs", self.num_structs, len(self.structs))
            for i in range(len(self.structs)):
                pass
                if self.structs[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"structs", self._root, self.structs[i]._root)
                if self.structs[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"structs", self, self.structs[i]._parent)

            self._dirty = False


    class DnaField(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BlenderBlend.DnaField, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.idx_type = self._io.read_u2le()
            self.idx_name = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(BlenderBlend.DnaField, self)._write__seq(io)
            self._io.write_u2le(self.idx_type)
            self._io.write_u2le(self.idx_name)


        def _check(self):
            self._dirty = False

        @property
        def name(self):
            if hasattr(self, '_m_name'):
                return self._m_name

            self._m_name = self._parent._parent.names[self.idx_name]
            return getattr(self, '_m_name', None)

        def _invalidate_name(self):
            del self._m_name
        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = self._parent._parent.types[self.idx_type]
            return getattr(self, '_m_type', None)

        def _invalidate_type(self):
            del self._m_type

    class DnaStruct(ReadWriteKaitaiStruct):
        """DNA struct contains a `type` (type name), which is specified as
        an index in types table, and sequence of fields.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BlenderBlend.DnaStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.idx_type = self._io.read_u2le()
            self.num_fields = self._io.read_u2le()
            self.fields = []
            for i in range(self.num_fields):
                _t_fields = BlenderBlend.DnaField(self._io, self, self._root)
                try:
                    _t_fields._read()
                finally:
                    self.fields.append(_t_fields)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.fields)):
                pass
                self.fields[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(BlenderBlend.DnaStruct, self)._write__seq(io)
            self._io.write_u2le(self.idx_type)
            self._io.write_u2le(self.num_fields)
            for i in range(len(self.fields)):
                pass
                self.fields[i]._write__seq(self._io)



        def _check(self):
            if len(self.fields) != self.num_fields:
                raise kaitaistruct.ConsistencyError(u"fields", self.num_fields, len(self.fields))
            for i in range(len(self.fields)):
                pass
                if self.fields[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"fields", self._root, self.fields[i]._root)
                if self.fields[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"fields", self, self.fields[i]._parent)

            self._dirty = False

        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = self._parent.types[self.idx_type]
            return getattr(self, '_m_type', None)

        def _invalidate_type(self):
            del self._m_type

    class FileBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BlenderBlend.FileBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

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
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len_body)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.code
            if _on == u"DNA1":
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(BlenderBlend.FileBlock, self)._write__seq(io)
            self._io.write_bytes((self.code).encode(u"ASCII"))
            self._io.write_u4le(self.len_body)
            self._io.write_bytes(self.mem_addr)
            self._io.write_u4le(self.sdna_index)
            self._io.write_u4le(self.count)
            _on = self.code
            if _on == u"DNA1":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_body)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_body))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_body, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            if len((self.code).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"code", 4, len((self.code).encode(u"ASCII")))
            if len(self.mem_addr) != self._root.hdr.psize:
                raise kaitaistruct.ConsistencyError(u"mem_addr", self._root.hdr.psize, len(self.mem_addr))
            _on = self.code
            if _on == u"DNA1":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.len_body:
                    raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self.body))
            self._dirty = False

        @property
        def sdna_struct(self):
            if hasattr(self, '_m_sdna_struct'):
                return self._m_sdna_struct

            if self.sdna_index != 0:
                pass
                self._m_sdna_struct = self._root.sdna_structs[self.sdna_index]

            return getattr(self, '_m_sdna_struct', None)

        def _invalidate_sdna_struct(self):
            del self._m_sdna_struct

    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(BlenderBlend.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(7)
            if not self.magic == b"\x42\x4C\x45\x4E\x44\x45\x52":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x4C\x45\x4E\x44\x45\x52", self.magic, self._io, u"/types/header/seq/0")
            self.ptr_size_id = KaitaiStream.resolve_enum(BlenderBlend.PtrSize, self._io.read_u1())
            self.endian = KaitaiStream.resolve_enum(BlenderBlend.Endian, self._io.read_u1())
            self.version = (self._io.read_bytes(3)).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(BlenderBlend.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u1(int(self.ptr_size_id))
            self._io.write_u1(int(self.endian))
            self._io.write_bytes((self.version).encode(u"ASCII"))


        def _check(self):
            if len(self.magic) != 7:
                raise kaitaistruct.ConsistencyError(u"magic", 7, len(self.magic))
            if not self.magic == b"\x42\x4C\x45\x4E\x44\x45\x52":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x4C\x45\x4E\x44\x45\x52", self.magic, None, u"/types/header/seq/0")
            if len((self.version).encode(u"ASCII")) != 3:
                raise kaitaistruct.ConsistencyError(u"version", 3, len((self.version).encode(u"ASCII")))
            self._dirty = False

        @property
        def psize(self):
            """Number of bytes that a pointer occupies."""
            if hasattr(self, '_m_psize'):
                return self._m_psize

            self._m_psize = (8 if self.ptr_size_id == BlenderBlend.PtrSize.bits_64 else 4)
            return getattr(self, '_m_psize', None)

        def _invalidate_psize(self):
            del self._m_psize

    @property
    def sdna_structs(self):
        if hasattr(self, '_m_sdna_structs'):
            return self._m_sdna_structs

        self._m_sdna_structs = self.blocks[len(self.blocks) - 2].body.structs
        return getattr(self, '_m_sdna_structs', None)

    def _invalidate_sdna_structs(self):
        del self._m_sdna_structs

