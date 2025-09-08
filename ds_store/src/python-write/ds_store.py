# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DsStore(ReadWriteKaitaiStruct):
    """Apple macOS '.DS_Store' file format.
    
    .. seealso::
       Source - https://en.wikipedia.org/wiki/.DS_Store
    
    
    .. seealso::
       Source - https://metacpan.org/dist/Mac-Finder-DSStore/view/DSStoreFormat.pod
    
    
    .. seealso::
       Source - https://0day.work/parsing-the-ds_store-file-format/
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(DsStore, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_buddy_allocator_body = False
        self.buddy_allocator_body__enabled = True

    def _read(self):
        self.alignment_header = self._io.read_bytes(4)
        if not self.alignment_header == b"\x00\x00\x00\x01":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x01", self.alignment_header, self._io, u"/seq/0")
        self.buddy_allocator_header = DsStore.BuddyAllocatorHeader(self._io, self, self._root)
        self.buddy_allocator_header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.buddy_allocator_header._fetch_instances()
        _ = self.buddy_allocator_body
        if hasattr(self, '_m_buddy_allocator_body'):
            pass
            self._m_buddy_allocator_body._fetch_instances()



    def _write__seq(self, io=None):
        super(DsStore, self)._write__seq(io)
        self._should_write_buddy_allocator_body = self.buddy_allocator_body__enabled
        self._io.write_bytes(self.alignment_header)
        self.buddy_allocator_header._write__seq(self._io)


    def _check(self):
        if len(self.alignment_header) != 4:
            raise kaitaistruct.ConsistencyError(u"alignment_header", 4, len(self.alignment_header))
        if not self.alignment_header == b"\x00\x00\x00\x01":
            raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x01", self.alignment_header, None, u"/seq/0")
        if self.buddy_allocator_header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"buddy_allocator_header", self._root, self.buddy_allocator_header._root)
        if self.buddy_allocator_header._parent != self:
            raise kaitaistruct.ConsistencyError(u"buddy_allocator_header", self, self.buddy_allocator_header._parent)
        if self.buddy_allocator_body__enabled:
            pass
            if self._m_buddy_allocator_body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"buddy_allocator_body", self._root, self._m_buddy_allocator_body._root)
            if self._m_buddy_allocator_body._parent != self:
                raise kaitaistruct.ConsistencyError(u"buddy_allocator_body", self, self._m_buddy_allocator_body._parent)

        self._dirty = False

    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DsStore.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_rightmost_block = False
            self.rightmost_block__enabled = True

        def _read(self):
            self.mode = self._io.read_u4be()
            self.counter = self._io.read_u4be()
            self.data = []
            for i in range(self.counter):
                _t_data = DsStore.Block.BlockData(self.mode, self._io, self, self._root)
                try:
                    _t_data._read()
                finally:
                    self.data.append(_t_data)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.data)):
                pass
                self.data[i]._fetch_instances()

            _ = self.rightmost_block
            if hasattr(self, '_m_rightmost_block'):
                pass
                self._m_rightmost_block._fetch_instances()



        def _write__seq(self, io=None):
            super(DsStore.Block, self)._write__seq(io)
            self._should_write_rightmost_block = self.rightmost_block__enabled
            self._io.write_u4be(self.mode)
            self._io.write_u4be(self.counter)
            for i in range(len(self.data)):
                pass
                self.data[i]._write__seq(self._io)



        def _check(self):
            if len(self.data) != self.counter:
                raise kaitaistruct.ConsistencyError(u"data", self.counter, len(self.data))
            for i in range(len(self.data)):
                pass
                if self.data[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data[i]._root)
                if self.data[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data[i]._parent)
                if self.data[i].mode != self.mode:
                    raise kaitaistruct.ConsistencyError(u"data", self.mode, self.data[i].mode)

            if self.rightmost_block__enabled:
                pass
                if self.mode > 0:
                    pass
                    if self._m_rightmost_block._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"rightmost_block", self._root, self._m_rightmost_block._root)
                    if self._m_rightmost_block._parent != self:
                        raise kaitaistruct.ConsistencyError(u"rightmost_block", self, self._m_rightmost_block._parent)


            self._dirty = False

        class BlockData(ReadWriteKaitaiStruct):
            def __init__(self, mode, _io=None, _parent=None, _root=None):
                super(DsStore.Block.BlockData, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self.mode = mode
                self._should_write_block = False
                self.block__enabled = True

            def _read(self):
                if self.mode > 0:
                    pass
                    self.block_id = self._io.read_u4be()

                self.record = DsStore.Block.BlockData.Record(self._io, self, self._root)
                self.record._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.mode > 0:
                    pass

                self.record._fetch_instances()
                _ = self.block
                if hasattr(self, '_m_block'):
                    pass
                    self._m_block._fetch_instances()



            def _write__seq(self, io=None):
                super(DsStore.Block.BlockData, self)._write__seq(io)
                self._should_write_block = self.block__enabled
                if self.mode > 0:
                    pass
                    self._io.write_u4be(self.block_id)

                self.record._write__seq(self._io)


            def _check(self):
                if self.mode > 0:
                    pass

                if self.record._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"record", self._root, self.record._root)
                if self.record._parent != self:
                    raise kaitaistruct.ConsistencyError(u"record", self, self.record._parent)
                if self.block__enabled:
                    pass
                    if self.mode > 0:
                        pass
                        if self._m_block._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"block", self._root, self._m_block._root)
                        if self._m_block._parent != self:
                            raise kaitaistruct.ConsistencyError(u"block", self, self._m_block._parent)


                self._dirty = False

            class Record(ReadWriteKaitaiStruct):
                def __init__(self, _io=None, _parent=None, _root=None):
                    super(DsStore.Block.BlockData.Record, self).__init__(_io)
                    self._parent = _parent
                    self._root = _root

                def _read(self):
                    self.filename = DsStore.Block.BlockData.Record.Ustr(self._io, self, self._root)
                    self.filename._read()
                    self.structure_type = DsStore.Block.BlockData.Record.FourCharCode(self._io, self, self._root)
                    self.structure_type._read()
                    self.data_type = (self._io.read_bytes(4)).decode(u"UTF-8")
                    _on = self.data_type
                    if _on == u"blob":
                        pass
                        self.value = DsStore.Block.BlockData.Record.RecordBlob(self._io, self, self._root)
                        self.value._read()
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
                        self.value._read()
                    elif _on == u"ustr":
                        pass
                        self.value = DsStore.Block.BlockData.Record.Ustr(self._io, self, self._root)
                        self.value._read()
                    self._dirty = False


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


                def _write__seq(self, io=None):
                    super(DsStore.Block.BlockData.Record, self)._write__seq(io)
                    self.filename._write__seq(self._io)
                    self.structure_type._write__seq(self._io)
                    self._io.write_bytes((self.data_type).encode(u"UTF-8"))
                    _on = self.data_type
                    if _on == u"blob":
                        pass
                        self.value._write__seq(self._io)
                    elif _on == u"bool":
                        pass
                        self._io.write_u1(self.value)
                    elif _on == u"comp":
                        pass
                        self._io.write_u8be(self.value)
                    elif _on == u"dutc":
                        pass
                        self._io.write_u8be(self.value)
                    elif _on == u"long":
                        pass
                        self._io.write_u4be(self.value)
                    elif _on == u"shor":
                        pass
                        self._io.write_u4be(self.value)
                    elif _on == u"type":
                        pass
                        self.value._write__seq(self._io)
                    elif _on == u"ustr":
                        pass
                        self.value._write__seq(self._io)


                def _check(self):
                    if self.filename._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"filename", self._root, self.filename._root)
                    if self.filename._parent != self:
                        raise kaitaistruct.ConsistencyError(u"filename", self, self.filename._parent)
                    if self.structure_type._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"structure_type", self._root, self.structure_type._root)
                    if self.structure_type._parent != self:
                        raise kaitaistruct.ConsistencyError(u"structure_type", self, self.structure_type._parent)
                    if len((self.data_type).encode(u"UTF-8")) != 4:
                        raise kaitaistruct.ConsistencyError(u"data_type", 4, len((self.data_type).encode(u"UTF-8")))
                    _on = self.data_type
                    if _on == u"blob":
                        pass
                        if self.value._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                        if self.value._parent != self:
                            raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
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
                        if self.value._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                        if self.value._parent != self:
                            raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                    elif _on == u"ustr":
                        pass
                        if self.value._root != self._root:
                            raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                        if self.value._parent != self:
                            raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
                    self._dirty = False

                class FourCharCode(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(DsStore.Block.BlockData.Record.FourCharCode, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.value = (self._io.read_bytes(4)).decode(u"UTF-8")
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(DsStore.Block.BlockData.Record.FourCharCode, self)._write__seq(io)
                        self._io.write_bytes((self.value).encode(u"UTF-8"))


                    def _check(self):
                        if len((self.value).encode(u"UTF-8")) != 4:
                            raise kaitaistruct.ConsistencyError(u"value", 4, len((self.value).encode(u"UTF-8")))
                        self._dirty = False


                class RecordBlob(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(DsStore.Block.BlockData.Record.RecordBlob, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.length = self._io.read_u4be()
                        self.value = self._io.read_bytes(self.length)
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(DsStore.Block.BlockData.Record.RecordBlob, self)._write__seq(io)
                        self._io.write_u4be(self.length)
                        self._io.write_bytes(self.value)


                    def _check(self):
                        if len(self.value) != self.length:
                            raise kaitaistruct.ConsistencyError(u"value", self.length, len(self.value))
                        self._dirty = False


                class Ustr(ReadWriteKaitaiStruct):
                    def __init__(self, _io=None, _parent=None, _root=None):
                        super(DsStore.Block.BlockData.Record.Ustr, self).__init__(_io)
                        self._parent = _parent
                        self._root = _root

                    def _read(self):
                        self.length = self._io.read_u4be()
                        self.value = (self._io.read_bytes(2 * self.length)).decode(u"UTF-16BE")
                        self._dirty = False


                    def _fetch_instances(self):
                        pass


                    def _write__seq(self, io=None):
                        super(DsStore.Block.BlockData.Record.Ustr, self)._write__seq(io)
                        self._io.write_u4be(self.length)
                        self._io.write_bytes((self.value).encode(u"UTF-16BE"))


                    def _check(self):
                        if len((self.value).encode(u"UTF-16BE")) != 2 * self.length:
                            raise kaitaistruct.ConsistencyError(u"value", 2 * self.length, len((self.value).encode(u"UTF-16BE")))
                        self._dirty = False



            @property
            def block(self):
                if self._should_write_block:
                    self._write_block()
                if hasattr(self, '_m_block'):
                    return self._m_block

                if not self.block__enabled:
                    return None

                if self.mode > 0:
                    pass
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self._root.buddy_allocator_body.block_addresses[self.block_id].offset)
                    self._m_block = DsStore.Block(io, self, self._root)
                    self._m_block._read()
                    io.seek(_pos)

                return getattr(self, '_m_block', None)

            @block.setter
            def block(self, v):
                self._dirty = True
                self._m_block = v

            def _write_block(self):
                self._should_write_block = False
                if self.mode > 0:
                    pass
                    io = self._root._io
                    _pos = io.pos()
                    io.seek(self._root.buddy_allocator_body.block_addresses[self.block_id].offset)
                    self._m_block._write__seq(io)
                    io.seek(_pos)



        @property
        def rightmost_block(self):
            """Rightmost child block pointer."""
            if self._should_write_rightmost_block:
                self._write_rightmost_block()
            if hasattr(self, '_m_rightmost_block'):
                return self._m_rightmost_block

            if not self.rightmost_block__enabled:
                return None

            if self.mode > 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.buddy_allocator_body.block_addresses[self.mode].offset)
                self._m_rightmost_block = DsStore.Block(io, self, self._root)
                self._m_rightmost_block._read()
                io.seek(_pos)

            return getattr(self, '_m_rightmost_block', None)

        @rightmost_block.setter
        def rightmost_block(self, v):
            self._dirty = True
            self._m_rightmost_block = v

        def _write_rightmost_block(self):
            self._should_write_rightmost_block = False
            if self.mode > 0:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.buddy_allocator_body.block_addresses[self.mode].offset)
                self._m_rightmost_block._write__seq(io)
                io.seek(_pos)



    class BuddyAllocatorBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DsStore.BuddyAllocatorBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_directories = False
            self.directories__enabled = True

        def _read(self):
            self.num_blocks = self._io.read_u4be()
            self._unnamed1 = self._io.read_bytes(4)
            self.block_addresses = []
            for i in range(self.num_block_addresses):
                _t_block_addresses = DsStore.BuddyAllocatorBody.BlockDescriptor(self._io, self, self._root)
                try:
                    _t_block_addresses._read()
                finally:
                    self.block_addresses.append(_t_block_addresses)

            self.num_directories = self._io.read_u4be()
            self.directory_entries = []
            for i in range(self.num_directories):
                _t_directory_entries = DsStore.BuddyAllocatorBody.DirectoryEntry(self._io, self, self._root)
                try:
                    _t_directory_entries._read()
                finally:
                    self.directory_entries.append(_t_directory_entries)

            self.free_lists = []
            for i in range(self.num_free_lists):
                _t_free_lists = DsStore.BuddyAllocatorBody.FreeList(self._io, self, self._root)
                try:
                    _t_free_lists._read()
                finally:
                    self.free_lists.append(_t_free_lists)

            self._dirty = False


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




        def _write__seq(self, io=None):
            super(DsStore.BuddyAllocatorBody, self)._write__seq(io)
            self._should_write_directories = self.directories__enabled
            self._io.write_u4be(self.num_blocks)
            self._io.write_bytes(self._unnamed1)
            for i in range(len(self.block_addresses)):
                pass
                self.block_addresses[i]._write__seq(self._io)

            self._io.write_u4be(self.num_directories)
            for i in range(len(self.directory_entries)):
                pass
                self.directory_entries[i]._write__seq(self._io)

            for i in range(len(self.free_lists)):
                pass
                self.free_lists[i]._write__seq(self._io)



        def _check(self):
            if len(self._unnamed1) != 4:
                raise kaitaistruct.ConsistencyError(u"_unnamed1", 4, len(self._unnamed1))
            if len(self.block_addresses) != self.num_block_addresses:
                raise kaitaistruct.ConsistencyError(u"block_addresses", self.num_block_addresses, len(self.block_addresses))
            for i in range(len(self.block_addresses)):
                pass
                if self.block_addresses[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"block_addresses", self._root, self.block_addresses[i]._root)
                if self.block_addresses[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"block_addresses", self, self.block_addresses[i]._parent)

            if len(self.directory_entries) != self.num_directories:
                raise kaitaistruct.ConsistencyError(u"directory_entries", self.num_directories, len(self.directory_entries))
            for i in range(len(self.directory_entries)):
                pass
                if self.directory_entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"directory_entries", self._root, self.directory_entries[i]._root)
                if self.directory_entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"directory_entries", self, self.directory_entries[i]._parent)

            if len(self.free_lists) != self.num_free_lists:
                raise kaitaistruct.ConsistencyError(u"free_lists", self.num_free_lists, len(self.free_lists))
            for i in range(len(self.free_lists)):
                pass
                if self.free_lists[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"free_lists", self._root, self.free_lists[i]._root)
                if self.free_lists[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"free_lists", self, self.free_lists[i]._parent)

            if self.directories__enabled:
                pass
                if len(self._m_directories) != self.num_directories:
                    raise kaitaistruct.ConsistencyError(u"directories", self.num_directories, len(self._m_directories))
                for i in range(len(self._m_directories)):
                    pass
                    if self._m_directories[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"directories", self._root, self._m_directories[i]._root)
                    if self._m_directories[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"directories", self, self._m_directories[i]._parent)
                    if self._m_directories[i].idx != i:
                        raise kaitaistruct.ConsistencyError(u"directories", i, self._m_directories[i].idx)


            self._dirty = False

        class BlockDescriptor(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DsStore.BuddyAllocatorBody.BlockDescriptor, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.address_raw = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(DsStore.BuddyAllocatorBody.BlockDescriptor, self)._write__seq(io)
                self._io.write_u4be(self.address_raw)


            def _check(self):
                self._dirty = False

            @property
            def offset(self):
                if hasattr(self, '_m_offset'):
                    return self._m_offset

                self._m_offset = (self.address_raw & ~(self._root.block_address_mask)) + 4
                return getattr(self, '_m_offset', None)

            def _invalidate_offset(self):
                del self._m_offset
            @property
            def size(self):
                if hasattr(self, '_m_size'):
                    return self._m_size

                self._m_size = 1 << (self.address_raw & self._root.block_address_mask)
                return getattr(self, '_m_size', None)

            def _invalidate_size(self):
                del self._m_size

        class DirectoryEntry(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DsStore.BuddyAllocatorBody.DirectoryEntry, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.len_name = self._io.read_u1()
                self.name = (self._io.read_bytes(self.len_name)).decode(u"UTF-8")
                self.block_id = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(DsStore.BuddyAllocatorBody.DirectoryEntry, self)._write__seq(io)
                self._io.write_u1(self.len_name)
                self._io.write_bytes((self.name).encode(u"UTF-8"))
                self._io.write_u4be(self.block_id)


            def _check(self):
                if len((self.name).encode(u"UTF-8")) != self.len_name:
                    raise kaitaistruct.ConsistencyError(u"name", self.len_name, len((self.name).encode(u"UTF-8")))
                self._dirty = False


        class FreeList(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DsStore.BuddyAllocatorBody.FreeList, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.counter = self._io.read_u4be()
                self.offsets = []
                for i in range(self.counter):
                    self.offsets.append(self._io.read_u4be())

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.offsets)):
                    pass



            def _write__seq(self, io=None):
                super(DsStore.BuddyAllocatorBody.FreeList, self)._write__seq(io)
                self._io.write_u4be(self.counter)
                for i in range(len(self.offsets)):
                    pass
                    self._io.write_u4be(self.offsets[i])



            def _check(self):
                if len(self.offsets) != self.counter:
                    raise kaitaistruct.ConsistencyError(u"offsets", self.counter, len(self.offsets))
                for i in range(len(self.offsets)):
                    pass

                self._dirty = False


        @property
        def directories(self):
            """Master blocks of the different B-trees."""
            if self._should_write_directories:
                self._write_directories()
            if hasattr(self, '_m_directories'):
                return self._m_directories

            if not self.directories__enabled:
                return None

            io = self._root._io
            self._m_directories = []
            for i in range(self.num_directories):
                _t__m_directories = DsStore.MasterBlockRef(i, io, self, self._root)
                try:
                    _t__m_directories._read()
                finally:
                    self._m_directories.append(_t__m_directories)

            return getattr(self, '_m_directories', None)

        @directories.setter
        def directories(self, v):
            self._dirty = True
            self._m_directories = v

        def _write_directories(self):
            self._should_write_directories = False
            io = self._root._io
            for i in range(len(self._m_directories)):
                pass
                self._m_directories[i]._write__seq(io)


        @property
        def num_block_addresses(self):
            if hasattr(self, '_m_num_block_addresses'):
                return self._m_num_block_addresses

            self._m_num_block_addresses = 256
            return getattr(self, '_m_num_block_addresses', None)

        def _invalidate_num_block_addresses(self):
            del self._m_num_block_addresses
        @property
        def num_free_lists(self):
            if hasattr(self, '_m_num_free_lists'):
                return self._m_num_free_lists

            self._m_num_free_lists = 32
            return getattr(self, '_m_num_free_lists', None)

        def _invalidate_num_free_lists(self):
            del self._m_num_free_lists

    class BuddyAllocatorHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DsStore.BuddyAllocatorHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x42\x75\x64\x31":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x75\x64\x31", self.magic, self._io, u"/types/buddy_allocator_header/seq/0")
            self.ofs_bookkeeping_info_block = self._io.read_u4be()
            self.len_bookkeeping_info_block = self._io.read_u4be()
            self.copy_ofs_bookkeeping_info_block = self._io.read_u4be()
            self._unnamed4 = self._io.read_bytes(16)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DsStore.BuddyAllocatorHeader, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4be(self.ofs_bookkeeping_info_block)
            self._io.write_u4be(self.len_bookkeeping_info_block)
            self._io.write_u4be(self.copy_ofs_bookkeeping_info_block)
            self._io.write_bytes(self._unnamed4)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x42\x75\x64\x31":
                raise kaitaistruct.ValidationNotEqualError(b"\x42\x75\x64\x31", self.magic, None, u"/types/buddy_allocator_header/seq/0")
            if len(self._unnamed4) != 16:
                raise kaitaistruct.ConsistencyError(u"_unnamed4", 16, len(self._unnamed4))
            self._dirty = False


    class MasterBlockRef(ReadWriteKaitaiStruct):
        def __init__(self, idx, _io=None, _parent=None, _root=None):
            super(DsStore.MasterBlockRef, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self._should_write_master_block = False
            self.master_block__enabled = True

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.master_block
            if hasattr(self, '_m_master_block'):
                pass
                self._m_master_block._fetch_instances()



        def _write__seq(self, io=None):
            super(DsStore.MasterBlockRef, self)._write__seq(io)
            self._should_write_master_block = self.master_block__enabled


        def _check(self):
            if self.master_block__enabled:
                pass
                if self._m_master_block._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"master_block", self._root, self._m_master_block._root)
                if self._m_master_block._parent != self:
                    raise kaitaistruct.ConsistencyError(u"master_block", self, self._m_master_block._parent)

            self._dirty = False

        class MasterBlock(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(DsStore.MasterBlockRef.MasterBlock, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_root_block = False
                self.root_block__enabled = True

            def _read(self):
                self.block_id = self._io.read_u4be()
                self.num_internal_nodes = self._io.read_u4be()
                self.num_records = self._io.read_u4be()
                self.num_nodes = self._io.read_u4be()
                self._unnamed4 = self._io.read_u4be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.root_block
                if hasattr(self, '_m_root_block'):
                    pass
                    self._m_root_block._fetch_instances()



            def _write__seq(self, io=None):
                super(DsStore.MasterBlockRef.MasterBlock, self)._write__seq(io)
                self._should_write_root_block = self.root_block__enabled
                self._io.write_u4be(self.block_id)
                self._io.write_u4be(self.num_internal_nodes)
                self._io.write_u4be(self.num_records)
                self._io.write_u4be(self.num_nodes)
                self._io.write_u4be(self._unnamed4)


            def _check(self):
                if self.root_block__enabled:
                    pass
                    if self._m_root_block._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"root_block", self._root, self._m_root_block._root)
                    if self._m_root_block._parent != self:
                        raise kaitaistruct.ConsistencyError(u"root_block", self, self._m_root_block._parent)

                self._dirty = False

            @property
            def root_block(self):
                if self._should_write_root_block:
                    self._write_root_block()
                if hasattr(self, '_m_root_block'):
                    return self._m_root_block

                if not self.root_block__enabled:
                    return None

                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.buddy_allocator_body.block_addresses[self.block_id].offset)
                self._m_root_block = DsStore.Block(io, self, self._root)
                self._m_root_block._read()
                io.seek(_pos)
                return getattr(self, '_m_root_block', None)

            @root_block.setter
            def root_block(self, v):
                self._dirty = True
                self._m_root_block = v

            def _write_root_block(self):
                self._should_write_root_block = False
                io = self._root._io
                _pos = io.pos()
                io.seek(self._root.buddy_allocator_body.block_addresses[self.block_id].offset)
                self._m_root_block._write__seq(io)
                io.seek(_pos)


        @property
        def master_block(self):
            if self._should_write_master_block:
                self._write_master_block()
            if hasattr(self, '_m_master_block'):
                return self._m_master_block

            if not self.master_block__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].offset)
            self._raw__m_master_block = self._io.read_bytes(self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].size)
            _io__raw__m_master_block = KaitaiStream(BytesIO(self._raw__m_master_block))
            self._m_master_block = DsStore.MasterBlockRef.MasterBlock(_io__raw__m_master_block, self, self._root)
            self._m_master_block._read()
            self._io.seek(_pos)
            return getattr(self, '_m_master_block', None)

        @master_block.setter
        def master_block(self, v):
            self._dirty = True
            self._m_master_block = v

        def _write_master_block(self):
            self._should_write_master_block = False
            _pos = self._io.pos()
            self._io.seek(self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].offset)
            _io__raw__m_master_block = KaitaiStream(BytesIO(bytearray(self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].size)))
            self._io.add_child_stream(_io__raw__m_master_block)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].size))
            def handler(parent, _io__raw__m_master_block=_io__raw__m_master_block):
                self._raw__m_master_block = _io__raw__m_master_block.to_byte_array()
                if len(self._raw__m_master_block) != self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].size:
                    raise kaitaistruct.ConsistencyError(u"raw(master_block)", self._parent.block_addresses[self._parent.directory_entries[self.idx].block_id].size, len(self._raw__m_master_block))
                parent.write_bytes(self._raw__m_master_block)
            _io__raw__m_master_block.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_master_block._write__seq(_io__raw__m_master_block)
            self._io.seek(_pos)


    @property
    def block_address_mask(self):
        """Bitmask used to calculate the position and the size of each block
        of the B-tree from the block addresses.
        """
        if hasattr(self, '_m_block_address_mask'):
            return self._m_block_address_mask

        self._m_block_address_mask = 31
        return getattr(self, '_m_block_address_mask', None)

    def _invalidate_block_address_mask(self):
        del self._m_block_address_mask
    @property
    def buddy_allocator_body(self):
        if self._should_write_buddy_allocator_body:
            self._write_buddy_allocator_body()
        if hasattr(self, '_m_buddy_allocator_body'):
            return self._m_buddy_allocator_body

        if not self.buddy_allocator_body__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.buddy_allocator_header.ofs_bookkeeping_info_block + 4)
        self._raw__m_buddy_allocator_body = self._io.read_bytes(self.buddy_allocator_header.len_bookkeeping_info_block)
        _io__raw__m_buddy_allocator_body = KaitaiStream(BytesIO(self._raw__m_buddy_allocator_body))
        self._m_buddy_allocator_body = DsStore.BuddyAllocatorBody(_io__raw__m_buddy_allocator_body, self, self._root)
        self._m_buddy_allocator_body._read()
        self._io.seek(_pos)
        return getattr(self, '_m_buddy_allocator_body', None)

    @buddy_allocator_body.setter
    def buddy_allocator_body(self, v):
        self._dirty = True
        self._m_buddy_allocator_body = v

    def _write_buddy_allocator_body(self):
        self._should_write_buddy_allocator_body = False
        _pos = self._io.pos()
        self._io.seek(self.buddy_allocator_header.ofs_bookkeeping_info_block + 4)
        _io__raw__m_buddy_allocator_body = KaitaiStream(BytesIO(bytearray(self.buddy_allocator_header.len_bookkeeping_info_block)))
        self._io.add_child_stream(_io__raw__m_buddy_allocator_body)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.buddy_allocator_header.len_bookkeeping_info_block))
        def handler(parent, _io__raw__m_buddy_allocator_body=_io__raw__m_buddy_allocator_body):
            self._raw__m_buddy_allocator_body = _io__raw__m_buddy_allocator_body.to_byte_array()
            if len(self._raw__m_buddy_allocator_body) != self.buddy_allocator_header.len_bookkeeping_info_block:
                raise kaitaistruct.ConsistencyError(u"raw(buddy_allocator_body)", self.buddy_allocator_header.len_bookkeeping_info_block, len(self._raw__m_buddy_allocator_body))
            parent.write_bytes(self._raw__m_buddy_allocator_body)
        _io__raw__m_buddy_allocator_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_buddy_allocator_body._write__seq(_io__raw__m_buddy_allocator_body)
        self._io.seek(_pos)


