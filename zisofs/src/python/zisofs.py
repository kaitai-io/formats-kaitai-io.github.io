# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Zisofs(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(Zisofs, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self._raw_header = self._io.read_bytes(16)
        _io__raw_header = KaitaiStream(BytesIO(self._raw_header))
        self.header = Zisofs.Header(_io__raw_header, self, self._root)
        self.block_pointers = []
        for i in range(self.header.num_blocks + 1):
            self.block_pointers.append(self._io.read_u4le())



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



    class Block(KaitaiStruct):
        def __init__(self, ofs_start, ofs_end, _io, _parent=None, _root=None):
            super(Zisofs.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.ofs_start = ofs_start
            self.ofs_end = ofs_end
            self._read()

        def _read(self):
            pass


        def _fetch_instances(self):
            pass
            _ = self.data
            if hasattr(self, '_m_data'):
                pass


        @property
        def data(self):
            if hasattr(self, '_m_data'):
                return self._m_data

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_start)
            self._m_data = io.read_bytes(self.len_data)
            io.seek(_pos)
            return getattr(self, '_m_data', None)

        @property
        def len_data(self):
            if hasattr(self, '_m_len_data'):
                return self._m_len_data

            self._m_len_data = self.ofs_end - self.ofs_start
            return getattr(self, '_m_len_data', None)


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Zisofs.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass

        @property
        def block_size(self):
            if hasattr(self, '_m_block_size'):
                return self._m_block_size

            self._m_block_size = 1 << self.block_size_log2
            return getattr(self, '_m_block_size', None)

        @property
        def num_blocks(self):
            """ceil(uncompressed_size / block_size)."""
            if hasattr(self, '_m_num_blocks'):
                return self._m_num_blocks

            self._m_num_blocks = self.uncompressed_size // self.block_size + (1 if self.uncompressed_size % self.block_size != 0 else 0)
            return getattr(self, '_m_num_blocks', None)


    @property
    def blocks(self):
        if hasattr(self, '_m_blocks'):
            return self._m_blocks

        self._m_blocks = []
        for i in range(self.header.num_blocks):
            self._m_blocks.append(Zisofs.Block(self.block_pointers[i], self.block_pointers[i + 1], self._io, self, self._root))

        return getattr(self, '_m_blocks', None)


