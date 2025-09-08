# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MicrosoftCfb(ReadWriteKaitaiStruct):
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MicrosoftCfb, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_dir = False
        self.dir__enabled = True
        self._should_write_fat = False
        self.fat__enabled = True

    def _read(self):
        self.header = MicrosoftCfb.CfbHeader(self._io, self, self._root)
        self.header._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _ = self.dir
        if hasattr(self, '_m_dir'):
            pass
            self._m_dir._fetch_instances()

        _ = self.fat
        if hasattr(self, '_m_fat'):
            pass
            self._m_fat._fetch_instances()



    def _write__seq(self, io=None):
        super(MicrosoftCfb, self)._write__seq(io)
        self._should_write_dir = self.dir__enabled
        self._should_write_fat = self.fat__enabled
        self.header._write__seq(self._io)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        if self.dir__enabled:
            pass
            if self._m_dir._root != self._root:
                raise kaitaistruct.ConsistencyError(u"dir", self._root, self._m_dir._root)
            if self._m_dir._parent != self:
                raise kaitaistruct.ConsistencyError(u"dir", self, self._m_dir._parent)

        if self.fat__enabled:
            pass
            if self._m_fat._root != self._root:
                raise kaitaistruct.ConsistencyError(u"fat", self._root, self._m_fat._root)
            if self._m_fat._parent != self:
                raise kaitaistruct.ConsistencyError(u"fat", self, self._m_fat._parent)

        self._dirty = False

    class CfbHeader(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftCfb.CfbHeader, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.signature = self._io.read_bytes(8)
            if not self.signature == b"\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1":
                raise kaitaistruct.ValidationNotEqualError(b"\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1", self.signature, self._io, u"/types/cfb_header/seq/0")
            self.clsid = self._io.read_bytes(16)
            if not self.clsid == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.clsid, self._io, u"/types/cfb_header/seq/1")
            self.version_minor = self._io.read_u2le()
            self.version_major = self._io.read_u2le()
            self.byte_order = self._io.read_bytes(2)
            if not self.byte_order == b"\xFE\xFF":
                raise kaitaistruct.ValidationNotEqualError(b"\xFE\xFF", self.byte_order, self._io, u"/types/cfb_header/seq/4")
            self.sector_shift = self._io.read_u2le()
            self.mini_sector_shift = self._io.read_u2le()
            self.reserved1 = self._io.read_bytes(6)
            self.size_dir = self._io.read_s4le()
            self.size_fat = self._io.read_s4le()
            self.ofs_dir = self._io.read_s4le()
            self.transaction_seq = self._io.read_s4le()
            self.mini_stream_cutoff_size = self._io.read_s4le()
            self.ofs_mini_fat = self._io.read_s4le()
            self.size_mini_fat = self._io.read_s4le()
            self.ofs_difat = self._io.read_s4le()
            self.size_difat = self._io.read_s4le()
            self.difat = []
            for i in range(109):
                self.difat.append(self._io.read_s4le())

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.difat)):
                pass



        def _write__seq(self, io=None):
            super(MicrosoftCfb.CfbHeader, self)._write__seq(io)
            self._io.write_bytes(self.signature)
            self._io.write_bytes(self.clsid)
            self._io.write_u2le(self.version_minor)
            self._io.write_u2le(self.version_major)
            self._io.write_bytes(self.byte_order)
            self._io.write_u2le(self.sector_shift)
            self._io.write_u2le(self.mini_sector_shift)
            self._io.write_bytes(self.reserved1)
            self._io.write_s4le(self.size_dir)
            self._io.write_s4le(self.size_fat)
            self._io.write_s4le(self.ofs_dir)
            self._io.write_s4le(self.transaction_seq)
            self._io.write_s4le(self.mini_stream_cutoff_size)
            self._io.write_s4le(self.ofs_mini_fat)
            self._io.write_s4le(self.size_mini_fat)
            self._io.write_s4le(self.ofs_difat)
            self._io.write_s4le(self.size_difat)
            for i in range(len(self.difat)):
                pass
                self._io.write_s4le(self.difat[i])



        def _check(self):
            if len(self.signature) != 8:
                raise kaitaistruct.ConsistencyError(u"signature", 8, len(self.signature))
            if not self.signature == b"\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1":
                raise kaitaistruct.ValidationNotEqualError(b"\xD0\xCF\x11\xE0\xA1\xB1\x1A\xE1", self.signature, None, u"/types/cfb_header/seq/0")
            if len(self.clsid) != 16:
                raise kaitaistruct.ConsistencyError(u"clsid", 16, len(self.clsid))
            if not self.clsid == b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00", self.clsid, None, u"/types/cfb_header/seq/1")
            if len(self.byte_order) != 2:
                raise kaitaistruct.ConsistencyError(u"byte_order", 2, len(self.byte_order))
            if not self.byte_order == b"\xFE\xFF":
                raise kaitaistruct.ValidationNotEqualError(b"\xFE\xFF", self.byte_order, None, u"/types/cfb_header/seq/4")
            if len(self.reserved1) != 6:
                raise kaitaistruct.ConsistencyError(u"reserved1", 6, len(self.reserved1))
            if len(self.difat) != 109:
                raise kaitaistruct.ConsistencyError(u"difat", 109, len(self.difat))
            for i in range(len(self.difat)):
                pass

            self._dirty = False


    class DirEntry(ReadWriteKaitaiStruct):

        class ObjType(IntEnum):
            unknown = 0
            storage = 1
            stream = 2
            root_storage = 5

        class RbColor(IntEnum):
            red = 0
            black = 1
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftCfb.DirEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_child = False
            self.child__enabled = True
            self._should_write_left_sibling = False
            self.left_sibling__enabled = True
            self._should_write_mini_stream = False
            self.mini_stream__enabled = True
            self._should_write_right_sibling = False
            self.right_sibling__enabled = True

        def _read(self):
            self.name = (self._io.read_bytes(64)).decode(u"UTF-16LE")
            self.name_len = self._io.read_u2le()
            self.object_type = KaitaiStream.resolve_enum(MicrosoftCfb.DirEntry.ObjType, self._io.read_u1())
            self.color_flag = KaitaiStream.resolve_enum(MicrosoftCfb.DirEntry.RbColor, self._io.read_u1())
            self.left_sibling_id = self._io.read_s4le()
            self.right_sibling_id = self._io.read_s4le()
            self.child_id = self._io.read_s4le()
            self.clsid = self._io.read_bytes(16)
            self.state = self._io.read_u4le()
            self.time_create = self._io.read_u8le()
            self.time_mod = self._io.read_u8le()
            self.ofs = self._io.read_s4le()
            self.size = self._io.read_u8le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.child
            if hasattr(self, '_m_child'):
                pass
                self._m_child._fetch_instances()

            _ = self.left_sibling
            if hasattr(self, '_m_left_sibling'):
                pass
                self._m_left_sibling._fetch_instances()

            _ = self.mini_stream
            if hasattr(self, '_m_mini_stream'):
                pass

            _ = self.right_sibling
            if hasattr(self, '_m_right_sibling'):
                pass
                self._m_right_sibling._fetch_instances()



        def _write__seq(self, io=None):
            super(MicrosoftCfb.DirEntry, self)._write__seq(io)
            self._should_write_child = self.child__enabled
            self._should_write_left_sibling = self.left_sibling__enabled
            self._should_write_mini_stream = self.mini_stream__enabled
            self._should_write_right_sibling = self.right_sibling__enabled
            self._io.write_bytes((self.name).encode(u"UTF-16LE"))
            self._io.write_u2le(self.name_len)
            self._io.write_u1(int(self.object_type))
            self._io.write_u1(int(self.color_flag))
            self._io.write_s4le(self.left_sibling_id)
            self._io.write_s4le(self.right_sibling_id)
            self._io.write_s4le(self.child_id)
            self._io.write_bytes(self.clsid)
            self._io.write_u4le(self.state)
            self._io.write_u8le(self.time_create)
            self._io.write_u8le(self.time_mod)
            self._io.write_s4le(self.ofs)
            self._io.write_u8le(self.size)


        def _check(self):
            if len((self.name).encode(u"UTF-16LE")) != 64:
                raise kaitaistruct.ConsistencyError(u"name", 64, len((self.name).encode(u"UTF-16LE")))
            if len(self.clsid) != 16:
                raise kaitaistruct.ConsistencyError(u"clsid", 16, len(self.clsid))
            if self.child__enabled:
                pass
                if self.child_id != -1:
                    pass
                    if self._m_child._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"child", self._root, self._m_child._root)
                    if self._m_child._parent != self:
                        raise kaitaistruct.ConsistencyError(u"child", self, self._m_child._parent)


            if self.left_sibling__enabled:
                pass
                if self.left_sibling_id != -1:
                    pass
                    if self._m_left_sibling._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"left_sibling", self._root, self._m_left_sibling._root)
                    if self._m_left_sibling._parent != self:
                        raise kaitaistruct.ConsistencyError(u"left_sibling", self, self._m_left_sibling._parent)


            if self.mini_stream__enabled:
                pass
                if self.object_type == MicrosoftCfb.DirEntry.ObjType.root_storage:
                    pass
                    if len(self._m_mini_stream) != self.size:
                        raise kaitaistruct.ConsistencyError(u"mini_stream", self.size, len(self._m_mini_stream))


            if self.right_sibling__enabled:
                pass
                if self.right_sibling_id != -1:
                    pass
                    if self._m_right_sibling._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"right_sibling", self._root, self._m_right_sibling._root)
                    if self._m_right_sibling._parent != self:
                        raise kaitaistruct.ConsistencyError(u"right_sibling", self, self._m_right_sibling._parent)


            self._dirty = False

        @property
        def child(self):
            if self._should_write_child:
                self._write_child()
            if hasattr(self, '_m_child'):
                return self._m_child

            if not self.child__enabled:
                return None

            if self.child_id != -1:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.header.ofs_dir + 1) * self._root.sector_size + self.child_id * 128)
                self._m_child = MicrosoftCfb.DirEntry(io, self, self._root)
                self._m_child._read()
                io.seek(_pos)

            return getattr(self, '_m_child', None)

        @child.setter
        def child(self, v):
            self._dirty = True
            self._m_child = v

        def _write_child(self):
            self._should_write_child = False
            if self.child_id != -1:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.header.ofs_dir + 1) * self._root.sector_size + self.child_id * 128)
                self._m_child._write__seq(io)
                io.seek(_pos)


        @property
        def left_sibling(self):
            if self._should_write_left_sibling:
                self._write_left_sibling()
            if hasattr(self, '_m_left_sibling'):
                return self._m_left_sibling

            if not self.left_sibling__enabled:
                return None

            if self.left_sibling_id != -1:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.header.ofs_dir + 1) * self._root.sector_size + self.left_sibling_id * 128)
                self._m_left_sibling = MicrosoftCfb.DirEntry(io, self, self._root)
                self._m_left_sibling._read()
                io.seek(_pos)

            return getattr(self, '_m_left_sibling', None)

        @left_sibling.setter
        def left_sibling(self, v):
            self._dirty = True
            self._m_left_sibling = v

        def _write_left_sibling(self):
            self._should_write_left_sibling = False
            if self.left_sibling_id != -1:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.header.ofs_dir + 1) * self._root.sector_size + self.left_sibling_id * 128)
                self._m_left_sibling._write__seq(io)
                io.seek(_pos)


        @property
        def mini_stream(self):
            if self._should_write_mini_stream:
                self._write_mini_stream()
            if hasattr(self, '_m_mini_stream'):
                return self._m_mini_stream

            if not self.mini_stream__enabled:
                return None

            if self.object_type == MicrosoftCfb.DirEntry.ObjType.root_storage:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self.ofs + 1) * self._root.sector_size)
                self._m_mini_stream = io.read_bytes(self.size)
                io.seek(_pos)

            return getattr(self, '_m_mini_stream', None)

        @mini_stream.setter
        def mini_stream(self, v):
            self._dirty = True
            self._m_mini_stream = v

        def _write_mini_stream(self):
            self._should_write_mini_stream = False
            if self.object_type == MicrosoftCfb.DirEntry.ObjType.root_storage:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self.ofs + 1) * self._root.sector_size)
                io.write_bytes(self._m_mini_stream)
                io.seek(_pos)


        @property
        def right_sibling(self):
            if self._should_write_right_sibling:
                self._write_right_sibling()
            if hasattr(self, '_m_right_sibling'):
                return self._m_right_sibling

            if not self.right_sibling__enabled:
                return None

            if self.right_sibling_id != -1:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.header.ofs_dir + 1) * self._root.sector_size + self.right_sibling_id * 128)
                self._m_right_sibling = MicrosoftCfb.DirEntry(io, self, self._root)
                self._m_right_sibling._read()
                io.seek(_pos)

            return getattr(self, '_m_right_sibling', None)

        @right_sibling.setter
        def right_sibling(self, v):
            self._dirty = True
            self._m_right_sibling = v

        def _write_right_sibling(self):
            self._should_write_right_sibling = False
            if self.right_sibling_id != -1:
                pass
                io = self._root._io
                _pos = io.pos()
                io.seek((self._root.header.ofs_dir + 1) * self._root.sector_size + self.right_sibling_id * 128)
                self._m_right_sibling._write__seq(io)
                io.seek(_pos)



    class FatEntries(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MicrosoftCfb.FatEntries, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(self._io.read_s4le())
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass



        def _write__seq(self, io=None):
            super(MicrosoftCfb.FatEntries, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self._io.write_s4le(self.entries[i])

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass

            self._dirty = False


    @property
    def dir(self):
        if self._should_write_dir:
            self._write_dir()
        if hasattr(self, '_m_dir'):
            return self._m_dir

        if not self.dir__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek((self.header.ofs_dir + 1) * self.sector_size)
        self._m_dir = MicrosoftCfb.DirEntry(self._io, self, self._root)
        self._m_dir._read()
        self._io.seek(_pos)
        return getattr(self, '_m_dir', None)

    @dir.setter
    def dir(self, v):
        self._dirty = True
        self._m_dir = v

    def _write_dir(self):
        self._should_write_dir = False
        _pos = self._io.pos()
        self._io.seek((self.header.ofs_dir + 1) * self.sector_size)
        self._m_dir._write__seq(self._io)
        self._io.seek(_pos)

    @property
    def fat(self):
        if self._should_write_fat:
            self._write_fat()
        if hasattr(self, '_m_fat'):
            return self._m_fat

        if not self.fat__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.sector_size)
        self._raw__m_fat = self._io.read_bytes(self.header.size_fat * self.sector_size)
        _io__raw__m_fat = KaitaiStream(BytesIO(self._raw__m_fat))
        self._m_fat = MicrosoftCfb.FatEntries(_io__raw__m_fat, self, self._root)
        self._m_fat._read()
        self._io.seek(_pos)
        return getattr(self, '_m_fat', None)

    @fat.setter
    def fat(self, v):
        self._dirty = True
        self._m_fat = v

    def _write_fat(self):
        self._should_write_fat = False
        _pos = self._io.pos()
        self._io.seek(self.sector_size)
        _io__raw__m_fat = KaitaiStream(BytesIO(bytearray(self.header.size_fat * self.sector_size)))
        self._io.add_child_stream(_io__raw__m_fat)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.header.size_fat * self.sector_size))
        def handler(parent, _io__raw__m_fat=_io__raw__m_fat):
            self._raw__m_fat = _io__raw__m_fat.to_byte_array()
            if len(self._raw__m_fat) != self.header.size_fat * self.sector_size:
                raise kaitaistruct.ConsistencyError(u"raw(fat)", self.header.size_fat * self.sector_size, len(self._raw__m_fat))
            parent.write_bytes(self._raw__m_fat)
        _io__raw__m_fat.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self._m_fat._write__seq(_io__raw__m_fat)
        self._io.seek(_pos)

    @property
    def sector_size(self):
        if hasattr(self, '_m_sector_size'):
            return self._m_sector_size

        self._m_sector_size = 1 << self.header.sector_shift
        return getattr(self, '_m_sector_size', None)

    def _invalidate_sector_size(self):
        del self._m_sector_size

