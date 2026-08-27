# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Zchunk(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://github.com/zchunk/zchunk/blob/99e51afa38c723e7c25834c2c3b305d20ef55d04/zchunk_format.txt
    """

    class ChecksumTypes(IntEnum):
        sha1 = 0
        sha256 = 1
        sha512 = 2
        sha512_128 = 3

    class CompressionTypes(IntEnum):
        none = 0
        zstd = 2
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Zchunk, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.lead = Zchunk.HeaderLead(self._io, self, self._root)
        self.lead._read()
        self._raw_header_rest = self._io.read_bytes(self.lead.len_header_rest.value)
        _io__raw_header_rest = KaitaiStream(BytesIO(self._raw_header_rest))
        self.header_rest = Zchunk.HeaderWithoutLead(_io__raw_header_rest, self, self._root)
        self.header_rest._read()
        self.dict = self._io.read_bytes(self.header_rest.index.len_dict.value)
        if (not (self.lead.is_detached_header)):
            pass
            self.chunks = []
            for i in range(len(self.header_rest.index.chunks_metadata)):
                self.chunks.append(self._io.read_bytes(self.header_rest.index.chunks_metadata[i].len_chunk.value))


        self._dirty = False


    def _fetch_instances(self):
        pass
        self.lead._fetch_instances()
        self.header_rest._fetch_instances()
        if (not (self.lead.is_detached_header)):
            pass
            for i in range(len(self.chunks)):
                pass




    def _write__seq(self, io=None):
        super(Zchunk, self)._write__seq(io)
        self.lead._write__seq(self._io)
        _io__raw_header_rest = KaitaiStream(BytesIO(bytearray(self.lead.len_header_rest.value)))
        self._io.add_child_stream(_io__raw_header_rest)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.lead.len_header_rest.value))
        def handler(parent, _io__raw_header_rest=_io__raw_header_rest):
            self._raw_header_rest = _io__raw_header_rest.to_byte_array()
            if len(self._raw_header_rest) != self.lead.len_header_rest.value:
                raise kaitaistruct.ConsistencyError(u"raw(header_rest)", self.lead.len_header_rest.value, len(self._raw_header_rest))
            parent.write_bytes(self._raw_header_rest)
        _io__raw_header_rest.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header_rest._write__seq(_io__raw_header_rest)
        self._io.write_bytes(self.dict)
        if (not (self.lead.is_detached_header)):
            pass
            for i in range(len(self.chunks)):
                pass
                self._io.write_bytes(self.chunks[i])




    def _check(self):
        if self.lead._root != self._root:
            raise kaitaistruct.ConsistencyError(u"lead", self._root, self.lead._root)
        if self.lead._parent != self:
            raise kaitaistruct.ConsistencyError(u"lead", self, self.lead._parent)
        if self.header_rest._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header_rest", self._root, self.header_rest._root)
        if self.header_rest._parent != self:
            raise kaitaistruct.ConsistencyError(u"header_rest", self, self.header_rest._parent)
        if len(self.dict) != self.header_rest.index.len_dict.value:
            raise kaitaistruct.ConsistencyError(u"dict", self.header_rest.index.len_dict.value, len(self.dict))
        if (not (self.lead.is_detached_header)):
            pass
            if len(self.chunks) != len(self.header_rest.index.chunks_metadata):
                raise kaitaistruct.ConsistencyError(u"chunks", len(self.header_rest.index.chunks_metadata), len(self.chunks))
            for i in range(len(self.chunks)):
                pass
                if len(self.chunks[i]) != self.header_rest.index.chunks_metadata[i].len_chunk.value:
                    raise kaitaistruct.ConsistencyError(u"chunks", self.header_rest.index.chunks_metadata[i].len_chunk.value, len(self.chunks[i]))


        self._dirty = False

    class ChecksumType(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zchunk.ChecksumType, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.raw = Zchunk.CompressedInteger(self._io, self, self._root)
            self.raw._read()
            _ = self.raw
            if not self.len_checksum != 0:
                raise kaitaistruct.ValidationExprError(self.raw, self._io, u"/types/checksum_type/seq/0")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.raw._fetch_instances()


        def _write__seq(self, io=None):
            super(Zchunk.ChecksumType, self)._write__seq(io)
            self.raw._write__seq(self._io)


        def _check(self):
            if self.raw._root != self._root:
                raise kaitaistruct.ConsistencyError(u"raw", self._root, self.raw._root)
            if self.raw._parent != self:
                raise kaitaistruct.ConsistencyError(u"raw", self, self.raw._parent)
            _ = self.raw
            if not self.len_checksum != 0:
                raise kaitaistruct.ValidationExprError(self.raw, None, u"/types/checksum_type/seq/0")
            self._dirty = False

        @property
        def len_checksum(self):
            if hasattr(self, '_m_len_checksum'):
                return self._m_len_checksum

            self._m_len_checksum = (20 if self.value == Zchunk.ChecksumTypes.sha1 else (32 if self.value == Zchunk.ChecksumTypes.sha256 else (64 if self.value == Zchunk.ChecksumTypes.sha512 else (16 if self.value == Zchunk.ChecksumTypes.sha512_128 else 0))))
            return getattr(self, '_m_len_checksum', None)

        def _invalidate_len_checksum(self):
            del self._m_len_checksum
        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = KaitaiStream.resolve_enum(Zchunk.ChecksumTypes, self.raw.value)
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, len_checksum, has_data_streams, has_uncompressed_source, _io=None, _parent=None, _root=None):
            super(Zchunk.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.len_checksum = len_checksum
            self.has_data_streams = has_data_streams
            self.has_uncompressed_source = has_uncompressed_source

        def _read(self):
            if self.has_data_streams:
                pass
                self.chunk_stream = Zchunk.CompressedInteger(self._io, self, self._root)
                self.chunk_stream._read()

            self.chunk_checksum = self._io.read_bytes(self.len_checksum)
            if self.has_uncompressed_source:
                pass
                self.uncompressed_chunk_checksum = self._io.read_bytes(self.len_checksum)

            self.len_chunk = Zchunk.CompressedInteger(self._io, self, self._root)
            self.len_chunk._read()
            self.len_uncompressed_chunk = Zchunk.CompressedInteger(self._io, self, self._root)
            self.len_uncompressed_chunk._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.has_data_streams:
                pass
                self.chunk_stream._fetch_instances()

            if self.has_uncompressed_source:
                pass

            self.len_chunk._fetch_instances()
            self.len_uncompressed_chunk._fetch_instances()


        def _write__seq(self, io=None):
            super(Zchunk.Chunk, self)._write__seq(io)
            if self.has_data_streams:
                pass
                self.chunk_stream._write__seq(self._io)

            self._io.write_bytes(self.chunk_checksum)
            if self.has_uncompressed_source:
                pass
                self._io.write_bytes(self.uncompressed_chunk_checksum)

            self.len_chunk._write__seq(self._io)
            self.len_uncompressed_chunk._write__seq(self._io)


        def _check(self):
            if self.has_data_streams:
                pass
                if self.chunk_stream._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"chunk_stream", self._root, self.chunk_stream._root)
                if self.chunk_stream._parent != self:
                    raise kaitaistruct.ConsistencyError(u"chunk_stream", self, self.chunk_stream._parent)

            if len(self.chunk_checksum) != self.len_checksum:
                raise kaitaistruct.ConsistencyError(u"chunk_checksum", self.len_checksum, len(self.chunk_checksum))
            if self.has_uncompressed_source:
                pass
                if len(self.uncompressed_chunk_checksum) != self.len_checksum:
                    raise kaitaistruct.ConsistencyError(u"uncompressed_chunk_checksum", self.len_checksum, len(self.uncompressed_chunk_checksum))

            if self.len_chunk._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_chunk", self._root, self.len_chunk._root)
            if self.len_chunk._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_chunk", self, self.len_chunk._parent)
            if self.len_uncompressed_chunk._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_uncompressed_chunk", self._root, self.len_uncompressed_chunk._root)
            if self.len_uncompressed_chunk._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_uncompressed_chunk", self, self.len_uncompressed_chunk._parent)
            self._dirty = False


    class CompressedInteger(ReadWriteKaitaiStruct):
        """Like `/common/vlq_base128_le` (LEB128), but the logic of the
        "continuation" flag in the most significant bit is inverted, so instead of
        `has_next`, it is called `is_last` (if the highest bit is set to zero, it
        means "continue", whereas in standard LEB128, the highest bit set to
        **one** means "continue"). Therefore, we cannot simply import
        `/common/vlq_base128_le` and use it, because it is incompatible.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zchunk.CompressedInteger, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.groups = []
            i = 0
            while True:
                _t_groups = Zchunk.CompressedInteger.Group(i, self._io, self, self._root)
                try:
                    _t_groups._read()
                finally:
                    _ = _t_groups
                    self.groups.append(_)
                if _.is_last:
                    break
                i += 1
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.groups)):
                pass
                self.groups[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Zchunk.CompressedInteger, self)._write__seq(io)
            for i in range(len(self.groups)):
                pass
                self.groups[i]._write__seq(self._io)



        def _check(self):
            if len(self.groups) == 0:
                raise kaitaistruct.ConsistencyError(u"groups", 0, len(self.groups))
            for i in range(len(self.groups)):
                pass
                if self.groups[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"groups", self._root, self.groups[i]._root)
                if self.groups[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"groups", self, self.groups[i]._parent)
                if self.groups[i].idx != i:
                    raise kaitaistruct.ConsistencyError(u"groups", i, self.groups[i].idx)
                _ = self.groups[i]
                if _.is_last != (i == len(self.groups) - 1):
                    raise kaitaistruct.ConsistencyError(u"groups", i == len(self.groups) - 1, _.is_last)

            self._dirty = False

        class Group(ReadWriteKaitaiStruct):
            """One byte group, clearly divided into 7-bit "value" chunk and 1-bit "continuation" flag.
            """
            def __init__(self, idx, _io=None, _parent=None, _root=None):
                super(Zchunk.CompressedInteger.Group, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.idx = idx

            def _read(self):
                self.is_last = self._io.read_bits_int_be(1) != 0
                if not self.is_last == (True if self.idx == 9 else self.is_last):
                    raise kaitaistruct.ValidationNotEqualError((True if self.idx == 9 else self.is_last), self.is_last, self._io, u"/types/compressed_integer/types/group/seq/0")
                self.value = self._io.read_bits_int_be(7)
                if not self.value <= (1 if self.idx == 9 else 127):
                    raise kaitaistruct.ValidationGreaterThanError((1 if self.idx == 9 else 127), self.value, self._io, u"/types/compressed_integer/types/group/seq/1")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Zchunk.CompressedInteger.Group, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.is_last))
                self._io.write_bits_int_be(7, self.value)


            def _check(self):
                if not self.is_last == (True if self.idx == 9 else self.is_last):
                    raise kaitaistruct.ValidationNotEqualError((True if self.idx == 9 else self.is_last), self.is_last, None, u"/types/compressed_integer/types/group/seq/0")
                if not self.value <= (1 if self.idx == 9 else 127):
                    raise kaitaistruct.ValidationGreaterThanError((1 if self.idx == 9 else 127), self.value, None, u"/types/compressed_integer/types/group/seq/1")
                self._dirty = False


        @property
        def len(self):
            if hasattr(self, '_m_len'):
                return self._m_len

            self._m_len = len(self.groups)
            return getattr(self, '_m_len', None)

        def _invalidate_len(self):
            del self._m_len
        @property
        def value(self):
            """Resulting unsigned value as normal integer."""
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = (((((((((self.groups[0].value | (self.groups[1].value << 7 if self.len >= 2 else 0)) | (self.groups[2].value << 14 if self.len >= 3 else 0)) | (self.groups[3].value << 21 if self.len >= 4 else 0)) | (self.groups[4].value << 28 if self.len >= 5 else 0)) | (self.groups[5].value << 35 if self.len >= 6 else 0)) | (self.groups[6].value << 42 if self.len >= 7 else 0)) | (self.groups[7].value << 49 if self.len >= 8 else 0)) | (self.groups[8].value << 56 if self.len >= 9 else 0)) | (self.groups[9].value << 63 if self.len >= 10 else 0))
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class HeaderLead(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zchunk.HeaderLead, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(5)
            if not  ((self.magic == b"\x00\x5A\x43\x4B\x31") or (self.magic == b"\x00\x5A\x48\x52\x31")) :
                raise kaitaistruct.ValidationNotAnyOfError(self.magic, self._io, u"/types/header_lead/seq/0")
            self.overall_checksum_type = Zchunk.ChecksumType(self._io, self, self._root)
            self.overall_checksum_type._read()
            self.len_header_rest = Zchunk.CompressedInteger(self._io, self, self._root)
            self.len_header_rest._read()
            self.header_checksum = self._io.read_bytes(self.overall_checksum_type.len_checksum)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.overall_checksum_type._fetch_instances()
            self.len_header_rest._fetch_instances()


        def _write__seq(self, io=None):
            super(Zchunk.HeaderLead, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self.overall_checksum_type._write__seq(self._io)
            self.len_header_rest._write__seq(self._io)
            self._io.write_bytes(self.header_checksum)


        def _check(self):
            if len(self.magic) != 5:
                raise kaitaistruct.ConsistencyError(u"magic", 5, len(self.magic))
            if not  ((self.magic == b"\x00\x5A\x43\x4B\x31") or (self.magic == b"\x00\x5A\x48\x52\x31")) :
                raise kaitaistruct.ValidationNotAnyOfError(self.magic, None, u"/types/header_lead/seq/0")
            if self.overall_checksum_type._root != self._root:
                raise kaitaistruct.ConsistencyError(u"overall_checksum_type", self._root, self.overall_checksum_type._root)
            if self.overall_checksum_type._parent != self:
                raise kaitaistruct.ConsistencyError(u"overall_checksum_type", self, self.overall_checksum_type._parent)
            if self.len_header_rest._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_header_rest", self._root, self.len_header_rest._root)
            if self.len_header_rest._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_header_rest", self, self.len_header_rest._parent)
            if len(self.header_checksum) != self.overall_checksum_type.len_checksum:
                raise kaitaistruct.ConsistencyError(u"header_checksum", self.overall_checksum_type.len_checksum, len(self.header_checksum))
            self._dirty = False

        @property
        def is_detached_header(self):
            """Determines whether this file is a zchunk detached header (`.zhr`). If
            not, it is a complete zchunk file (`.zck`).
            """
            if hasattr(self, '_m_is_detached_header'):
                return self._m_is_detached_header

            self._m_is_detached_header = KaitaiStream.byte_array_index(self.magic, 2) == 72
            return getattr(self, '_m_is_detached_header', None)

        def _invalidate_is_detached_header(self):
            del self._m_is_detached_header

    class HeaderWithoutLead(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zchunk.HeaderWithoutLead, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.preface = Zchunk.Preface(self._io, self, self._root)
            self.preface._read()
            self.len_index = Zchunk.CompressedInteger(self._io, self, self._root)
            self.len_index._read()
            self._raw_index = self._io.read_bytes(self.len_index.value)
            _io__raw_index = KaitaiStream(BytesIO(self._raw_index))
            self.index = Zchunk.Index(_io__raw_index, self, self._root)
            self.index._read()
            self.num_signatures = Zchunk.CompressedInteger(self._io, self, self._root)
            self.num_signatures._read()
            _ = self.num_signatures
            if not _.value == 0:
                raise kaitaistruct.ValidationExprError(self.num_signatures, self._io, u"/types/header_without_lead/seq/3")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.preface._fetch_instances()
            self.len_index._fetch_instances()
            self.index._fetch_instances()
            self.num_signatures._fetch_instances()


        def _write__seq(self, io=None):
            super(Zchunk.HeaderWithoutLead, self)._write__seq(io)
            self.preface._write__seq(self._io)
            self.len_index._write__seq(self._io)
            _io__raw_index = KaitaiStream(BytesIO(bytearray(self.len_index.value)))
            self._io.add_child_stream(_io__raw_index)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_index.value))
            def handler(parent, _io__raw_index=_io__raw_index):
                self._raw_index = _io__raw_index.to_byte_array()
                if len(self._raw_index) != self.len_index.value:
                    raise kaitaistruct.ConsistencyError(u"raw(index)", self.len_index.value, len(self._raw_index))
                parent.write_bytes(self._raw_index)
            _io__raw_index.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.index._write__seq(_io__raw_index)
            self.num_signatures._write__seq(self._io)


        def _check(self):
            if self.preface._root != self._root:
                raise kaitaistruct.ConsistencyError(u"preface", self._root, self.preface._root)
            if self.preface._parent != self:
                raise kaitaistruct.ConsistencyError(u"preface", self, self.preface._parent)
            if self.len_index._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_index", self._root, self.len_index._root)
            if self.len_index._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_index", self, self.len_index._parent)
            if self.index._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index", self._root, self.index._root)
            if self.index._parent != self:
                raise kaitaistruct.ConsistencyError(u"index", self, self.index._parent)
            if self.num_signatures._root != self._root:
                raise kaitaistruct.ConsistencyError(u"num_signatures", self._root, self.num_signatures._root)
            if self.num_signatures._parent != self:
                raise kaitaistruct.ConsistencyError(u"num_signatures", self, self.num_signatures._parent)
            _ = self.num_signatures
            if not _.value == 0:
                raise kaitaistruct.ValidationExprError(self.num_signatures, None, u"/types/header_without_lead/seq/3")
            self._dirty = False


    class Index(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zchunk.Index, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.chunk_checksum_type = Zchunk.ChecksumType(self._io, self, self._root)
            self.chunk_checksum_type._read()
            self.num_chunks = Zchunk.CompressedInteger(self._io, self, self._root)
            self.num_chunks._read()
            _ = self.num_chunks
            if not _.value >= 1:
                raise kaitaistruct.ValidationExprError(self.num_chunks, self._io, u"/types/index/seq/1")
            if self._parent.preface.has_data_streams:
                pass
                self.dict_stream = Zchunk.CompressedInteger(self._io, self, self._root)
                self.dict_stream._read()
                _ = self.dict_stream
                if not _.value == 0:
                    raise kaitaistruct.ValidationExprError(self.dict_stream, self._io, u"/types/index/seq/2")

            self.dict_checksum = self._io.read_bytes(self.chunk_checksum_type.len_checksum)
            if self._parent.preface.has_uncompressed_source:
                pass
                self.uncompressed_dict_checksum = self._io.read_bytes(self.chunk_checksum_type.len_checksum)

            self.len_dict = Zchunk.CompressedInteger(self._io, self, self._root)
            self.len_dict._read()
            self.len_uncompressed_dict = Zchunk.CompressedInteger(self._io, self, self._root)
            self.len_uncompressed_dict._read()
            self.chunks_metadata = []
            for i in range(self.num_data_chunks):
                _t_chunks_metadata = Zchunk.Chunk(self.chunk_checksum_type.len_checksum, self._parent.preface.has_data_streams, self._parent.preface.has_uncompressed_source, self._io, self, self._root)
                try:
                    _t_chunks_metadata._read()
                finally:
                    self.chunks_metadata.append(_t_chunks_metadata)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.chunk_checksum_type._fetch_instances()
            self.num_chunks._fetch_instances()
            if self._parent.preface.has_data_streams:
                pass
                self.dict_stream._fetch_instances()

            if self._parent.preface.has_uncompressed_source:
                pass

            self.len_dict._fetch_instances()
            self.len_uncompressed_dict._fetch_instances()
            for i in range(len(self.chunks_metadata)):
                pass
                self.chunks_metadata[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Zchunk.Index, self)._write__seq(io)
            self.chunk_checksum_type._write__seq(self._io)
            self.num_chunks._write__seq(self._io)
            if self._parent.preface.has_data_streams:
                pass
                self.dict_stream._write__seq(self._io)

            self._io.write_bytes(self.dict_checksum)
            if self._parent.preface.has_uncompressed_source:
                pass
                self._io.write_bytes(self.uncompressed_dict_checksum)

            self.len_dict._write__seq(self._io)
            self.len_uncompressed_dict._write__seq(self._io)
            for i in range(len(self.chunks_metadata)):
                pass
                self.chunks_metadata[i]._write__seq(self._io)



        def _check(self):
            if self.chunk_checksum_type._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chunk_checksum_type", self._root, self.chunk_checksum_type._root)
            if self.chunk_checksum_type._parent != self:
                raise kaitaistruct.ConsistencyError(u"chunk_checksum_type", self, self.chunk_checksum_type._parent)
            if self.num_chunks._root != self._root:
                raise kaitaistruct.ConsistencyError(u"num_chunks", self._root, self.num_chunks._root)
            if self.num_chunks._parent != self:
                raise kaitaistruct.ConsistencyError(u"num_chunks", self, self.num_chunks._parent)
            _ = self.num_chunks
            if not _.value >= 1:
                raise kaitaistruct.ValidationExprError(self.num_chunks, None, u"/types/index/seq/1")
            if self._parent.preface.has_data_streams:
                pass
                if self.dict_stream._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"dict_stream", self._root, self.dict_stream._root)
                if self.dict_stream._parent != self:
                    raise kaitaistruct.ConsistencyError(u"dict_stream", self, self.dict_stream._parent)
                _ = self.dict_stream
                if not _.value == 0:
                    raise kaitaistruct.ValidationExprError(self.dict_stream, None, u"/types/index/seq/2")

            if len(self.dict_checksum) != self.chunk_checksum_type.len_checksum:
                raise kaitaistruct.ConsistencyError(u"dict_checksum", self.chunk_checksum_type.len_checksum, len(self.dict_checksum))
            if self._parent.preface.has_uncompressed_source:
                pass
                if len(self.uncompressed_dict_checksum) != self.chunk_checksum_type.len_checksum:
                    raise kaitaistruct.ConsistencyError(u"uncompressed_dict_checksum", self.chunk_checksum_type.len_checksum, len(self.uncompressed_dict_checksum))

            if self.len_dict._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_dict", self._root, self.len_dict._root)
            if self.len_dict._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_dict", self, self.len_dict._parent)
            if self.len_uncompressed_dict._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_uncompressed_dict", self._root, self.len_uncompressed_dict._root)
            if self.len_uncompressed_dict._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_uncompressed_dict", self, self.len_uncompressed_dict._parent)
            if len(self.chunks_metadata) != self.num_data_chunks:
                raise kaitaistruct.ConsistencyError(u"chunks_metadata", self.num_data_chunks, len(self.chunks_metadata))
            for i in range(len(self.chunks_metadata)):
                pass
                if self.chunks_metadata[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"chunks_metadata", self._root, self.chunks_metadata[i]._root)
                if self.chunks_metadata[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"chunks_metadata", self, self.chunks_metadata[i]._parent)
                if self.chunks_metadata[i].len_checksum != self.chunk_checksum_type.len_checksum:
                    raise kaitaistruct.ConsistencyError(u"chunks_metadata", self.chunk_checksum_type.len_checksum, self.chunks_metadata[i].len_checksum)
                if self.chunks_metadata[i].has_data_streams != self._parent.preface.has_data_streams:
                    raise kaitaistruct.ConsistencyError(u"chunks_metadata", self._parent.preface.has_data_streams, self.chunks_metadata[i].has_data_streams)
                if self.chunks_metadata[i].has_uncompressed_source != self._parent.preface.has_uncompressed_source:
                    raise kaitaistruct.ConsistencyError(u"chunks_metadata", self._parent.preface.has_uncompressed_source, self.chunks_metadata[i].has_uncompressed_source)

            self._dirty = False

        @property
        def num_data_chunks(self):
            """Number of data chunks. `num_chunks` counts the dictionary as chunk 0,
            so it is one greater than this number.
            """
            if hasattr(self, '_m_num_data_chunks'):
                return self._m_num_data_chunks

            self._m_num_data_chunks = self.num_chunks.value - 1
            return getattr(self, '_m_num_data_chunks', None)

        def _invalidate_num_data_chunks(self):
            del self._m_num_data_chunks

    class OptionalElement(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zchunk.OptionalElement, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.element_id = Zchunk.CompressedInteger(self._io, self, self._root)
            self.element_id._read()
            self.len_data = Zchunk.CompressedInteger(self._io, self, self._root)
            self.len_data._read()
            self.data = self._io.read_bytes(self.len_data.value)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.element_id._fetch_instances()
            self.len_data._fetch_instances()


        def _write__seq(self, io=None):
            super(Zchunk.OptionalElement, self)._write__seq(io)
            self.element_id._write__seq(self._io)
            self.len_data._write__seq(self._io)
            self._io.write_bytes(self.data)


        def _check(self):
            if self.element_id._root != self._root:
                raise kaitaistruct.ConsistencyError(u"element_id", self._root, self.element_id._root)
            if self.element_id._parent != self:
                raise kaitaistruct.ConsistencyError(u"element_id", self, self.element_id._parent)
            if self.len_data._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_data", self._root, self.len_data._root)
            if self.len_data._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_data", self, self.len_data._parent)
            if len(self.data) != self.len_data.value:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data.value, len(self.data))
            self._dirty = False


    class Preface(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zchunk.Preface, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.data_checksum = self._io.read_bytes(self._root.lead.overall_checksum_type.len_checksum)
            self.flags = Zchunk.CompressedInteger(self._io, self, self._root)
            self.flags._read()
            _ = self.flags
            if not _.value <= 7:
                raise kaitaistruct.ValidationExprError(self.flags, self._io, u"/types/preface/seq/1")
            self.compression_type_int = Zchunk.CompressedInteger(self._io, self, self._root)
            self.compression_type_int._read()
            _ = self.compression_type_int
            if not  ((_.value == int(Zchunk.CompressionTypes.none)) or (_.value == int(Zchunk.CompressionTypes.zstd))) :
                raise kaitaistruct.ValidationExprError(self.compression_type_int, self._io, u"/types/preface/seq/2")
            if self.has_optional_elements:
                pass
                self.num_optional_elements = Zchunk.CompressedInteger(self._io, self, self._root)
                self.num_optional_elements._read()
                _ = self.num_optional_elements
                if not _.value >= 1:
                    raise kaitaistruct.ValidationExprError(self.num_optional_elements, self._io, u"/types/preface/seq/3")

            if self.has_optional_elements:
                pass
                self.optional_elements = []
                for i in range(self.num_optional_elements.value):
                    _t_optional_elements = Zchunk.OptionalElement(self._io, self, self._root)
                    try:
                        _t_optional_elements._read()
                    finally:
                        self.optional_elements.append(_t_optional_elements)


            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.compression_type_int._fetch_instances()
            if self.has_optional_elements:
                pass
                self.num_optional_elements._fetch_instances()

            if self.has_optional_elements:
                pass
                for i in range(len(self.optional_elements)):
                    pass
                    self.optional_elements[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(Zchunk.Preface, self)._write__seq(io)
            self._io.write_bytes(self.data_checksum)
            self.flags._write__seq(self._io)
            self.compression_type_int._write__seq(self._io)
            if self.has_optional_elements:
                pass
                self.num_optional_elements._write__seq(self._io)

            if self.has_optional_elements:
                pass
                for i in range(len(self.optional_elements)):
                    pass
                    self.optional_elements[i]._write__seq(self._io)




        def _check(self):
            if len(self.data_checksum) != self._root.lead.overall_checksum_type.len_checksum:
                raise kaitaistruct.ConsistencyError(u"data_checksum", self._root.lead.overall_checksum_type.len_checksum, len(self.data_checksum))
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            _ = self.flags
            if not _.value <= 7:
                raise kaitaistruct.ValidationExprError(self.flags, None, u"/types/preface/seq/1")
            if self.compression_type_int._root != self._root:
                raise kaitaistruct.ConsistencyError(u"compression_type_int", self._root, self.compression_type_int._root)
            if self.compression_type_int._parent != self:
                raise kaitaistruct.ConsistencyError(u"compression_type_int", self, self.compression_type_int._parent)
            _ = self.compression_type_int
            if not  ((_.value == int(Zchunk.CompressionTypes.none)) or (_.value == int(Zchunk.CompressionTypes.zstd))) :
                raise kaitaistruct.ValidationExprError(self.compression_type_int, None, u"/types/preface/seq/2")
            if self.has_optional_elements:
                pass
                if self.num_optional_elements._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"num_optional_elements", self._root, self.num_optional_elements._root)
                if self.num_optional_elements._parent != self:
                    raise kaitaistruct.ConsistencyError(u"num_optional_elements", self, self.num_optional_elements._parent)
                _ = self.num_optional_elements
                if not _.value >= 1:
                    raise kaitaistruct.ValidationExprError(self.num_optional_elements, None, u"/types/preface/seq/3")

            if self.has_optional_elements:
                pass
                if len(self.optional_elements) != self.num_optional_elements.value:
                    raise kaitaistruct.ConsistencyError(u"optional_elements", self.num_optional_elements.value, len(self.optional_elements))
                for i in range(len(self.optional_elements)):
                    pass
                    if self.optional_elements[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"optional_elements", self._root, self.optional_elements[i]._root)
                    if self.optional_elements[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"optional_elements", self, self.optional_elements[i]._parent)


            self._dirty = False

        @property
        def compression_type(self):
            if hasattr(self, '_m_compression_type'):
                return self._m_compression_type

            self._m_compression_type = KaitaiStream.resolve_enum(Zchunk.CompressionTypes, self.compression_type_int.value)
            return getattr(self, '_m_compression_type', None)

        def _invalidate_compression_type(self):
            del self._m_compression_type
        @property
        def has_data_streams(self):
            if hasattr(self, '_m_has_data_streams'):
                return self._m_has_data_streams

            self._m_has_data_streams = self.flags.value & 1 != 0
            return getattr(self, '_m_has_data_streams', None)

        def _invalidate_has_data_streams(self):
            del self._m_has_data_streams
        @property
        def has_optional_elements(self):
            if hasattr(self, '_m_has_optional_elements'):
                return self._m_has_optional_elements

            self._m_has_optional_elements = self.flags.value & 2 != 0
            return getattr(self, '_m_has_optional_elements', None)

        def _invalidate_has_optional_elements(self):
            del self._m_has_optional_elements
        @property
        def has_uncompressed_source(self):
            """The file may be applied against an uncompressed source. This adds an
            uncompressed checksum to every index entry, including the dictionary.
            """
            if hasattr(self, '_m_has_uncompressed_source'):
                return self._m_has_uncompressed_source

            self._m_has_uncompressed_source = self.flags.value & 4 != 0
            return getattr(self, '_m_has_uncompressed_source', None)

        def _invalidate_has_uncompressed_source(self):
            del self._m_has_uncompressed_source


