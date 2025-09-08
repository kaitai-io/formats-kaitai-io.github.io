# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DsStore(KaitaiStruct):
    """Apple macOS '.DS_Store' file format.
    
    .. seealso::
       Source - https://en.wikipedia.org/wiki/.DS_Store
    
    
    .. seealso::
       Source - https://metacpan.org/dist/Mac-Finder-DSStore/view/DSStoreFormat.pod
    
    
    .. seealso::
       Source - https://0day.work/parsing-the-ds_store-file-format/
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(DsStore, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.alignment_header = self._io.read_bytes(4)
        if not self.alignment_header == b"\x00\x00\x00\x01":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x01", self.alignment_header, self._io, u"/seq/0")
        self.buddy_allocator_header = DsStore.BuddyAllocatorHeader(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.buddy_allocator_header._fetch_instances()
        _ = self.buddy_allocator_body
        if hasattr(self, '_m_buddy_allocator_body'):
            pass
            self._m_buddy_allocator_body._fetch_instances()


    class Block(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DsStore.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.mode = self._io.read_u4be()
            self.counter = self._io.read_u4be()
            self.data = []
            for i in range(self.counter):
                self.data.append(DsStore.Block.BlockData(self.mode, self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.data)):
                pass
                self.data[i]._fetch_instances()

            _ = self.rightmost_block
            if hasattr(self, '_m_rightmost_block'):
                pass
                self._m_rightmost_block._fetch_instances()


        class BlockData(KaitaiStruct):
            def __init__(self, mode, _io, _parent=None, _root=None):
                super(DsStore.Block.BlockData, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.mode = mode
                self._read()

            def _read(self):
                if self.mode > 0:
                    pass
                    self.block_id = self._io.read_u4be()

                self.record = DsStore.Block.BlockData.Record(self._io, self, self._root)


            def _fetch_instances(self):
                pass
                if self.mode > 0:
                    pass

                self.record._fetch_instances()
                _ = self.block
                if hasattr(self, '_m_block'):
                    pass
                    self._m_block._fetch_instances()


            class Record(KaitaiStruct):
                def __init__(self, _io, _parent=None, _root=None):
                    super(DsStore.Block.BlockData.Record, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root
                    self._read()

                def _read(self):
                    self.filename = DsStore.Block.BlockData.Record.Ustr(self._io, self, self._root)
                    self.structure_type = DsStore.Block.BlockData.Record.FourCharCode(self._io, self, self._root)
                    self.data_type = (self._io.read_bytes(4)).decode(u"UTF-8")
                    _on = self.data_type
                    if _on == u"blob":
                        pass
                        self.value = DsStore.Block.BlockData.Record.RecordBlob(self._io, self, self._root)
                    elif _on == u"bool":
                        pass
                        self.value = self._io.read_u1()
                    elif _on == u"comp":
                        pass
                        self.value = self._io.read_u8be()
                    elif _on == u"dutc":
                        pass
                        self.value = self._io.read_u8be()
                    elif _on == u"long":
                        pass
                        self.value = self._io.read_u4be()
                    elif _on == u"shor":
                        pass
                        self.value = self._io.read_u4be()
                    elif _on == u"type":
                        pass
                        self.value = DsStore.Block.BlockData.Record.FourCharCode(self._io, self, self._root)
                    elif _on == u"ustr":
                        pass
                        self.value = DsStore.Block.BlockData.Record.Ustr(self._io, self, self._root)


                def _fetch_instances(self):
                    pass
                    self.filename._fetch_instances()
                    self.structure_type._fetch_instances()
                    _on = self.data_type
                    if _on == u"blob":
                        pass
                        self.value._fetch_instances()
                    elif _on == u"bool":
                        pass
                    elif _on == u"comp":
                        pass
                    elif _on == u"dutc":
                        pass
                    elif _on == u"long":
                        pass
                    elif _on == u"shor":
                        pass
                    elif _on == u"type":
                        pass
                        self.value._fetch_instances()
                    elif _on == u"ustr":
                        pass
                        self.value._fetch_instances()

                class FourCharCode(KaitaiStruct):
                    def __init__(self, _io, _parent=None, _root=None):
                        super(DsStore.Block.BlockData.Record.FourCharCode, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._read()

                    def _read(self):
                        self.value = (self._io.read_bytes(4)).decode(u"UTF-8")


                    def _fetch_instances(self):
                        pass


                class RecordBlob(KaitaiStruct):
                    def __init__(self, _io, _parent=None, _root=None):
                        super(DsStore.Block.BlockData.Record.RecordBlob, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._read()

                    def _read(self):
                        self.length = self._io.read_u4be()
                        self.value = self._io.read_bytes(self.length)


                    def _fetch_instances(self):
                        pass


                class Ustr(KaitaiStruct):
                    def __init__(self, _io, _parent=None, _root=None):
                        super(DsStore.Block.BlockData.Record.Ustr, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root
                        self._read()

                    def _read(self):
                        self.length = self._io.read_u4be()
                        self.value = (self._io.read_bytes(2 * self.length)).decode(u"UTF-16BE")


                    def _fetch_instances(self):
                        pass



            @property
            def block(self):
                if hasattr(self, '_m_block'):
                    return self._m_block

                if self.mode > 0:
                    pass
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self._root.buddy_allocator_body.block_addresses[self.block_id].offset)
                    self._m_block = DsStore.Block(io, self, self._root)
                    io.seek(_pos)

                return getattr(self, '_m_block', None)


        @property
        def rightmost_block(self):
            """Rightmost child block pointer."""
            if hasattr(self, '_m_rightmost_block'):
                return self._m_rightmost_block

            if self.mode > 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.buddy_allocator_body.block_addresses[self.mode].offset)
                self._m_rightmost_block = DsStore.Block(io, self, self._root)
                io.seek(_pos)

            return getattr(self, '_m_rightmost_block', None)


    class BuddyAllocatorBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DsStore.BuddyAllocatorBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_blocks = self._io.read_u4be()
            self._unnamed1 = self._io.read_bytes(4)
            self.block_addresses = []
            for i in range(self.num_block_addresses):
                self.block_addresses.append(DsStore.BuddyAllocatorBody.BlockDescriptor(self._io, self, self._root))

            self.num_directories = self._io.read_u4be()
            self.directory_entries = []
            for i in range(self.num_directories):
                self.directory_entries.append(DsStore.BuddyAllocatorBody.DirectoryEntry(self._io, self, self._root))

            self.free_lists = []
            for i in range(self.num_free_lists):
                self.free_lists.append(DsStore.BuddyAllocatorBody.FreeList(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.block_addresses)):
                pass
                self.block_addresses[i]._fetch_instances()

            for i in range(len(self.directory_entries)):
                pass
                self.directory_entries[i]._fetch_instances()

            for i in range(len(self.free_lists)):
                pass
                self.free_lists[i]._fetch_instances()

            _ = self.directories
            if hasattr(self, '_m_directories'):
                pass
                for i in range(len(self._m_directories)):
                    pass
                    self._m_directories[i]._fetch_instances()



        class BlockDescriptor(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(DsStore.BuddyAllocatorBody.BlockDescriptor, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.address_raw = self._io.read_u4be()


            def _fetch_instances(self):
                pass

            @property
            def offset(self):
                if hasattr(self, '_m_offset'):
                    return self._m_offset

                self._m_offset = (self.address_raw & ~(self._root.block_address_mask)) + 4
                return getattr(self, '_m_offset', None)

            @property
            def size(self):
                if hasattr(self, '_m_size'):
                    return self._m_size

                self._m_size = 1 << (self.address_raw & self._root.block_address_mask)
                return getattr(self, '_m_size', None)


        class DirectoryEntry(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(DsStore.BuddyAllocatorBody.DirectoryEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.len_name = self._io.read_u1()
                self.name = (self._io.read_bytes(self.len_name)).decode(u"UTF-8")
                self.block_id = self._io.read_u4be()


            def _fetch_instances(self):
                pass


        class FreeList(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(DsStore.BuddyAllocatorBody.FreeList, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.counter = self._io.read_u4be()
                self.offsets = []
                for i in range(self.counter):
                    self.offsets.append(self._io.read_u4be())



            def _fetch_instances(self):
                pass
                for i in range(len(self.offsets)):
                    pass



        @property
        def directories(self):
            """Master blocks of the different B-trees."""
            if hasattr(self, '_m_directories'):
                return self._m_directories

            io = self._root._io
            self._m_directories = []
            for i in range(self.num_directories):
                self._m_directories.append(DsStore.MasterBlockRef(i, io, self, self._root))

            return getattr(self, '_m_directories', None)

        @property
        def num_block_addresses(self):
            if hasattr(self, '_m_num_block_addresses'):
                return self._m_num_block_addresses

            self._m_num_block_addresses = 256
            return getattr(self, '_m_num_block_addresses', None)

        @property
        def num_free_lists(self):
            if hasattr(self, '_m_num_free_lists'):
                return self._m_num_free_lists

            self._m_num_free_lists = 32
            return getattr(self, '_m_num_free_lists', None)


    class BuddyAllocatorHeader(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(DsStore.BuddyAllocatorHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x42\x75\x64\x31":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x75\x64\x31", self.magic, self._io, u"/types/buddy_allocator_header/seq/0")
            self.ofs_bookkeeping_info_block = self._io.read_u4be()
            self.len_bookkeeping_info_block = self._io.read_u4be()
            self.copy_ofs_bookkeeping_info_block = self._io.read_u4be()
            self._unnamed4 = self._io.read_bytes(16)


        def _fetch_instances(self):
            pass


    class MasterBlockRef(KaitaiStruct):
        def __init__(self, idx, _io, _parent=None, _root=None):
            super(DsStore.MasterBlockRef, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._read()

        def _read(self):
            pass


        def _fetch_instances(self):
            pass
            _ = self.master_block
            if hasattr(self, '_m_master_block'):
                pass
                self._m_master_block._fetch_instances()


        class MasterBlock(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(DsStore.MasterBlockRef.MasterBlock, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.block_id = self._io.read_u4be()
                self.num_internal_nodes = self._io.read_u4be()
                self.num_records = self._io.read_u4be()
                self.num_nodes = self._io.read_u4be()
                self._unnamed4 = self._io.read_u4be()


            def _fetch_instances(self):
                pass
                _ = self.root_block
                if hasattr(self, '_m_root_block'):
                    pass
                    self._m_root_block._fetch_instances()


            @property
            def root_block(self):
                if hasattr(self, '_m_root_block'):
                    return self._m_root_block

                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.buddy_allocator_body.block_addresses[self.block_id].offset)
                self._m_root_block = DsStore.Block(io, self, self._root)
                io.seek(_pos)
                return getattr(self, '_m_root_block', None)


        @property
        def master_block(self):
            if hasattr(self, '_m_master_block'):
                return self._m_master_block

            _pos = self._io.pos()
            self._io.seek(self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].offset)
            self._raw__m_master_block = self._io.read_bytes(self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].size)
            _io__raw__m_master_block = KaitaiStream(BytesIO(self._raw__m_master_block))
            self._m_master_block = DsStore.MasterBlockRef.MasterBlock(_io__raw__m_master_block, self, self._root)
            self._io.seek(_pos)
            return getattr(self, '_m_master_block', None)


    @property
    def block_address_mask(self):
        """Bitmask used to calculate the position and the size of each block
        of the B-tree from the block addresses.
        """
        if hasattr(self, '_m_block_address_mask'):
            return self._m_block_address_mask

        self._m_block_address_mask = 31
        return getattr(self, '_m_block_address_mask', None)

    @property
    def buddy_allocator_body(self):
        if hasattr(self, '_m_buddy_allocator_body'):
            return self._m_buddy_allocator_body

        _pos = self._io.pos()
        self._io.seek(self.buddy_allocator_header.ofs_bookkeeping_info_block + 4)
        self._raw__m_buddy_allocator_body = self._io.read_bytes(self.buddy_allocator_header.len_bookkeeping_info_block)
        _io__raw__m_buddy_allocator_body = KaitaiStream(BytesIO(self._raw__m_buddy_allocator_body))
        self._m_buddy_allocator_body = DsStore.BuddyAllocatorBody(_io__raw__m_buddy_allocator_body, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_buddy_allocator_body', None)


