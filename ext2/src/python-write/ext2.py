# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Ext2(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Ext2, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_bg1 = False
        self.bg1__enabled = True

    def _read(self):
        pass
        self._dirty = False


    def _fetch_instances(self):
        pass
        _ = self.bg1
        if hasattr(self, '_m_bg1'):
            pass
            self._m_bg1._fetch_instances()



    def _write__seq(self, io=None):
        super(Ext2, self)._write__seq(io)
        self._should_write_bg1 = self.bg1__enabled


    def _check(self):
        if self.bg1__enabled:
            pass
            if self._m_bg1._root != self._root:
                raise kaitaistruct.ConsistencyError(u"bg1", self._root, self._m_bg1._root)
            if self._m_bg1._parent != self:
                raise kaitaistruct.ConsistencyError(u"bg1", self, self._m_bg1._parent)

        self._dirty = False

    class Bgd(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.Bgd, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_block_bitmap = False
            self.block_bitmap__enabled = True
            self._should_write_inode_bitmap = False
            self.inode_bitmap__enabled = True
            self._should_write_inodes = False
            self.inodes__enabled = True

        def _read(self):
            self.block_bitmap_block = self._io.read_u4le()
            self.inode_bitmap_block = self._io.read_u4le()
            self.inode_table_block = self._io.read_u4le()
            self.free_blocks_count = self._io.read_u2le()
            self.free_inodes_count = self._io.read_u2le()
            self.used_dirs_count = self._io.read_u2le()
            self.pad_reserved = self._io.read_bytes(2 + 12)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.block_bitmap
            if hasattr(self, '_m_block_bitmap'):
                pass

            _ = self.inode_bitmap
            if hasattr(self, '_m_inode_bitmap'):
                pass

            _ = self.inodes
            if hasattr(self, '_m_inodes'):
                pass
                for i in range(len(self._m_inodes)):
                    pass
                    self._m_inodes[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(Ext2.Bgd, self)._write__seq(io)
            self._should_write_block_bitmap = self.block_bitmap__enabled
            self._should_write_inode_bitmap = self.inode_bitmap__enabled
            self._should_write_inodes = self.inodes__enabled
            self._io.write_u4le(self.block_bitmap_block)
            self._io.write_u4le(self.inode_bitmap_block)
            self._io.write_u4le(self.inode_table_block)
            self._io.write_u2le(self.free_blocks_count)
            self._io.write_u2le(self.free_inodes_count)
            self._io.write_u2le(self.used_dirs_count)
            self._io.write_bytes(self.pad_reserved)


        def _check(self):
            if len(self.pad_reserved) != 2 + 12:
                raise kaitaistruct.ConsistencyError(u"pad_reserved", 2 + 12, len(self.pad_reserved))
            if self.block_bitmap__enabled:
                pass
                if len(self._m_block_bitmap) != 1024:
                    raise kaitaistruct.ConsistencyError(u"block_bitmap", 1024, len(self._m_block_bitmap))

            if self.inode_bitmap__enabled:
                pass
                if len(self._m_inode_bitmap) != 1024:
                    raise kaitaistruct.ConsistencyError(u"inode_bitmap", 1024, len(self._m_inode_bitmap))

            if self.inodes__enabled:
                pass
                if len(self._m_inodes) != self._root.bg1.super_block.inodes_per_group:
                    raise kaitaistruct.ConsistencyError(u"inodes", self._root.bg1.super_block.inodes_per_group, len(self._m_inodes))
                for i in range(len(self._m_inodes)):
                    pass
                    if self._m_inodes[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"inodes", self._root, self._m_inodes[i]._root)
                    if self._m_inodes[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"inodes", self, self._m_inodes[i]._parent)


            self._dirty = False

        @property
        def block_bitmap(self):
            if self._should_write_block_bitmap:
                self._write_block_bitmap()
            if hasattr(self, '_m_block_bitmap'):
                return self._m_block_bitmap

            if not self.block_bitmap__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.block_bitmap_block * self._root.bg1.super_block.block_size)
            self._m_block_bitmap = self._io.read_bytes(1024)
            self._io.seek(_pos)
            return getattr(self, '_m_block_bitmap', None)

        @block_bitmap.setter
        def block_bitmap(self, v):
            self._dirty = True
            self._m_block_bitmap = v

        def _write_block_bitmap(self):
            self._should_write_block_bitmap = False
            _pos = self._io.pos()
            self._io.seek(self.block_bitmap_block * self._root.bg1.super_block.block_size)
            self._io.write_bytes(self._m_block_bitmap)
            self._io.seek(_pos)

        @property
        def inode_bitmap(self):
            if self._should_write_inode_bitmap:
                self._write_inode_bitmap()
            if hasattr(self, '_m_inode_bitmap'):
                return self._m_inode_bitmap

            if not self.inode_bitmap__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.inode_bitmap_block * self._root.bg1.super_block.block_size)
            self._m_inode_bitmap = self._io.read_bytes(1024)
            self._io.seek(_pos)
            return getattr(self, '_m_inode_bitmap', None)

        @inode_bitmap.setter
        def inode_bitmap(self, v):
            self._dirty = True
            self._m_inode_bitmap = v

        def _write_inode_bitmap(self):
            self._should_write_inode_bitmap = False
            _pos = self._io.pos()
            self._io.seek(self.inode_bitmap_block * self._root.bg1.super_block.block_size)
            self._io.write_bytes(self._m_inode_bitmap)
            self._io.seek(_pos)

        @property
        def inodes(self):
            if self._should_write_inodes:
                self._write_inodes()
            if hasattr(self, '_m_inodes'):
                return self._m_inodes

            if not self.inodes__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.inode_table_block * self._root.bg1.super_block.block_size)
            self._m_inodes = []
            for i in range(self._root.bg1.super_block.inodes_per_group):
                _t__m_inodes = Ext2.Inode(self._io, self, self._root)
                try:
                    _t__m_inodes._read()
                finally:
                    self._m_inodes.append(_t__m_inodes)

            self._io.seek(_pos)
            return getattr(self, '_m_inodes', None)

        @inodes.setter
        def inodes(self, v):
            self._dirty = True
            self._m_inodes = v

        def _write_inodes(self):
            self._should_write_inodes = False
            _pos = self._io.pos()
            self._io.seek(self.inode_table_block * self._root.bg1.super_block.block_size)
            for i in range(len(self._m_inodes)):
                pass
                self._m_inodes[i]._write__seq(self._io)

            self._io.seek(_pos)


    class BlockGroup(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.BlockGroup, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_super_block = self._io.read_bytes(1024)
            _io__raw_super_block = KaitaiStream(BytesIO(self._raw_super_block))
            self.super_block = Ext2.SuperBlockStruct(_io__raw_super_block, self, self._root)
            self.super_block._read()
            self.block_groups = []
            for i in range(self.super_block.block_group_count):
                _t_block_groups = Ext2.Bgd(self._io, self, self._root)
                try:
                    _t_block_groups._read()
                finally:
                    self.block_groups.append(_t_block_groups)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.super_block._fetch_instances()
            for i in range(len(self.block_groups)):
                pass
                self.block_groups[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Ext2.BlockGroup, self)._write__seq(io)
            _io__raw_super_block = KaitaiStream(BytesIO(bytearray(1024)))
            self._io.add_child_stream(_io__raw_super_block)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (1024))
            def handler(parent, _io__raw_super_block=_io__raw_super_block):
                self._raw_super_block = _io__raw_super_block.to_byte_array()
                if len(self._raw_super_block) != 1024:
                    raise kaitaistruct.ConsistencyError(u"raw(super_block)", 1024, len(self._raw_super_block))
                parent.write_bytes(self._raw_super_block)
            _io__raw_super_block.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.super_block._write__seq(_io__raw_super_block)
            for i in range(len(self.block_groups)):
                pass
                self.block_groups[i]._write__seq(self._io)



        def _check(self):
            if self.super_block._root != self._root:
                raise kaitaistruct.ConsistencyError(u"super_block", self._root, self.super_block._root)
            if self.super_block._parent != self:
                raise kaitaistruct.ConsistencyError(u"super_block", self, self.super_block._parent)
            if len(self.block_groups) != self.super_block.block_group_count:
                raise kaitaistruct.ConsistencyError(u"block_groups", self.super_block.block_group_count, len(self.block_groups))
            for i in range(len(self.block_groups)):
                pass
                if self.block_groups[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"block_groups", self._root, self.block_groups[i]._root)
                if self.block_groups[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"block_groups", self, self.block_groups[i]._parent)

            self._dirty = False


    class BlockPtr(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.BlockPtr, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.ptr = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass
                self._m_body._fetch_instances()



        def _write__seq(self, io=None):
            super(Ext2.BlockPtr, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4le(self.ptr)


        def _check(self):
            if self.body__enabled:
                pass
                if self._m_body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self._m_body._root)
                if self._m_body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self._m_body._parent)

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            _pos = self._io.pos()
            self._io.seek(self.ptr * self._root.bg1.super_block.block_size)
            self._raw__m_body = self._io.read_bytes(self._root.bg1.super_block.block_size)
            _io__raw__m_body = KaitaiStream(BytesIO(self._raw__m_body))
            self._m_body = Ext2.RawBlock(_io__raw__m_body, self, self._root)
            self._m_body._read()
            self._io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            _pos = self._io.pos()
            self._io.seek(self.ptr * self._root.bg1.super_block.block_size)
            _io__raw__m_body = KaitaiStream(BytesIO(bytearray(self._root.bg1.super_block.block_size)))
            self._io.add_child_stream(_io__raw__m_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self._root.bg1.super_block.block_size))
            def handler(parent, _io__raw__m_body=_io__raw__m_body):
                self._raw__m_body = _io__raw__m_body.to_byte_array()
                if len(self._raw__m_body) != self._root.bg1.super_block.block_size:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self._root.bg1.super_block.block_size, len(self._raw__m_body))
                parent.write_bytes(self._raw__m_body)
            _io__raw__m_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_body._write__seq(_io__raw__m_body)
            self._io.seek(_pos)


    class Dir(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.Dir, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Ext2.DirEntry(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Ext2.Dir, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class DirEntry(ReadWriteKaitaiStruct):

        class FileTypeEnum(IntEnum):
            unknown = 0
            reg_file = 1
            dir = 2
            chrdev = 3
            blkdev = 4
            fifo = 5
            sock = 6
            symlink = 7
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.DirEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.inode_ptr = self._io.read_u4le()
            self.rec_len = self._io.read_u2le()
            self.name_len = self._io.read_u1()
            self.file_type = KaitaiStream.resolve_enum(Ext2.DirEntry.FileTypeEnum, self._io.read_u1())
            self.name = (self._io.read_bytes(self.name_len)).decode(u"UTF-8")
            self.padding = self._io.read_bytes((self.rec_len - self.name_len) - 8)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ext2.DirEntry, self)._write__seq(io)
            self._io.write_u4le(self.inode_ptr)
            self._io.write_u2le(self.rec_len)
            self._io.write_u1(self.name_len)
            self._io.write_u1(int(self.file_type))
            self._io.write_bytes((self.name).encode(u"UTF-8"))
            self._io.write_bytes(self.padding)


        def _check(self):
            if len((self.name).encode(u"UTF-8")) != self.name_len:
                raise kaitaistruct.ConsistencyError(u"name", self.name_len, len((self.name).encode(u"UTF-8")))
            if len(self.padding) != (self.rec_len - self.name_len) - 8:
                raise kaitaistruct.ConsistencyError(u"padding", (self.rec_len - self.name_len) - 8, len(self.padding))
            self._dirty = False

        @property
        def inode(self):
            if hasattr(self, '_m_inode'):
                return self._m_inode

            self._m_inode = self._root.bg1.block_groups[(self.inode_ptr - 1) // self._root.bg1.super_block.inodes_per_group].inodes[(self.inode_ptr - 1) % self._root.bg1.super_block.inodes_per_group]
            return getattr(self, '_m_inode', None)

        def _invalidate_inode(self):
            del self._m_inode

    class Inode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.Inode, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_as_dir = False
            self.as_dir__enabled = True

        def _read(self):
            self.mode = self._io.read_u2le()
            self.uid = self._io.read_u2le()
            self.size = self._io.read_u4le()
            self.atime = self._io.read_u4le()
            self.ctime = self._io.read_u4le()
            self.mtime = self._io.read_u4le()
            self.dtime = self._io.read_u4le()
            self.gid = self._io.read_u2le()
            self.links_count = self._io.read_u2le()
            self.blocks = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.osd1 = self._io.read_u4le()
            self.block = []
            for i in range(15):
                _t_block = Ext2.BlockPtr(self._io, self, self._root)
                try:
                    _t_block._read()
                finally:
                    self.block.append(_t_block)

            self.generation = self._io.read_u4le()
            self.file_acl = self._io.read_u4le()
            self.dir_acl = self._io.read_u4le()
            self.faddr = self._io.read_u4le()
            self.osd2 = self._io.read_bytes(12)
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.block)):
                pass
                self.block[i]._fetch_instances()

            _ = self.as_dir
            if hasattr(self, '_m_as_dir'):
                pass
                self._m_as_dir._fetch_instances()



        def _write__seq(self, io=None):
            super(Ext2.Inode, self)._write__seq(io)
            self._should_write_as_dir = self.as_dir__enabled
            self._io.write_u2le(self.mode)
            self._io.write_u2le(self.uid)
            self._io.write_u4le(self.size)
            self._io.write_u4le(self.atime)
            self._io.write_u4le(self.ctime)
            self._io.write_u4le(self.mtime)
            self._io.write_u4le(self.dtime)
            self._io.write_u2le(self.gid)
            self._io.write_u2le(self.links_count)
            self._io.write_u4le(self.blocks)
            self._io.write_u4le(self.flags)
            self._io.write_u4le(self.osd1)
            for i in range(len(self.block)):
                pass
                self.block[i]._write__seq(self._io)

            self._io.write_u4le(self.generation)
            self._io.write_u4le(self.file_acl)
            self._io.write_u4le(self.dir_acl)
            self._io.write_u4le(self.faddr)
            self._io.write_bytes(self.osd2)


        def _check(self):
            if len(self.block) != 15:
                raise kaitaistruct.ConsistencyError(u"block", 15, len(self.block))
            for i in range(len(self.block)):
                pass
                if self.block[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"block", self._root, self.block[i]._root)
                if self.block[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"block", self, self.block[i]._parent)

            if len(self.osd2) != 12:
                raise kaitaistruct.ConsistencyError(u"osd2", 12, len(self.osd2))
            if self.as_dir__enabled:
                pass
                if self._m_as_dir._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"as_dir", self._root, self._m_as_dir._root)
                if self._m_as_dir._parent != self:
                    raise kaitaistruct.ConsistencyError(u"as_dir", self, self._m_as_dir._parent)

            self._dirty = False

        @property
        def as_dir(self):
            if self._should_write_as_dir:
                self._write_as_dir()
            if hasattr(self, '_m_as_dir'):
                return self._m_as_dir

            if not self.as_dir__enabled:
                return None

            io = self.block[0].body._io
            _pos = io.pos()
            io.seek(0)
            self._m_as_dir = Ext2.Dir(io, self, self._root)
            self._m_as_dir._read()
            io.seek(_pos)
            return getattr(self, '_m_as_dir', None)

        @as_dir.setter
        def as_dir(self, v):
            self._dirty = True
            self._m_as_dir = v

        def _write_as_dir(self):
            self._should_write_as_dir = False
            io = self.block[0].body._io
            _pos = io.pos()
            io.seek(0)
            self._m_as_dir._write__seq(io)
            io.seek(_pos)


    class RawBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.RawBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.body = self._io.read_bytes(self._root.bg1.super_block.block_size)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Ext2.RawBlock, self)._write__seq(io)
            self._io.write_bytes(self.body)


        def _check(self):
            if len(self.body) != self._root.bg1.super_block.block_size:
                raise kaitaistruct.ConsistencyError(u"body", self._root.bg1.super_block.block_size, len(self.body))
            self._dirty = False


    class SuperBlockStruct(ReadWriteKaitaiStruct):

        class ErrorsEnum(IntEnum):
            act_continue = 1
            act_ro = 2
            act_panic = 3

        class StateEnum(IntEnum):
            valid_fs = 1
            error_fs = 2
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Ext2.SuperBlockStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.inodes_count = self._io.read_u4le()
            self.blocks_count = self._io.read_u4le()
            self.r_blocks_count = self._io.read_u4le()
            self.free_blocks_count = self._io.read_u4le()
            self.free_inodes_count = self._io.read_u4le()
            self.first_data_block = self._io.read_u4le()
            self.log_block_size = self._io.read_u4le()
            self.log_frag_size = self._io.read_u4le()
            self.blocks_per_group = self._io.read_u4le()
            self.frags_per_group = self._io.read_u4le()
            self.inodes_per_group = self._io.read_u4le()
            self.mtime = self._io.read_u4le()
            self.wtime = self._io.read_u4le()
            self.mnt_count = self._io.read_u2le()
            self.max_mnt_count = self._io.read_u2le()
            self.magic = self._io.read_bytes(2)
            if not self.magic == b"\x53\xEF":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\xEF", self.magic, self._io, u"/types/super_block_struct/seq/15")
            self.state = KaitaiStream.resolve_enum(Ext2.SuperBlockStruct.StateEnum, self._io.read_u2le())
            self.errors = KaitaiStream.resolve_enum(Ext2.SuperBlockStruct.ErrorsEnum, self._io.read_u2le())
            self.minor_rev_level = self._io.read_u2le()
            self.lastcheck = self._io.read_u4le()
            self.checkinterval = self._io.read_u4le()
            self.creator_os = self._io.read_u4le()
            self.rev_level = self._io.read_u4le()
            self.def_resuid = self._io.read_u2le()
            self.def_resgid = self._io.read_u2le()
            self.first_ino = self._io.read_u4le()
            self.inode_size = self._io.read_u2le()
            self.block_group_nr = self._io.read_u2le()
            self.feature_compat = self._io.read_u4le()
            self.feature_incompat = self._io.read_u4le()
            self.feature_ro_compat = self._io.read_u4le()
            self.uuid = self._io.read_bytes(16)
            self.volume_name = self._io.read_bytes(16)
            self.last_mounted = self._io.read_bytes(64)
            self.algo_bitmap = self._io.read_u4le()
            self.prealloc_blocks = self._io.read_u1()
            self.prealloc_dir_blocks = self._io.read_u1()
            self.padding1 = self._io.read_bytes(2)
            self.journal_uuid = self._io.read_bytes(16)
            self.journal_inum = self._io.read_u4le()
            self.journal_dev = self._io.read_u4le()
            self.last_orphan = self._io.read_u4le()
            self.hash_seed = []
            for i in range(4):
                self.hash_seed.append(self._io.read_u4le())

            self.def_hash_version = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.hash_seed)):
                pass



        def _write__seq(self, io=None):
            super(Ext2.SuperBlockStruct, self)._write__seq(io)
            self._io.write_u4le(self.inodes_count)
            self._io.write_u4le(self.blocks_count)
            self._io.write_u4le(self.r_blocks_count)
            self._io.write_u4le(self.free_blocks_count)
            self._io.write_u4le(self.free_inodes_count)
            self._io.write_u4le(self.first_data_block)
            self._io.write_u4le(self.log_block_size)
            self._io.write_u4le(self.log_frag_size)
            self._io.write_u4le(self.blocks_per_group)
            self._io.write_u4le(self.frags_per_group)
            self._io.write_u4le(self.inodes_per_group)
            self._io.write_u4le(self.mtime)
            self._io.write_u4le(self.wtime)
            self._io.write_u2le(self.mnt_count)
            self._io.write_u2le(self.max_mnt_count)
            self._io.write_bytes(self.magic)
            self._io.write_u2le(int(self.state))
            self._io.write_u2le(int(self.errors))
            self._io.write_u2le(self.minor_rev_level)
            self._io.write_u4le(self.lastcheck)
            self._io.write_u4le(self.checkinterval)
            self._io.write_u4le(self.creator_os)
            self._io.write_u4le(self.rev_level)
            self._io.write_u2le(self.def_resuid)
            self._io.write_u2le(self.def_resgid)
            self._io.write_u4le(self.first_ino)
            self._io.write_u2le(self.inode_size)
            self._io.write_u2le(self.block_group_nr)
            self._io.write_u4le(self.feature_compat)
            self._io.write_u4le(self.feature_incompat)
            self._io.write_u4le(self.feature_ro_compat)
            self._io.write_bytes(self.uuid)
            self._io.write_bytes(self.volume_name)
            self._io.write_bytes(self.last_mounted)
            self._io.write_u4le(self.algo_bitmap)
            self._io.write_u1(self.prealloc_blocks)
            self._io.write_u1(self.prealloc_dir_blocks)
            self._io.write_bytes(self.padding1)
            self._io.write_bytes(self.journal_uuid)
            self._io.write_u4le(self.journal_inum)
            self._io.write_u4le(self.journal_dev)
            self._io.write_u4le(self.last_orphan)
            for i in range(len(self.hash_seed)):
                pass
                self._io.write_u4le(self.hash_seed[i])

            self._io.write_u1(self.def_hash_version)


        def _check(self):
            if len(self.magic) != 2:
                raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
            if not self.magic == b"\x53\xEF":
                raise kaitaistruct.ValidationNotEqualError(b"\x53\xEF", self.magic, None, u"/types/super_block_struct/seq/15")
            if len(self.uuid) != 16:
                raise kaitaistruct.ConsistencyError(u"uuid", 16, len(self.uuid))
            if len(self.volume_name) != 16:
                raise kaitaistruct.ConsistencyError(u"volume_name", 16, len(self.volume_name))
            if len(self.last_mounted) != 64:
                raise kaitaistruct.ConsistencyError(u"last_mounted", 64, len(self.last_mounted))
            if len(self.padding1) != 2:
                raise kaitaistruct.ConsistencyError(u"padding1", 2, len(self.padding1))
            if len(self.journal_uuid) != 16:
                raise kaitaistruct.ConsistencyError(u"journal_uuid", 16, len(self.journal_uuid))
            if len(self.hash_seed) != 4:
                raise kaitaistruct.ConsistencyError(u"hash_seed", 4, len(self.hash_seed))
            for i in range(len(self.hash_seed)):
                pass

            self._dirty = False

        @property
        def block_group_count(self):
            if hasattr(self, '_m_block_group_count'):
                return self._m_block_group_count

            self._m_block_group_count = self.blocks_count // self.blocks_per_group
            return getattr(self, '_m_block_group_count', None)

        def _invalidate_block_group_count(self):
            del self._m_block_group_count
        @property
        def block_size(self):
            if hasattr(self, '_m_block_size'):
                return self._m_block_size

            self._m_block_size = 1024 << self.log_block_size
            return getattr(self, '_m_block_size', None)

        def _invalidate_block_size(self):
            del self._m_block_size

    @property
    def bg1(self):
        if self._should_write_bg1:
            self._write_bg1()
        if hasattr(self, '_m_bg1'):
            return self._m_bg1

        if not self.bg1__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(1024)
        self._m_bg1 = Ext2.BlockGroup(self._io, self, self._root)
        self._m_bg1._read()
        self._io.seek(_pos)
        return getattr(self, '_m_bg1', None)

    @bg1.setter
    def bg1(self, v):
        self._dirty = True
        self._m_bg1 = v

    def _write_bg1(self):
        self._should_write_bg1 = False
        _pos = self._io.pos()
        self._io.seek(1024)
        self._m_bg1._write__seq(self._io)
        self._io.seek(_pos)

    @property
    def root_dir(self):
        if hasattr(self, '_m_root_dir'):
            return self._m_root_dir

        self._m_root_dir = self.bg1.block_groups[0].inodes[1].as_dir
        return getattr(self, '_m_root_dir', None)

    def _invalidate_root_dir(self):
        del self._m_root_dir

