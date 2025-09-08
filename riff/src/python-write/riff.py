# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Riff(ReadWriteKaitaiStruct):
    """The Resource Interchange File Format (RIFF) is a generic file container format
    for storing data in tagged chunks. It is primarily used to store multimedia
    such as sound and video, though it may also be used to store any arbitrary data.
    
    The Microsoft implementation is mostly known through container formats
    like AVI, ANI and WAV, which use RIFF as their basis.
    
    .. seealso::
       Source - https://www.johnloomis.org/cpe102/asgn/asgn1/riff.html
    """

    class Fourcc(IntEnum):
        riff = 1179011410
        info = 1330007625
        list = 1414744396
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Riff, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_parent_chunk_data = False
        self.parent_chunk_data__enabled = True
        self._should_write_subchunks = False
        self.subchunks__enabled = True

    def _read(self):
        self.chunk = Riff.Chunk(self._io, self, self._root)
        self.chunk._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.chunk._fetch_instances()
        _ = self.parent_chunk_data
        if hasattr(self, '_m_parent_chunk_data'):
            pass
            self._m_parent_chunk_data._fetch_instances()

        _ = self.subchunks
        if hasattr(self, '_m_subchunks'):
            pass
            for i in range(len(self._m_subchunks)):
                pass
                self._m_subchunks[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(Riff, self)._write__seq(io)
        self._should_write_parent_chunk_data = self.parent_chunk_data__enabled
        self._should_write_subchunks = self.subchunks__enabled
        self.chunk._write__seq(self._io)


    def _check(self):
        if self.chunk._root != self._root:
            raise kaitaistruct.ConsistencyError(u"chunk", self._root, self.chunk._root)
        if self.chunk._parent != self:
            raise kaitaistruct.ConsistencyError(u"chunk", self, self.chunk._parent)
        if self.parent_chunk_data__enabled:
            pass
            if self.is_riff_chunk:
                pass
                if self._m_parent_chunk_data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"parent_chunk_data", self._root, self._m_parent_chunk_data._root)
                if self._m_parent_chunk_data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"parent_chunk_data", self, self._m_parent_chunk_data._parent)


        if self.subchunks__enabled:
            pass
            if self.is_riff_chunk:
                pass
                for i in range(len(self._m_subchunks)):
                    pass
                    if self._m_subchunks[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"subchunks", self._root, self._m_subchunks[i]._root)
                    if self._m_subchunks[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"subchunks", self, self._m_subchunks[i]._parent)



        self._dirty = False

    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Riff.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u4le()
            self.len = self._io.read_u4le()
            self._raw_data_slot = self._io.read_bytes(self.len)
            _io__raw_data_slot = KaitaiStream(BytesIO(self._raw_data_slot))
            self.data_slot = Riff.Chunk.Slot(_io__raw_data_slot, self, self._root)
            self.data_slot._read()
            self.pad_byte = self._io.read_bytes(self.len % 2)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.data_slot._fetch_instances()


        def _write__seq(self, io=None):
            super(Riff.Chunk, self)._write__seq(io)
            self._io.write_u4le(self.id)
            self._io.write_u4le(self.len)
            _io__raw_data_slot = KaitaiStream(BytesIO(bytearray(self.len)))
            self._io.add_child_stream(_io__raw_data_slot)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len))
            def handler(parent, _io__raw_data_slot=_io__raw_data_slot):
                self._raw_data_slot = _io__raw_data_slot.to_byte_array()
                if len(self._raw_data_slot) != self.len:
                    raise kaitaistruct.ConsistencyError(u"raw(data_slot)", self.len, len(self._raw_data_slot))
                parent.write_bytes(self._raw_data_slot)
            _io__raw_data_slot.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.data_slot._write__seq(_io__raw_data_slot)
            self._io.write_bytes(self.pad_byte)


        def _check(self):
            if self.data_slot._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data_slot", self._root, self.data_slot._root)
            if self.data_slot._parent != self:
                raise kaitaistruct.ConsistencyError(u"data_slot", self, self.data_slot._parent)
            if len(self.pad_byte) != self.len % 2:
                raise kaitaistruct.ConsistencyError(u"pad_byte", self.len % 2, len(self.pad_byte))
            self._dirty = False

        class Slot(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Riff.Chunk.Slot, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                pass
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Riff.Chunk.Slot, self)._write__seq(io)


            def _check(self):
                self._dirty = False



    class ChunkType(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Riff.ChunkType, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_chunk_data = False
            self.chunk_data__enabled = True
            self._should_write_chunk_id_readable = False
            self.chunk_id_readable__enabled = True

        def _read(self):
            if self.chunk_ofs < 0:
                pass
                self.save_chunk_ofs = self._io.read_bytes(0)

            self.chunk = Riff.Chunk(self._io, self, self._root)
            self.chunk._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.chunk_ofs < 0:
                pass

            self.chunk._fetch_instances()
            _ = self.chunk_data
            if hasattr(self, '_m_chunk_data'):
                pass
                _on = self.chunk_id
                if _on == Riff.Fourcc.list:
                    pass
                    self._m_chunk_data._fetch_instances()

            _ = self.chunk_id_readable
            if hasattr(self, '_m_chunk_id_readable'):
                pass



        def _write__seq(self, io=None):
            super(Riff.ChunkType, self)._write__seq(io)
            self._should_write_chunk_data = self.chunk_data__enabled
            self._should_write_chunk_id_readable = self.chunk_id_readable__enabled
            if self.chunk_ofs < 0:
                pass
                if len(self.save_chunk_ofs) != 0:
                    raise kaitaistruct.ConsistencyError(u"save_chunk_ofs", 0, len(self.save_chunk_ofs))
                self._io.write_bytes(self.save_chunk_ofs)

            self.chunk._write__seq(self._io)


        def _check(self):
            if self.chunk._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chunk", self._root, self.chunk._root)
            if self.chunk._parent != self:
                raise kaitaistruct.ConsistencyError(u"chunk", self, self.chunk._parent)
            if self.chunk_data__enabled:
                pass
                _on = self.chunk_id
                if _on == Riff.Fourcc.list:
                    pass
                    if self._m_chunk_data._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"chunk_data", self._root, self._m_chunk_data._root)
                    if self._m_chunk_data._parent != self:
                        raise kaitaistruct.ConsistencyError(u"chunk_data", self, self._m_chunk_data._parent)

            if self.chunk_id_readable__enabled:
                pass
                if len((self._m_chunk_id_readable).encode(u"ASCII")) != 4:
                    raise kaitaistruct.ConsistencyError(u"chunk_id_readable", 4, len((self._m_chunk_id_readable).encode(u"ASCII")))

            self._dirty = False

        @property
        def chunk_data(self):
            if self._should_write_chunk_data:
                self._write_chunk_data()
            if hasattr(self, '_m_chunk_data'):
                return self._m_chunk_data

            if not self.chunk_data__enabled:
                return None

            io = self.chunk.data_slot._io
            _pos = io.pos()
            io.seek(0)
            _on = self.chunk_id
            if _on == Riff.Fourcc.list:
                pass
                self._m_chunk_data = Riff.ListChunkData(io, self, self._root)
                self._m_chunk_data._read()
            io.seek(_pos)
            return getattr(self, '_m_chunk_data', None)

        @chunk_data.setter
        def chunk_data(self, v):
            self._dirty = True
            self._m_chunk_data = v

        def _write_chunk_data(self):
            self._should_write_chunk_data = False
            io = self.chunk.data_slot._io
            _pos = io.pos()
            io.seek(0)
            _on = self.chunk_id
            if _on == Riff.Fourcc.list:
                pass
                self._m_chunk_data._write__seq(io)
            io.seek(_pos)

        @property
        def chunk_id(self):
            if hasattr(self, '_m_chunk_id'):
                return self._m_chunk_id

            self._m_chunk_id = KaitaiStream.resolve_enum(Riff.Fourcc, self.chunk.id)
            return getattr(self, '_m_chunk_id', None)

        def _invalidate_chunk_id(self):
            del self._m_chunk_id
        @property
        def chunk_id_readable(self):
            if self._should_write_chunk_id_readable:
                self._write_chunk_id_readable()
            if hasattr(self, '_m_chunk_id_readable'):
                return self._m_chunk_id_readable

            if not self.chunk_id_readable__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.chunk_ofs)
            self._m_chunk_id_readable = (self._io.read_bytes(4)).decode(u"ASCII")
            self._io.seek(_pos)
            return getattr(self, '_m_chunk_id_readable', None)

        @chunk_id_readable.setter
        def chunk_id_readable(self, v):
            self._dirty = True
            self._m_chunk_id_readable = v

        def _write_chunk_id_readable(self):
            self._should_write_chunk_id_readable = False
            _pos = self._io.pos()
            self._io.seek(self.chunk_ofs)
            self._io.write_bytes((self._m_chunk_id_readable).encode(u"ASCII"))
            self._io.seek(_pos)

        @property
        def chunk_ofs(self):
            if hasattr(self, '_m_chunk_ofs'):
                return self._m_chunk_ofs

            self._m_chunk_ofs = self._io.pos()
            return getattr(self, '_m_chunk_ofs', None)

        def _invalidate_chunk_ofs(self):
            del self._m_chunk_ofs

    class InfoSubchunk(ReadWriteKaitaiStruct):
        """All registered subchunks in the INFO chunk are NULL-terminated strings,
        but the unregistered might not be. By convention, the registered
        chunk IDs are in uppercase and the unregistered IDs are in lowercase.
        
        If the chunk ID of an INFO subchunk contains a lowercase
        letter, this chunk is considered as unregistered and thus we can make
        no assumptions about the type of data.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Riff.InfoSubchunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_chunk_data = False
            self.chunk_data__enabled = True
            self._should_write_id_chars = False
            self.id_chars__enabled = True

        def _read(self):
            if self.chunk_ofs < 0:
                pass
                self.save_chunk_ofs = self._io.read_bytes(0)

            self.chunk = Riff.Chunk(self._io, self, self._root)
            self.chunk._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.chunk_ofs < 0:
                pass

            self.chunk._fetch_instances()
            _ = self.chunk_data
            if hasattr(self, '_m_chunk_data'):
                pass
                _on = self.is_unregistered_tag
                if _on == False:
                    pass

            _ = self.id_chars
            if hasattr(self, '_m_id_chars'):
                pass



        def _write__seq(self, io=None):
            super(Riff.InfoSubchunk, self)._write__seq(io)
            self._should_write_chunk_data = self.chunk_data__enabled
            self._should_write_id_chars = self.id_chars__enabled
            if self.chunk_ofs < 0:
                pass
                if len(self.save_chunk_ofs) != 0:
                    raise kaitaistruct.ConsistencyError(u"save_chunk_ofs", 0, len(self.save_chunk_ofs))
                self._io.write_bytes(self.save_chunk_ofs)

            self.chunk._write__seq(self._io)


        def _check(self):
            if self.chunk._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chunk", self._root, self.chunk._root)
            if self.chunk._parent != self:
                raise kaitaistruct.ConsistencyError(u"chunk", self, self.chunk._parent)
            if self.chunk_data__enabled:
                pass

            if self.id_chars__enabled:
                pass
                if len(self._m_id_chars) != 4:
                    raise kaitaistruct.ConsistencyError(u"id_chars", 4, len(self._m_id_chars))

            self._dirty = False

        @property
        def chunk_data(self):
            if self._should_write_chunk_data:
                self._write_chunk_data()
            if hasattr(self, '_m_chunk_data'):
                return self._m_chunk_data

            if not self.chunk_data__enabled:
                return None

            io = self.chunk.data_slot._io
            _pos = io.pos()
            io.seek(0)
            _on = self.is_unregistered_tag
            if _on == False:
                pass
                self._m_chunk_data = (io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            io.seek(_pos)
            return getattr(self, '_m_chunk_data', None)

        @chunk_data.setter
        def chunk_data(self, v):
            self._dirty = True
            self._m_chunk_data = v

        def _write_chunk_data(self):
            self._should_write_chunk_data = False
            io = self.chunk.data_slot._io
            _pos = io.pos()
            io.seek(0)
            _on = self.is_unregistered_tag
            if _on == False:
                pass
                if KaitaiStream.byte_array_index_of((self._m_chunk_data).encode(u"UTF-8"), 0) != -1:
                    raise kaitaistruct.ConsistencyError(u"chunk_data", -1, KaitaiStream.byte_array_index_of((self._m_chunk_data).encode(u"UTF-8"), 0))
                io.write_bytes((self._m_chunk_data).encode(u"UTF-8"))
                io.write_u1(0)
            io.seek(_pos)

        @property
        def chunk_id_readable(self):
            if hasattr(self, '_m_chunk_id_readable'):
                return self._m_chunk_id_readable

            self._m_chunk_id_readable = (self.id_chars).decode(u"ASCII")
            return getattr(self, '_m_chunk_id_readable', None)

        def _invalidate_chunk_id_readable(self):
            del self._m_chunk_id_readable
        @property
        def chunk_ofs(self):
            if hasattr(self, '_m_chunk_ofs'):
                return self._m_chunk_ofs

            self._m_chunk_ofs = self._io.pos()
            return getattr(self, '_m_chunk_ofs', None)

        def _invalidate_chunk_ofs(self):
            del self._m_chunk_ofs
        @property
        def id_chars(self):
            if self._should_write_id_chars:
                self._write_id_chars()
            if hasattr(self, '_m_id_chars'):
                return self._m_id_chars

            if not self.id_chars__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.chunk_ofs)
            self._m_id_chars = self._io.read_bytes(4)
            self._io.seek(_pos)
            return getattr(self, '_m_id_chars', None)

        @id_chars.setter
        def id_chars(self, v):
            self._dirty = True
            self._m_id_chars = v

        def _write_id_chars(self):
            self._should_write_id_chars = False
            _pos = self._io.pos()
            self._io.seek(self.chunk_ofs)
            self._io.write_bytes(self._m_id_chars)
            self._io.seek(_pos)

        @property
        def is_unregistered_tag(self):
            """Check if chunk_id contains lowercase characters ([a-z], ASCII 97 = a, ASCII 122 = z).
            """
            if hasattr(self, '_m_is_unregistered_tag'):
                return self._m_is_unregistered_tag

            self._m_is_unregistered_tag =  (( ((KaitaiStream.byte_array_index(self.id_chars, 0) >= 97) and (KaitaiStream.byte_array_index(self.id_chars, 0) <= 122)) ) or ( ((KaitaiStream.byte_array_index(self.id_chars, 1) >= 97) and (KaitaiStream.byte_array_index(self.id_chars, 1) <= 122)) ) or ( ((KaitaiStream.byte_array_index(self.id_chars, 2) >= 97) and (KaitaiStream.byte_array_index(self.id_chars, 2) <= 122)) ) or ( ((KaitaiStream.byte_array_index(self.id_chars, 3) >= 97) and (KaitaiStream.byte_array_index(self.id_chars, 3) <= 122)) )) 
            return getattr(self, '_m_is_unregistered_tag', None)

        def _invalidate_is_unregistered_tag(self):
            del self._m_is_unregistered_tag

    class ListChunkData(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Riff.ListChunkData, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_form_type_readable = False
            self.form_type_readable__enabled = True
            self._should_write_subchunks = False
            self.subchunks__enabled = True

        def _read(self):
            if self.parent_chunk_data_ofs < 0:
                pass
                self.save_parent_chunk_data_ofs = self._io.read_bytes(0)

            self.parent_chunk_data = Riff.ParentChunkData(self._io, self, self._root)
            self.parent_chunk_data._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.parent_chunk_data_ofs < 0:
                pass

            self.parent_chunk_data._fetch_instances()
            _ = self.form_type_readable
            if hasattr(self, '_m_form_type_readable'):
                pass

            _ = self.subchunks
            if hasattr(self, '_m_subchunks'):
                pass
                for i in range(len(self._m_subchunks)):
                    pass
                    _on = self.form_type
                    if _on == Riff.Fourcc.info:
                        pass
                        self._m_subchunks[i]._fetch_instances()
                    else:
                        pass
                        self._m_subchunks[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(Riff.ListChunkData, self)._write__seq(io)
            self._should_write_form_type_readable = self.form_type_readable__enabled
            self._should_write_subchunks = self.subchunks__enabled
            if self.parent_chunk_data_ofs < 0:
                pass
                if len(self.save_parent_chunk_data_ofs) != 0:
                    raise kaitaistruct.ConsistencyError(u"save_parent_chunk_data_ofs", 0, len(self.save_parent_chunk_data_ofs))
                self._io.write_bytes(self.save_parent_chunk_data_ofs)

            self.parent_chunk_data._write__seq(self._io)


        def _check(self):
            if self.parent_chunk_data._root != self._root:
                raise kaitaistruct.ConsistencyError(u"parent_chunk_data", self._root, self.parent_chunk_data._root)
            if self.parent_chunk_data._parent != self:
                raise kaitaistruct.ConsistencyError(u"parent_chunk_data", self, self.parent_chunk_data._parent)
            if self.form_type_readable__enabled:
                pass
                if len((self._m_form_type_readable).encode(u"ASCII")) != 4:
                    raise kaitaistruct.ConsistencyError(u"form_type_readable", 4, len((self._m_form_type_readable).encode(u"ASCII")))

            if self.subchunks__enabled:
                pass
                for i in range(len(self._m_subchunks)):
                    pass
                    _on = self.form_type
                    if _on == Riff.Fourcc.info:
                        pass
                        if self._m_subchunks[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"subchunks", self._root, self._m_subchunks[i]._root)
                        if self._m_subchunks[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"subchunks", self, self._m_subchunks[i]._parent)
                    else:
                        pass
                        if self._m_subchunks[i]._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"subchunks", self._root, self._m_subchunks[i]._root)
                        if self._m_subchunks[i]._parent != self:
                            raise kaitaistruct.ConsistencyError(u"subchunks", self, self._m_subchunks[i]._parent)


            self._dirty = False

        @property
        def form_type(self):
            if hasattr(self, '_m_form_type'):
                return self._m_form_type

            self._m_form_type = KaitaiStream.resolve_enum(Riff.Fourcc, self.parent_chunk_data.form_type)
            return getattr(self, '_m_form_type', None)

        def _invalidate_form_type(self):
            del self._m_form_type
        @property
        def form_type_readable(self):
            if self._should_write_form_type_readable:
                self._write_form_type_readable()
            if hasattr(self, '_m_form_type_readable'):
                return self._m_form_type_readable

            if not self.form_type_readable__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.parent_chunk_data_ofs)
            self._m_form_type_readable = (self._io.read_bytes(4)).decode(u"ASCII")
            self._io.seek(_pos)
            return getattr(self, '_m_form_type_readable', None)

        @form_type_readable.setter
        def form_type_readable(self, v):
            self._dirty = True
            self._m_form_type_readable = v

        def _write_form_type_readable(self):
            self._should_write_form_type_readable = False
            _pos = self._io.pos()
            self._io.seek(self.parent_chunk_data_ofs)
            self._io.write_bytes((self._m_form_type_readable).encode(u"ASCII"))
            self._io.seek(_pos)

        @property
        def parent_chunk_data_ofs(self):
            if hasattr(self, '_m_parent_chunk_data_ofs'):
                return self._m_parent_chunk_data_ofs

            self._m_parent_chunk_data_ofs = self._io.pos()
            return getattr(self, '_m_parent_chunk_data_ofs', None)

        def _invalidate_parent_chunk_data_ofs(self):
            del self._m_parent_chunk_data_ofs
        @property
        def subchunks(self):
            if self._should_write_subchunks:
                self._write_subchunks()
            if hasattr(self, '_m_subchunks'):
                return self._m_subchunks

            if not self.subchunks__enabled:
                return None

            io = self.parent_chunk_data.subchunks_slot._io
            _pos = io.pos()
            io.seek(0)
            self._m_subchunks = []
            i = 0
            while not io.is_eof():
                _on = self.form_type
                if _on == Riff.Fourcc.info:
                    pass
                    _t__m_subchunks = Riff.InfoSubchunk(io, self, self._root)
                    try:
                        _t__m_subchunks._read()
                    finally:
                        self._m_subchunks.append(_t__m_subchunks)
                else:
                    pass
                    _t__m_subchunks = Riff.ChunkType(io, self, self._root)
                    try:
                        _t__m_subchunks._read()
                    finally:
                        self._m_subchunks.append(_t__m_subchunks)
                i += 1

            io.seek(_pos)
            return getattr(self, '_m_subchunks', None)

        @subchunks.setter
        def subchunks(self, v):
            self._dirty = True
            self._m_subchunks = v

        def _write_subchunks(self):
            self._should_write_subchunks = False
            io = self.parent_chunk_data.subchunks_slot._io
            _pos = io.pos()
            io.seek(0)
            for i in range(len(self._m_subchunks)):
                pass
                if io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"subchunks", 0, io.size() - io.pos())
                _on = self.form_type
                if _on == Riff.Fourcc.info:
                    pass
                    self._m_subchunks[i]._write__seq(io)
                else:
                    pass
                    self._m_subchunks[i]._write__seq(io)

            if not io.is_eof():
                raise kaitaistruct.ConsistencyError(u"subchunks", 0, io.size() - io.pos())
            io.seek(_pos)


    class ParentChunkData(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Riff.ParentChunkData, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.form_type = self._io.read_u4le()
            self._raw_subchunks_slot = self._io.read_bytes_full()
            _io__raw_subchunks_slot = KaitaiStream(BytesIO(self._raw_subchunks_slot))
            self.subchunks_slot = Riff.ParentChunkData.Slot(_io__raw_subchunks_slot, self, self._root)
            self.subchunks_slot._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.subchunks_slot._fetch_instances()


        def _write__seq(self, io=None):
            super(Riff.ParentChunkData, self)._write__seq(io)
            self._io.write_u4le(self.form_type)
            _io__raw_subchunks_slot = KaitaiStream(BytesIO(bytearray(self._io.size() - self._io.pos())))
            self._io.add_child_stream(_io__raw_subchunks_slot)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._io.size() - self._io.pos()))
            def handler(parent, _io__raw_subchunks_slot=_io__raw_subchunks_slot):
                self._raw_subchunks_slot = _io__raw_subchunks_slot.to_byte_array()
                parent.write_bytes(self._raw_subchunks_slot)
                if not parent.is_eof():
                    raise kaitaistruct.ConsistencyError(u"raw(subchunks_slot)", 0, parent.size() - parent.pos())
            _io__raw_subchunks_slot.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.subchunks_slot._write__seq(_io__raw_subchunks_slot)


        def _check(self):
            if self.subchunks_slot._root != self._root:
                raise kaitaistruct.ConsistencyError(u"subchunks_slot", self._root, self.subchunks_slot._root)
            if self.subchunks_slot._parent != self:
                raise kaitaistruct.ConsistencyError(u"subchunks_slot", self, self.subchunks_slot._parent)
            self._dirty = False

        class Slot(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Riff.ParentChunkData.Slot, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                pass
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Riff.ParentChunkData.Slot, self)._write__seq(io)


            def _check(self):
                self._dirty = False



    @property
    def chunk_id(self):
        if hasattr(self, '_m_chunk_id'):
            return self._m_chunk_id

        self._m_chunk_id = KaitaiStream.resolve_enum(Riff.Fourcc, self.chunk.id)
        return getattr(self, '_m_chunk_id', None)

    def _invalidate_chunk_id(self):
        del self._m_chunk_id
    @property
    def is_riff_chunk(self):
        if hasattr(self, '_m_is_riff_chunk'):
            return self._m_is_riff_chunk

        self._m_is_riff_chunk = self.chunk_id == Riff.Fourcc.riff
        return getattr(self, '_m_is_riff_chunk', None)

    def _invalidate_is_riff_chunk(self):
        del self._m_is_riff_chunk
    @property
    def parent_chunk_data(self):
        if self._should_write_parent_chunk_data:
            self._write_parent_chunk_data()
        if hasattr(self, '_m_parent_chunk_data'):
            return self._m_parent_chunk_data

        if not self.parent_chunk_data__enabled:
            return None

        if self.is_riff_chunk:
            pass
            io = self.chunk.data_slot._io
            _pos = io.pos()
            io.seek(0)
            self._m_parent_chunk_data = Riff.ParentChunkData(io, self, self._root)
            self._m_parent_chunk_data._read()
            io.seek(_pos)

        return getattr(self, '_m_parent_chunk_data', None)

    @parent_chunk_data.setter
    def parent_chunk_data(self, v):
        self._dirty = True
        self._m_parent_chunk_data = v

    def _write_parent_chunk_data(self):
        self._should_write_parent_chunk_data = False
        if self.is_riff_chunk:
            pass
            io = self.chunk.data_slot._io
            _pos = io.pos()
            io.seek(0)
            self._m_parent_chunk_data._write__seq(io)
            io.seek(_pos)


    @property
    def subchunks(self):
        if self._should_write_subchunks:
            self._write_subchunks()
        if hasattr(self, '_m_subchunks'):
            return self._m_subchunks

        if not self.subchunks__enabled:
            return None

        if self.is_riff_chunk:
            pass
            io = self.parent_chunk_data.subchunks_slot._io
            _pos = io.pos()
            io.seek(0)
            self._m_subchunks = []
            i = 0
            while not io.is_eof():
                _t__m_subchunks = Riff.ChunkType(io, self, self._root)
                try:
                    _t__m_subchunks._read()
                finally:
                    self._m_subchunks.append(_t__m_subchunks)
                i += 1

            io.seek(_pos)

        return getattr(self, '_m_subchunks', None)

    @subchunks.setter
    def subchunks(self, v):
        self._dirty = True
        self._m_subchunks = v

    def _write_subchunks(self):
        self._should_write_subchunks = False
        if self.is_riff_chunk:
            pass
            io = self.parent_chunk_data.subchunks_slot._io
            _pos = io.pos()
            io.seek(0)
            for i in range(len(self._m_subchunks)):
                pass
                if io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"subchunks", 0, io.size() - io.pos())
                self._m_subchunks[i]._write__seq(io)

            if not io.is_eof():
                raise kaitaistruct.ConsistencyError(u"subchunks", 0, io.size() - io.pos())
            io.seek(_pos)



