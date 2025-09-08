# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Cramfs(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        super(Cramfs, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.super_block = Cramfs.SuperBlockStruct(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.super_block._fetch_instances()

    class ChunkedDataInode(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Cramfs.ChunkedDataInode, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.block_end_index = []
            for i in range(((self._parent.size + self._root.page_size) - 1) // self._root.page_size):
                self.block_end_index.append(self._io.read_u4le())

            self.raw_blocks = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass
            for i in range(len(self.block_end_index)):
                pass



    class DirInode(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Cramfs.DirInode, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            if self._io.size() > 0:
                pass
                self.children = []
                i = 0
                while not self._io.is_eof():
                    self.children.append(Cramfs.Inode(self._io, self, self._root))
                    i += 1




        def _fetch_instances(self):
            pass
            if self._io.size() > 0:
                pass
                for i in range(len(self.children)):
                    pass
                    self.children[i]._fetch_instances()




    class Info(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Cramfs.Info, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.crc = self._io.read_u4le()
            self.edition = self._io.read_u4le()
            self.blocks = self._io.read_u4le()
            self.files = self._io.read_u4le()


        def _fetch_instances(self):
            pass


    class Inode(KaitaiStruct):

        class FileType(IntEnum):
            fifo = 1
            chrdev = 2
            dir = 4
            blkdev = 6
            reg_file = 8
            symlink = 10
            socket = 12
        def __init__(self, _io, _parent=None, _root=None):
            super(Cramfs.Inode, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.mode = self._io.read_u2le()
            self.uid = self._io.read_u2le()
            self.size_gid = self._io.read_u4le()
            self.namelen_offset = self._io.read_u4le()
            self.name = (self._io.read_bytes(self.namelen)).decode(u"UTF-8")


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


        @property
        def as_dir(self):
            if hasattr(self, '_m_as_dir'):
                return self._m_as_dir

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._raw__m_as_dir = io.read_bytes(self.size)
            _io__raw__m_as_dir = KaitaiStream(BytesIO(self._raw__m_as_dir))
            self._m_as_dir = Cramfs.DirInode(_io__raw__m_as_dir, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_as_dir', None)

        @property
        def as_reg_file(self):
            if hasattr(self, '_m_as_reg_file'):
                return self._m_as_reg_file

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_as_reg_file = Cramfs.ChunkedDataInode(io, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_as_reg_file', None)

        @property
        def as_symlink(self):
            if hasattr(self, '_m_as_symlink'):
                return self._m_as_symlink

            io = self._root._io
            _pos = io.pos()
            io.seek(self.offset)
            self._m_as_symlink = Cramfs.ChunkedDataInode(io, self, self._root)
            io.seek(_pos)
            return getattr(self, '_m_as_symlink', None)

        @property
        def attr(self):
            if hasattr(self, '_m_attr'):
                return self._m_attr

            self._m_attr = self.mode >> 9 & 7
            return getattr(self, '_m_attr', None)

        @property
        def gid(self):
            if hasattr(self, '_m_gid'):
                return self._m_gid

            self._m_gid = self.size_gid >> 24
            return getattr(self, '_m_gid', None)

        @property
        def namelen(self):
            if hasattr(self, '_m_namelen'):
                return self._m_namelen

            self._m_namelen = (self.namelen_offset & 63) << 2
            return getattr(self, '_m_namelen', None)

        @property
        def offset(self):
            if hasattr(self, '_m_offset'):
                return self._m_offset

            self._m_offset = (self.namelen_offset >> 6 & 67108863) << 2
            return getattr(self, '_m_offset', None)

        @property
        def perm_g(self):
            if hasattr(self, '_m_perm_g'):
                return self._m_perm_g

            self._m_perm_g = self.mode >> 3 & 7
            return getattr(self, '_m_perm_g', None)

        @property
        def perm_o(self):
            if hasattr(self, '_m_perm_o'):
                return self._m_perm_o

            self._m_perm_o = self.mode & 7
            return getattr(self, '_m_perm_o', None)

        @property
        def perm_u(self):
            if hasattr(self, '_m_perm_u'):
                return self._m_perm_u

            self._m_perm_u = self.mode >> 6 & 7
            return getattr(self, '_m_perm_u', None)

        @property
        def size(self):
            if hasattr(self, '_m_size'):
                return self._m_size

            self._m_size = self.size_gid & 16777215
            return getattr(self, '_m_size', None)

        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = KaitaiStream.resolve_enum(Cramfs.Inode.FileType, self.mode >> 12 & 15)
            return getattr(self, '_m_type', None)


    class SuperBlockStruct(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Cramfs.SuperBlockStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
            self.name = (self._io.read_bytes(16)).decode(u"ASCII")
            self.root = Cramfs.Inode(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.fsid._fetch_instances()
            self.root._fetch_instances()

        @property
        def flag_fsid_v2(self):
            if hasattr(self, '_m_flag_fsid_v2'):
                return self._m_flag_fsid_v2

            self._m_flag_fsid_v2 = self.flags >> 0 & 1
            return getattr(self, '_m_flag_fsid_v2', None)

        @property
        def flag_holes(self):
            if hasattr(self, '_m_flag_holes'):
                return self._m_flag_holes

            self._m_flag_holes = self.flags >> 8 & 1
            return getattr(self, '_m_flag_holes', None)

        @property
        def flag_shifted_root_offset(self):
            if hasattr(self, '_m_flag_shifted_root_offset'):
                return self._m_flag_shifted_root_offset

            self._m_flag_shifted_root_offset = self.flags >> 10 & 1
            return getattr(self, '_m_flag_shifted_root_offset', None)

        @property
        def flag_sorted_dirs(self):
            if hasattr(self, '_m_flag_sorted_dirs'):
                return self._m_flag_sorted_dirs

            self._m_flag_sorted_dirs = self.flags >> 1 & 1
            return getattr(self, '_m_flag_sorted_dirs', None)

        @property
        def flag_wrong_signature(self):
            if hasattr(self, '_m_flag_wrong_signature'):
                return self._m_flag_wrong_signature

            self._m_flag_wrong_signature = self.flags >> 9 & 1
            return getattr(self, '_m_flag_wrong_signature', None)


    @property
    def page_size(self):
        if hasattr(self, '_m_page_size'):
            return self._m_page_size

        self._m_page_size = 4096
        return getattr(self, '_m_page_size', None)


