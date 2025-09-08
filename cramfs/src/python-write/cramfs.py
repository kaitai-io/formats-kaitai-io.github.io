# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Cramfs(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Cramfs, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.super_block = Cramfs.SuperBlockStruct(self._io, self, self._root)
        self.super_block._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.super_block._fetch_instances()


    def _write__seq(self, io=None):
        super(Cramfs, self)._write__seq(io)
        self.super_block._write__seq(self._io)


    def _check(self):
        if self.super_block._root != self._root:
            raise kaitaistruct.ConsistencyError(u"super_block", self._root, self.super_block._root)
        if self.super_block._parent != self:
            raise kaitaistruct.ConsistencyError(u"super_block", self, self.super_block._parent)
        self._dirty = False

    class ChunkedDataInode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Cramfs.ChunkedDataInode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.block_end_index = []
            for i in range(((self._parent.size + self._root.page_size) - 1) // self._root.page_size):
                self.block_end_index.append(self._io.read_u4le())

            self.raw_blocks = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.block_end_index)):
                pass



        def _write__seq(self, io=None):
            super(Cramfs.ChunkedDataInode, self)._write__seq(io)
            for i in range(len(self.block_end_index)):
                pass
                self._io.write_u4le(self.block_end_index[i])

            self._io.write_bytes(self.raw_blocks)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"raw_blocks", 0, self._io.size() - self._io.pos())


        def _check(self):
            if len(self.block_end_index) != ((self._parent.size + self._root.page_size) - 1) // self._root.page_size:
                raise kaitaistruct.ConsistencyError(u"block_end_index", ((self._parent.size + self._root.page_size) - 1) // self._root.page_size, len(self.block_end_index))
            for i in range(len(self.block_end_index)):
                pass

            self._dirty = False


    class DirInode(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Cramfs.DirInode, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            if self._io.size() > 0:
                pass
                self.children = []
                i = 0
                while not self._io.is_eof():
                    _t_children = Cramfs.Inode(self._io, self, self._root)
                    try:
                        _t_children._read()
                    finally:
                        self.children.append(_t_children)
                    i += 1


            self._dirty = False


        def _fetch_instances(self):
            pass
            if self._io.size() > 0:
                pass
                for i in range(len(self.children)):
                    pass
                    self.children[i]._fetch_instances()




        def _write__seq(self, io=None):
            super(Cramfs.DirInode, self)._write__seq(io)
            if self._io.size() > 0:
                pass
                for i in range(len(self.children)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"children", 0, self._io.size() - self._io.pos())
                    if self.children[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"children", self._root, self.children[i]._root)
                    if self.children[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"children", self, self.children[i]._parent)
                    self.children[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"children", 0, self._io.size() - self._io.pos())



        def _check(self):
            self._dirty = False


    class Info(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Cramfs.Info, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.crc = self._io.read_u4le()
            self.edition = self._io.read_u4le()
            self.blocks = self._io.read_u4le()
            self.files = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Cramfs.Info, self)._write__seq(io)
            self._io.write_u4le(self.crc)
            self._io.write_u4le(self.edition)
            self._io.write_u4le(self.blocks)
            self._io.write_u4le(self.files)


        def _check(self):
            self._dirty = False


    class Inode(ReadWriteKaitaiStruct):

        class FileType(IntEnum):
            fifo = 1
            chrdev = 2
            dir = 4
            blkdev = 6
            reg_file = 8
            symlink = 10
            socket = 12
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Cramfs.Inode, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_as_dir = False
            self.as_dir__enabled = True
            self._should_write_as_reg_file = False
            self.as_reg_file__enabled = True
            self._should_write_as_symlink = False
            self.as_symlink__enabled = True

        def _read(self):
            self.mode = self._io.read_u2le()
            self.uid = self._io.read_u2le()
            self.size_gid = self._io.read_u4le()
            self.namelen_offset = self._io.read_u4le()
            self.name = (self._io.read_bytes(self.namelen)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.as_dir
            if hasattr(self, '_m_as_dir'):
                pass
                self._m_as_dir._fetch_instances()

            _ = self.as_reg_file
            if hasattr(self, '_m_as_reg_file'):
                pass
                self._m_as_reg_file._fetch_instances()

            _ = self.as_symlink
            if hasattr(self, '_m_as_symlink'):
                pass
                self._m_as_symlink._fetch_instances()



        def _write__seq(self, io=None):
            super(Cramfs.Inode, self)._write__seq(io)
            self._should_write_as_dir = self.as_dir__enabled
            self._should_write_as_reg_file = self.as_reg_file__enabled
            self._should_write_as_symlink = self.as_symlink__enabled
            self._io.write_u2le(self.mode)
            self._io.write_u2le(self.uid)
            self._io.write_u4le(self.size_gid)
            self._io.write_u4le(self.namelen_offset)
            self._io.write_bytes((self.name).encode(u"UTF-8"))


        def _check(self):
            if len((self.name).encode(u"UTF-8")) != self.namelen:
                raise kaitaistruct.ConsistencyError(u"name", self.namelen, len((self.name).encode(u"UTF-8")))
            if self.as_dir__enabled:
                pass
                if self._m_as_dir._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"as_dir", self._root, self._m_as_dir._root)
                if self._m_as_dir._parent != self:
                    raise kaitaistruct.ConsistencyError(u"as_dir", self, self._m_as_dir._parent)

            if self.as_reg_file__enabled:
                pass
                if self._m_as_reg_file._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"as_reg_file", self._root, self._m_as_reg_file._root)
                if self._m_as_reg_file._parent != self:
                    raise kaitaistruct.ConsistencyError(u"as_reg_file", self, self._m_as_reg_file._parent)

            if self.as_symlink__enabled:
                pass
                if self._m_as_symlink._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"as_symlink", self._root, self._m_as_symlink._root)
                if self._m_as_symlink._parent != self:
                    raise kaitaistruct.ConsistencyError(u"as_symlink", self, self._m_as_symlink._parent)

            self._dirty = False

        @property
        def as_dir(self):
            if self._should_write_as_dir:
                self._write_as_dir()
            if hasattr(self, '_m_as_dir'):
                return self._m_as_dir

            if not self.as_dir__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._raw__m_as_dir = io.read_bytes(self.size)
            _io__raw__m_as_dir = KaitaiStream(BytesIO(self._raw__m_as_dir))
            self._m_as_dir = Cramfs.DirInode(_io__raw__m_as_dir, self, self._root)
            self._m_as_dir._read()
            io.seek(_pos)
            return getattr(self, '_m_as_dir', None)

        @as_dir.setter
        def as_dir(self, v):
            self._dirty = True
            self._m_as_dir = v

        def _write_as_dir(self):
            self._should_write_as_dir = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            _io__raw__m_as_dir = KaitaiStream(BytesIO(bytearray(self.size)))
            io.add_child_stream(_io__raw__m_as_dir)
            _pos2 = io.pos()
            io.seek(io.pos() + (self.size))
            def handler(parent, _io__raw__m_as_dir=_io__raw__m_as_dir):
                self._raw__m_as_dir = _io__raw__m_as_dir.to_byte_array()
                if len(self._raw__m_as_dir) != self.size:
                    raise kaitaistruct.ConsistencyError(u"raw(as_dir)", self.size, len(self._raw__m_as_dir))
                parent.write_bytes(self._raw__m_as_dir)
            _io__raw__m_as_dir.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self._m_as_dir._write__seq(_io__raw__m_as_dir)
            io.seek(_pos)

        @property
        def as_reg_file(self):
            if self._should_write_as_reg_file:
                self._write_as_reg_file()
            if hasattr(self, '_m_as_reg_file'):
                return self._m_as_reg_file

            if not self.as_reg_file__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_as_reg_file = Cramfs.ChunkedDataInode(io, self, self._root)
            self._m_as_reg_file._read()
            io.seek(_pos)
            return getattr(self, '_m_as_reg_file', None)

        @as_reg_file.setter
        def as_reg_file(self, v):
            self._dirty = True
            self._m_as_reg_file = v

        def _write_as_reg_file(self):
            self._should_write_as_reg_file = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_as_reg_file._write__seq(io)
            io.seek(_pos)

        @property
        def as_symlink(self):
            if self._should_write_as_symlink:
                self._write_as_symlink()
            if hasattr(self, '_m_as_symlink'):
                return self._m_as_symlink

            if not self.as_symlink__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_as_symlink = Cramfs.ChunkedDataInode(io, self, self._root)
            self._m_as_symlink._read()
            io.seek(_pos)
            return getattr(self, '_m_as_symlink', None)

        @as_symlink.setter
        def as_symlink(self, v):
            self._dirty = True
            self._m_as_symlink = v

        def _write_as_symlink(self):
            self._should_write_as_symlink = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_as_symlink._write__seq(io)
            io.seek(_pos)

        @property
        def attr(self):
            if hasattr(self, '_m_attr'):
                return self._m_attr

            self._m_attr = self.mode >> 9 & 7
            return getattr(self, '_m_attr', None)

        def _invalidate_attr(self):
            del self._m_attr
        @property
        def gid(self):
            if hasattr(self, '_m_gid'):
                return self._m_gid

            self._m_gid = self.size_gid >> 24
            return getattr(self, '_m_gid', None)

        def _invalidate_gid(self):
            del self._m_gid
        @property
        def namelen(self):
            if hasattr(self, '_m_namelen'):
                return self._m_namelen

            self._m_namelen = (self.namelen_offset & 63) << 2
            return getattr(self, '_m_namelen', None)

        def _invalidate_namelen(self):
            del self._m_namelen
        @property
        def offset(self):
            if hasattr(self, '_m_offset'):
                return self._m_offset

            self._m_offset = (self.namelen_offset >> 6 & 67108863) << 2
            return getattr(self, '_m_offset', None)

        def _invalidate_offset(self):
            del self._m_offset
        @property
        def perm_g(self):
            if hasattr(self, '_m_perm_g'):
                return self._m_perm_g

            self._m_perm_g = self.mode >> 3 & 7
            return getattr(self, '_m_perm_g', None)

        def _invalidate_perm_g(self):
            del self._m_perm_g
        @property
        def perm_o(self):
            if hasattr(self, '_m_perm_o'):
                return self._m_perm_o

            self._m_perm_o = self.mode & 7
            return getattr(self, '_m_perm_o', None)

        def _invalidate_perm_o(self):
            del self._m_perm_o
        @property
        def perm_u(self):
            if hasattr(self, '_m_perm_u'):
                return self._m_perm_u

            self._m_perm_u = self.mode >> 6 & 7
            return getattr(self, '_m_perm_u', None)

        def _invalidate_perm_u(self):
            del self._m_perm_u
        @property
        def size(self):
            if hasattr(self, '_m_size'):
                return self._m_size

            self._m_size = self.size_gid & 16777215
            return getattr(self, '_m_size', None)

        def _invalidate_size(self):
            del self._m_size
        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = KaitaiStream.resolve_enum(Cramfs.Inode.FileType, self.mode >> 12 & 15)
            return getattr(self, '_m_type', None)

        def _invalidate_type(self):
            del self._m_type

    class SuperBlockStruct(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Cramfs.SuperBlockStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(4)
            if not self.magic == b"\x45\x3D\xCD\x28":
                raise kaitaistruct.ValidationNotEqualError(b"\x45\x3D\xCD\x28", self.magic, self._io, u"/types/super_block_struct/seq/0")
            self.size = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.future = self._io.read_u4le()
            self.signature = self._io.read_bytes(16)
            if not self.signature == b"\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53", self.signature, self._io, u"/types/super_block_struct/seq/4")
            self.fsid = Cramfs.Info(self._io, self, self._root)
            self.fsid._read()
            self.name = (self._io.read_bytes(16)).decode(u"ASCII")
            self.root = Cramfs.Inode(self._io, self, self._root)
            self.root._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.fsid._fetch_instances()
            self.root._fetch_instances()


        def _write__seq(self, io=None):
            super(Cramfs.SuperBlockStruct, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u4le(self.size)
            self._io.write_u4le(self.flags)
            self._io.write_u4le(self.future)
            self._io.write_bytes(self.signature)
            self.fsid._write__seq(self._io)
            self._io.write_bytes((self.name).encode(u"ASCII"))
            self.root._write__seq(self._io)


        def _check(self):
            if len(self.magic) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
            if not self.magic == b"\x45\x3D\xCD\x28":
                raise kaitaistruct.ValidationNotEqualError(b"\x45\x3D\xCD\x28", self.magic, None, u"/types/super_block_struct/seq/0")
            if len(self.signature) != 16:
                raise kaitaistruct.ConsistencyError(u"signature", 16, len(self.signature))
            if not self.signature == b"\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53":
                raise kaitaistruct.ValidationNotEqualError(b"\x43\x6F\x6D\x70\x72\x65\x73\x73\x65\x64\x20\x52\x4F\x4D\x46\x53", self.signature, None, u"/types/super_block_struct/seq/4")
            if self.fsid._root != self._root:
                raise kaitaistruct.ConsistencyError(u"fsid", self._root, self.fsid._root)
            if self.fsid._parent != self:
                raise kaitaistruct.ConsistencyError(u"fsid", self, self.fsid._parent)
            if len((self.name).encode(u"ASCII")) != 16:
                raise kaitaistruct.ConsistencyError(u"name", 16, len((self.name).encode(u"ASCII")))
            if self.root._root != self._root:
                raise kaitaistruct.ConsistencyError(u"root", self._root, self.root._root)
            if self.root._parent != self:
                raise kaitaistruct.ConsistencyError(u"root", self, self.root._parent)
            self._dirty = False

        @property
        def flag_fsid_v2(self):
            if hasattr(self, '_m_flag_fsid_v2'):
                return self._m_flag_fsid_v2

            self._m_flag_fsid_v2 = self.flags >> 0 & 1
            return getattr(self, '_m_flag_fsid_v2', None)

        def _invalidate_flag_fsid_v2(self):
            del self._m_flag_fsid_v2
        @property
        def flag_holes(self):
            if hasattr(self, '_m_flag_holes'):
                return self._m_flag_holes

            self._m_flag_holes = self.flags >> 8 & 1
            return getattr(self, '_m_flag_holes', None)

        def _invalidate_flag_holes(self):
            del self._m_flag_holes
        @property
        def flag_shifted_root_offset(self):
            if hasattr(self, '_m_flag_shifted_root_offset'):
                return self._m_flag_shifted_root_offset

            self._m_flag_shifted_root_offset = self.flags >> 10 & 1
            return getattr(self, '_m_flag_shifted_root_offset', None)

        def _invalidate_flag_shifted_root_offset(self):
            del self._m_flag_shifted_root_offset
        @property
        def flag_sorted_dirs(self):
            if hasattr(self, '_m_flag_sorted_dirs'):
                return self._m_flag_sorted_dirs

            self._m_flag_sorted_dirs = self.flags >> 1 & 1
            return getattr(self, '_m_flag_sorted_dirs', None)

        def _invalidate_flag_sorted_dirs(self):
            del self._m_flag_sorted_dirs
        @property
        def flag_wrong_signature(self):
            if hasattr(self, '_m_flag_wrong_signature'):
                return self._m_flag_wrong_signature

            self._m_flag_wrong_signature = self.flags >> 9 & 1
            return getattr(self, '_m_flag_wrong_signature', None)

        def _invalidate_flag_wrong_signature(self):
            del self._m_flag_wrong_signature

    @property
    def page_size(self):
        if hasattr(self, '_m_page_size'):
            return self._m_page_size

        self._m_page_size = 4096
        return getattr(self, '_m_page_size', None)

    def _invalidate_page_size(self):
        del self._m_page_size

