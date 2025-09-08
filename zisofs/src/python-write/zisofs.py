# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Zisofs(ReadWriteKaitaiStruct):
    """zisofs is a compression format for files on ISO9660 file system. It has
    limited support across operating systems, mainly Linux kernel. Typically a
    directory tree is first preprocessed by mkzftree (from the zisofs-tools
    package before being turned into an ISO9660 image by mkisofs, genisoimage
    or similar tool. The data is zlib compressed.
    
    The specification here describes the structure of a file that has been
    preprocessed by mkzftree, not of a full ISO9660 ziso. Data is not
    decompressed, as blocks with length 0 have a special meaning. Decompression
    and deconstruction of this data should be done outside of Kaitai Struct.
    
    .. seealso::
       Source - https://web.archive.org/web/20200612093441/https://dev.lovelyhq.com/libburnia/web/-/wikis/zisofs
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Zisofs, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_blocks = False
        self.blocks__enabled = True

    def _read(self):
        self._raw_header = self._io.read_bytes(16)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = Zisofs.Header(_io__raw_header, self, self._root)
        self.header._read()
        self.block_pointers = []
        for i in range(self.header.num_blocks + 1):
            self.block_pointers.append(self._io.read_u4le())

        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        for i in range(len(self.block_pointers)):
            pass

        _ = self.blocks
        if hasattr(self, '_m_blocks'):
            pass
            for i in range(len(self._m_blocks)):
                pass
                self._m_blocks[i]._fetch_instances()




    def _write__seq(self, io=None):
        super(Zisofs, self)._write__seq(io)
        self._should_write_blocks = self.blocks__enabled
        _io__raw_header = KaitaiStream(BytesIO(bytearray(16)))
        self._io.add_child_stream(_io__raw_header)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (16))
        def handler(parent, _io__raw_header=_io__raw_header):
            self._raw_header = _io__raw_header.to_byte_array()
            if len(self._raw_header) != 16:
                raise kaitaistruct.ConsistencyError(u"raw(header)", 16, len(self._raw_header))
            parent.write_bytes(self._raw_header)
        _io__raw_header.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.header._write__seq(_io__raw_header)
        for i in range(len(self.block_pointers)):
            pass
            self._io.write_u4le(self.block_pointers[i])



    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if len(self.block_pointers) != self.header.num_blocks + 1:
            raise kaitaistruct.ConsistencyError(u"block_pointers", self.header.num_blocks + 1, len(self.block_pointers))
        for i in range(len(self.block_pointers)):
            pass

        if self.blocks__enabled:
            pass
            if len(self._m_blocks) != self.header.num_blocks:
                raise kaitaistruct.ConsistencyError(u"blocks", self.header.num_blocks, len(self._m_blocks))
            for i in range(len(self._m_blocks)):
                pass
                if self._m_blocks[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"blocks", self._root, self._m_blocks[i]._root)
                if self._m_blocks[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"blocks", self, self._m_blocks[i]._parent)
                if self._m_blocks[i].ofs_start != self.block_pointers[i]:
                    raise kaitaistruct.ConsistencyError(u"blocks", self.block_pointers[i], self._m_blocks[i].ofs_start)
                if self._m_blocks[i].ofs_end != self.block_pointers[i + 1]:
                    raise kaitaistruct.ConsistencyError(u"blocks", self.block_pointers[i + 1], self._m_blocks[i].ofs_end)


        self._dirty = False

    class Block(ReadWriteKaitaiStruct):
        def __init__(self, ofs_start, ofs_end, _io=None, _parent=None, _root=None):
            super(Zisofs.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.ofs_start = ofs_start
            self.ofs_end = ofs_end
            self._should_write_data = False
            self.data__enabled = True

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.data
            if hasattr(self, '_m_data'):
                pass



        def _write__seq(self, io=None):
            super(Zisofs.Block, self)._write__seq(io)
            self._should_write_data = self.data__enabled


        def _check(self):
            if self.data__enabled:
                pass
                if len(self._m_data) != self.len_data:
                    raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self._m_data))

            self._dirty = False

        @property
        def data(self):
            if self._should_write_data:
                self._write_data()
            if hasattr(self, '_m_data'):
                return self._m_data

            if not self.data__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_start)
            self._m_data = io.read_bytes(self.len_data)
            io.seek(_pos)
            return getattr(self, '_m_data', None)

        @data.setter
        def data(self, v):
            self._dirty = True
            self._m_data = v

        def _write_data(self):
            self._should_write_data = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_start)
            io.write_bytes(self._m_data)
            io.seek(_pos)

        @property
        def len_data(self):
            if hasattr(self, '_m_len_data'):
                return self._m_len_data

            self._m_len_data = self.ofs_end - self.ofs_start
            return getattr(self, '_m_len_data', None)

        def _invalidate_len_data(self):
            del self._m_len_data

    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Zisofs.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(8)
            if not self.magic == b"\x37\xE4\x53\x96\xC9\xDB\xD6\x07":
                raise kaitaistruct.ValidationNotEqualError(b"\x37\xE4\x53\x96\xC9\xDB\xD6\x07", self.magic, self._io, u"/types/header/seq/0")
            self.uncompressed_size = self._io.read_u4le()
            self.len_header = self._io.read_u1()
            if not self.len_header == 4:
                raise kaitaistruct.ValidationNotEqualError(4, self.len_header, self._io, u"/types/header/seq/2")
            self.block_size_log2 = self._io.read_u1()
            if not  ((self.block_size_log2 == 15) or (self.block_size_log2 == 16) or (self.block_size_log2 == 17)) :
                raise kaitaistruct.ValidationNotAnyOfError(self.block_size_log2, self._io, u"/types/header/seq/3")
            self.reserved = self._io.read_bytes(2)
            if not self.reserved == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved, self._io, u"/types/header/seq/4")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Zisofs.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.uncompressed_size)
            self._io.write_u1(self.len_header)
            self._io.write_u1(self.block_size_log2)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.magic) != 8:
                raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
            if not self.magic == b"\x37\xE4\x53\x96\xC9\xDB\xD6\x07":
                raise kaitaistruct.ValidationNotEqualError(b"\x37\xE4\x53\x96\xC9\xDB\xD6\x07", self.magic, None, u"/types/header/seq/0")
            if not self.len_header == 4:
                raise kaitaistruct.ValidationNotEqualError(4, self.len_header, None, u"/types/header/seq/2")
            if not  ((self.block_size_log2 == 15) or (self.block_size_log2 == 16) or (self.block_size_log2 == 17)) :
                raise kaitaistruct.ValidationNotAnyOfError(self.block_size_log2, None, u"/types/header/seq/3")
            if len(self.reserved) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved", 2, len(self.reserved))
            if not self.reserved == b"\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00", self.reserved, None, u"/types/header/seq/4")
            self._dirty = False

        @property
        def block_size(self):
            if hasattr(self, '_m_block_size'):
                return self._m_block_size

            self._m_block_size = 1 << self.block_size_log2
            return getattr(self, '_m_block_size', None)

        def _invalidate_block_size(self):
            del self._m_block_size
        @property
        def num_blocks(self):
            """ceil(uncompressed_size / block_size)."""
            if hasattr(self, '_m_num_blocks'):
                return self._m_num_blocks

            self._m_num_blocks = self.uncompressed_size // self.block_size + (1 if self.uncompressed_size % self.block_size != 0 else 0)
            return getattr(self, '_m_num_blocks', None)

        def _invalidate_num_blocks(self):
            del self._m_num_blocks

    @property
    def blocks(self):
        if self._should_write_blocks:
            self._write_blocks()
        if hasattr(self, '_m_blocks'):
            return self._m_blocks

        if not self.blocks__enabled:
            return None

        self._m_blocks = []
        for i in range(self.header.num_blocks):
            _t__m_blocks = Zisofs.Block(self.block_pointers[i], self.block_pointers[i + 1], self._io, self, self._root)
            try:
                _t__m_blocks._read()
            finally:
                self._m_blocks.append(_t__m_blocks)

        return getattr(self, '_m_blocks', None)

    @blocks.setter
    def blocks(self, v):
        self._dirty = True
        self._m_blocks = v

    def _write_blocks(self):
        self._should_write_blocks = False
        for i in range(len(self._m_blocks)):
            pass
            self._m_blocks[i]._write__seq(self._io)



