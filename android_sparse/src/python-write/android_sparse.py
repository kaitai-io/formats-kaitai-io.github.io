# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AndroidSparse(ReadWriteKaitaiStruct):
    """The Android sparse format is a format to more efficiently store files
    for for example firmware updates to save on bandwidth. Files in sparse
    format first have to be converted back to their original format.
    
    A tool to create images for testing can be found in the Android source code tree:
    
    <https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse> - `img2simg.c`
    
    Note: this is not the same as the Android sparse data image format.
    
    .. seealso::
       Source - https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_format.h
    
    
    .. seealso::
       Source - https://web.archive.org/web/20220322054458/https://source.android.com/devices/bootloader/images#sparse-image-format
    """

    class ChunkTypes(IntEnum):
        raw = 51905
        fill = 51906
        dont_care = 51907
        crc32 = 51908
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AndroidSparse, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header_prefix = AndroidSparse.FileHeaderPrefix(self._io, self, self._root)
        self.header_prefix._read()
        self._raw_header = self._io.read_bytes(self.header_prefix.len_header - 10)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = AndroidSparse.FileHeader(_io__raw_header, self, self._root)
        self.header._read()
        self.chunks = []
        for i in range(self.header.num_chunks):
            _t_chunks = AndroidSparse.Chunk(self._io, self, self._root)
            try:
                _t_chunks._read()
            finally:
                self.chunks.append(_t_chunks)

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header_prefix._fetch_instances()
        self.header._fetch_instances()
        for i in range(len(self.chunks)):
            pass
            self.chunks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(AndroidSparse, self)._write__seq(io)
        self.header_prefix._write__seq(self._io)
        _io__raw_header = KaitaiStream(BytesIO(bytearray(self.header_prefix.len_header - 10)))
        self._io.add_child_stream(_io__raw_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header_prefix.len_header - 10))
        def handler(parent, _io__raw_header=_io__raw_header):
            self._raw_header = _io__raw_header.to_byte_array()
            if len(self._raw_header) != self.header_prefix.len_header - 10:
                raise kaitaistruct.ConsistencyError(u"raw(header)", self.header_prefix.len_header - 10, len(self._raw_header))
            parent.write_bytes(self._raw_header)
        _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header._write__seq(_io__raw_header)
        for i in range(len(self.chunks)):
            pass
            self.chunks[i]._write__seq(self._io)



    def _check(self):
        if self.header_prefix._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header_prefix", self._root, self.header_prefix._root)
        if self.header_prefix._parent != self:
            raise kaitaistruct.ConsistencyError(u"header_prefix", self, self.header_prefix._parent)
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.chunks) != self.header.num_chunks:
            raise kaitaistruct.ConsistencyError(u"chunks", self.header.num_chunks, len(self.chunks))
        for i in range(len(self.chunks)):
            pass
            if self.chunks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chunks", self._root, self.chunks[i]._root)
            if self.chunks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"chunks", self, self.chunks[i]._parent)

        self._dirty = False

    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidSparse.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_header = self._io.read_bytes(self._root.header.len_chunk_header)
            _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
            self.header = AndroidSparse.Chunk.ChunkHeader(_io__raw_header, self, self._root)
            self.header._read()
            _on = self.header.chunk_type
            if _on == AndroidSparse.ChunkTypes.crc32:
                pass
                self.body = self._io.read_u4le()
            else:
                pass
                self.body = self._io.read_bytes(self.header.len_body)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            _on = self.header.chunk_type
            if _on == AndroidSparse.ChunkTypes.crc32:
                pass
            else:
                pass


        def _write__seq(self, io=None):
            super(AndroidSparse.Chunk, self)._write__seq(io)
            _io__raw_header = KaitaiStream(BytesIO(bytearray(self._root.header.len_chunk_header)))
            self._io.add_child_stream(_io__raw_header)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._root.header.len_chunk_header))
            def handler(parent, _io__raw_header=_io__raw_header):
                self._raw_header = _io__raw_header.to_byte_array()
                if len(self._raw_header) != self._root.header.len_chunk_header:
                    raise kaitaistruct.ConsistencyError(u"raw(header)", self._root.header.len_chunk_header, len(self._raw_header))
                parent.write_bytes(self._raw_header)
            _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.header._write__seq(_io__raw_header)
            _on = self.header.chunk_type
            if _on == AndroidSparse.ChunkTypes.crc32:
                pass
                self._io.write_u4le(self.body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            _on = self.header.chunk_type
            if _on == AndroidSparse.ChunkTypes.crc32:
                pass
            else:
                pass
                if len(self.body) != self.header.len_body:
                    raise kaitaistruct.ConsistencyError(u"body", self.header.len_body, len(self.body))
            self._dirty = False

        class ChunkHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AndroidSparse.Chunk.ChunkHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.chunk_type = KaitaiStream.resolve_enum(AndroidSparse.ChunkTypes, self._io.read_u2le())
                self.reserved1 = self._io.read_u2le()
                self.num_body_blocks = self._io.read_u4le()
                self.len_chunk = self._io.read_u4le()
                if not self.len_chunk == (self._root.header.len_chunk_header + self.len_body_expected if self.len_body_expected != -1 else self.len_chunk):
                    raise kaitaistruct.ValidationNotEqualError((self._root.header.len_chunk_header + self.len_body_expected if self.len_body_expected != -1 else self.len_chunk), self.len_chunk, self._io, u"/types/chunk/types/chunk_header/seq/3")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(AndroidSparse.Chunk.ChunkHeader, self)._write__seq(io)
                self._io.write_u2le(int(self.chunk_type))
                self._io.write_u2le(self.reserved1)
                self._io.write_u4le(self.num_body_blocks)
                self._io.write_u4le(self.len_chunk)


            def _check(self):
                if not self.len_chunk == (self._root.header.len_chunk_header + self.len_body_expected if self.len_body_expected != -1 else self.len_chunk):
                    raise kaitaistruct.ValidationNotEqualError((self._root.header.len_chunk_header + self.len_body_expected if self.len_body_expected != -1 else self.len_chunk), self.len_chunk, None, u"/types/chunk/types/chunk_header/seq/3")
                self._dirty = False

            @property
            def len_body(self):
                if hasattr(self, '_m_len_body'):
                    return self._m_len_body

                self._m_len_body = self.len_chunk - self._root.header.len_chunk_header
                return getattr(self, '_m_len_body', None)

            def _invalidate_len_body(self):
                del self._m_len_body
            @property
            def len_body_expected(self):
                """
                .. seealso::
                   Source - https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#184
                
                
                .. seealso::
                   Source - https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#215
                
                
                .. seealso::
                   Source - https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#249
                
                
                .. seealso::
                   Source - https://android.googlesource.com/platform/system/core/+/e8d02c50d7/libsparse/sparse_read.cpp#270
                """
                if hasattr(self, '_m_len_body_expected'):
                    return self._m_len_body_expected

                self._m_len_body_expected = (self._root.header.block_size * self.num_body_blocks if self.chunk_type == AndroidSparse.ChunkTypes.raw else (4 if self.chunk_type == AndroidSparse.ChunkTypes.fill else (0 if self.chunk_type == AndroidSparse.ChunkTypes.dont_care else (4 if self.chunk_type == AndroidSparse.ChunkTypes.crc32 else -1))))
                return getattr(self, '_m_len_body_expected', None)

            def _invalidate_len_body_expected(self):
                del self._m_len_body_expected


    class FileHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidSparse.FileHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_chunk_header = self._io.read_u2le()
            self.block_size = self._io.read_u4le()
            _ = self.block_size
            if not _ % 4 == 0:
                raise kaitaistruct.ValidationExprError(self.block_size, self._io, u"/types/file_header/seq/1")
            self.num_blocks = self._io.read_u4le()
            self.num_chunks = self._io.read_u4le()
            self.checksum = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidSparse.FileHeader, self)._write__seq(io)
            self._io.write_u2le(self.len_chunk_header)
            self._io.write_u4le(self.block_size)
            self._io.write_u4le(self.num_blocks)
            self._io.write_u4le(self.num_chunks)
            self._io.write_u4le(self.checksum)


        def _check(self):
            _ = self.block_size
            if not _ % 4 == 0:
                raise kaitaistruct.ValidationExprError(self.block_size, None, u"/types/file_header/seq/1")
            self._dirty = False

        @property
        def len_header(self):
            """size of file header, should be 28."""
            if hasattr(self, '_m_len_header'):
                return self._m_len_header

            self._m_len_header = self._root.header_prefix.len_header
            return getattr(self, '_m_len_header', None)

        def _invalidate_len_header(self):
            del self._m_len_header
        @property
        def version(self):
            if hasattr(self, '_m_version'):
                return self._m_version

            self._m_version = self._root.header_prefix.version
            return getattr(self, '_m_version', None)

        def _invalidate_version(self):
            del self._m_version

    class FileHeaderPrefix(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidSparse.FileHeaderPrefix, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x3A\xFF\x26\xED":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A\xFF\x26\xED", self.magic, self._io, u"/types/file_header_prefix/seq/0")
            self.version = AndroidSparse.Version(self._io, self, self._root)
            self.version._read()
            self.len_header = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.version._fetch_instances()


        def _write__seq(self, io=None):
            super(AndroidSparse.FileHeaderPrefix, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self.version._write__seq(self._io)
            self._io.write_u2le(self.len_header)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x3A\xFF\x26\xED":
                raise kaitaistruct.ValidationNotEqualError(b"\x3A\xFF\x26\xED", self.magic, None, u"/types/file_header_prefix/seq/0")
            if self.version._root != self._root:
                raise kaitaistruct.ConsistencyError(u"version", self._root, self.version._root)
            if self.version._parent != self:
                raise kaitaistruct.ConsistencyError(u"version", self, self.version._parent)
            self._dirty = False


    class Version(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AndroidSparse.Version, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.major = self._io.read_u2le()
            if not self.major == 1:
                raise kaitaistruct.ValidationNotEqualError(1, self.major, self._io, u"/types/version/seq/0")
            self.minor = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AndroidSparse.Version, self)._write__seq(io)
            self._io.write_u2le(self.major)
            self._io.write_u2le(self.minor)


        def _check(self):
            if not self.major == 1:
                raise kaitaistruct.ValidationNotEqualError(1, self.major, None, u"/types/version/seq/0")
            self._dirty = False



